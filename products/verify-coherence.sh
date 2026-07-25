#!/usr/bin/env bash
# ClaudeFleet coherence check — guards defect class C17
# (cross-artifact reference desync in multi-agent-authored bundles).
#
# Docs must never reference a slash command or an agent that isn't shipped,
# and seed data must never name stages the skills don't assert.
# Executables are ground truth; docs move to match code, never the reverse.
#
# Usage:  bash products/verify-coherence.sh
# Exits non-zero on any desync.

set -uo pipefail
cd "$(dirname "$0")"

FAIL=0
note() { printf '  %s\n' "$*"; }
bad()  { printf '  ✗ %s\n' "$*"; FAIL=1; }
ok()   { printf '  ✓ %s\n' "$*"; }

CANON_CONTENT="Idea Script Render Assemble Scheduled"
CANON_PRODUCT="Validate Build Package Launch Scheduled"

for M in autopilot-content-machine digital-product-machine; do
  [ -d "$M" ] || { bad "$M/ missing"; continue; }
  printf '\n== %s ==\n' "$M"

  # Ground truth from shipped executables
  CMDS=$(ls "$M/skills" 2>/dev/null | sed 's/\.md$//' | sort)
  AGENTS=$(ls "$M/agents" 2>/dev/null | sed 's/\.md$//' | sort)
  [ -n "$CMDS" ]   || bad "no skills/ found"
  [ -n "$AGENTS" ] || bad "no agents/ found"
  VALID=$(printf '%s\n%s\n' "$CMDS" "$AGENTS" | sort -u)
  note "shipped: $(echo "$CMDS" | wc -l | tr -d ' ') skills, $(echo "$AGENTS" | wc -l | tr -d ' ') agents"

  # Every cf-*/dp-* identifier mentioned in any doc must be a shipped file.
  # Strip code fences' language tags and match bare identifiers.
  REFS=$(grep -rhoE '\b(cf|dp)-[a-z][a-z0-9-]*' "$M" --include='*.md' 2>/dev/null \
         | sed 's/[.,;:)]*$//' | sort -u)
  UNKNOWN=""
  for r in $REFS; do
    grep -qx "$r" <<<"$VALID" || UNKNOWN="$UNKNOWN $r"
  done
  if [ -n "$UNKNOWN" ]; then
    for u in $UNKNOWN; do bad "doc references '$u' — not in skills/ or agents/"; done
  else
    ok "every cf-/dp- identifier in docs resolves to a shipped file"
  fi

  # Reverse direction: a shipped skill nobody documents is dead weight.
  for c in $CMDS; do
    grep -rqE "\b$c\b" "$M" --include='*.md' 2>/dev/null \
      || bad "skill '$c' ships but no doc mentions it"
  done

  # Every _engine/... path a doc cites must exist in the canonical products/_engine/,
  # because package.sh copies that folder into the machine at package time.
  ENG_MISSING=0
  for p in $(grep -rhoE '_engine/[A-Za-z0-9._/-]+' "$M" --include='*.md' 2>/dev/null \
             | sed 's/[.,)`]*$//' | sort -u); do
    [ -e "_engine/${p#_engine/}" ] || { bad "doc cites '$p' but it is not in products/_engine/"; ENG_MISSING=1; }
  done
  [ "$ENG_MISSING" -eq 0 ] && ok "every _engine/... path cited resolves in products/_engine/"

  # No doc may claim a skill/agent auto-reads a config file the shipped code never opens.
  # Generalised: pull every *.md path a doc mentions, drop the ones the skills genuinely
  # read (grep the skills themselves) and the platform-loaded CLAUDE.md, then flag any
  # leftover that a doc pairs with a read-claim on the same line.
  SKILL_READS=$(cat "$M"/skills/*.md 2>/dev/null)
  CFG_HITS=""
  # Leading char is never '-', so a filename can't be mistaken for a grep option.
  for f in $(grep -rhoE '[A-Za-z0-9_][A-Za-z0-9_-]*\.md' "$M" --include='*.md' 2>/dev/null | sort -u); do
    case "$f" in
      CLAUDE.md) continue ;;                       # loaded by Claude Code itself
      0*-*.md|README.md) continue ;;               # the product's own docs
    esac
    printf '%s' "$SKILL_READS" | grep -qF -- "$f" && continue   # a skill really does read it
    H=$(grep -rnE -- "\b$f\b" "$M" --include='*.md' 2>/dev/null \
        | grep -E '(skills? (load|read)|agents? (load|read)|/(cf|dp)-[a-z]+ (reads|loads|follows|will follow)|obeys|auto-read|every stage reads)' \
        | grep -viE 'unread|never be opened|does not read|would sit|not read|binds nothing')
    [ -n "$H" ] && CFG_HITS="$CFG_HITS$H"$'\n'
  done
  if [ -n "$(printf '%s' "$CFG_HITS" | tr -d '[:space:]')" ]; then
    bad "a doc claims shipped code reads a file it never opens:"
    printf '%s' "$CFG_HITS" | sed '/^$/d;s/^/      /'
  else
    ok "no doc claims shipped code reads a file it never opens"
  fi

  # Cross-machine contamination (content docs citing /dp-*, or vice versa)
  case "$M" in
    autopilot-content-machine) WRONG='/dp-' ;;
    digital-product-machine)   WRONG='/cf-' ;;
  esac
  if grep -rqF "$WRONG" "$M" --include='*.md' 2>/dev/null; then
    bad "contains '$WRONG' commands from the other machine"
  else
    ok "no cross-machine command contamination"
  fi
done

# Seed data must not teach the user fictional stage names.
printf '\n== _engine seed data ==\n'
SEED=_engine/pipeline.example.json
if [ -f "$SEED" ]; then
  python3 -c "import json,sys; json.load(open('$SEED'))" 2>/dev/null \
    && ok "pipeline.example.json is valid JSON" \
    || bad "pipeline.example.json is not valid JSON"
  STAGES=$(python3 -c "
import json
print(' '.join(json.load(open('$SEED')).get('stages',[])))
" 2>/dev/null)
  if [ "$STAGES" = "$CANON_CONTENT" ] || [ "$STAGES" = "$CANON_PRODUCT" ]; then
    ok "seed stages match canon: $STAGES"
  else
    bad "seed stages '$STAGES' match neither canon set"
    note "expected '$CANON_CONTENT' or '$CANON_PRODUCT'"
  fi
  # Commands cited in the seed log must exist somewhere in the bundle
  for c in $(grep -oE '/(cf|dp)-[a-z-]+' "$SEED" | sed 's|^/||' | sort -u); do
    [ -f "autopilot-content-machine/skills/$c.md" ] || [ -f "digital-product-machine/skills/$c.md" ] \
      || bad "seed log cites '/$c' which is not a shipped skill"
  done
else
  bad "$SEED missing"
fi

# --- install-integrity checks (found by dogfooding the real zip, 2026-07-25) ---
ING=_engine/INSTALL.md
if [ -f "$ING" ]; then
  # 1. The documented FLEET_SRC must be a folder the zip actually produces.
  for p in $(grep -oE 'FLEET_SRC="\$HOME/Downloads/[a-z-]+"' "$ING" | sed 's|.*/||;s|"||'); do
    [ -d "$p" ] && ok "INSTALL.md's FLEET_SRC example '$p' is a real machine folder" \
                || bad "INSTALL.md tells buyers to use '$p', which no zip produces"
  done
  # 2. Every directory a skill writes into must be created by the install.
  MK=$(grep -A2 'mkdir -p "\$CLAUDEFLEET_HOME/logs"' "$ING" | tr -d '\\\n')
  MISS=0
  for d in $(grep -rhoE '(content|product)-machine/[a-z]+/' autopilot-content-machine/skills/*.md 2>/dev/null \
             | sed 's|.*machine/||;s|/||' | sort -u); do
    printf '%s' "$MK" | grep -q "$d" || { bad "skills write to '$d/' but INSTALL.md never creates it"; MISS=1; }
  done
  [ "$MISS" -eq 0 ] && ok "install creates every directory the skills write into"
fi
# 3. Seed data must self-declare as demo, or the panel shows fabricated cards unflagged.
if [ -f "$SEED" ]; then
  python3 -c "
import json,sys; d=json.load(open('$SEED'))
sys.exit(0 if d.get('demo') is True else 1)" 2>/dev/null \
    && ok "seed declares demo:true (panel will warn + offer Clear)" \
    || bad "seed has demo:false but ships fabricated cards — panel will show them as real state"
fi

# The admin panel's command config must match shipped skills too.
PANEL=_engine/admin-panel/index.html
if [ -f "$PANEL" ]; then
  for c in $(grep -oE 'command:"/(cf|dp)-[a-z-]+"' "$PANEL" | sed 's|.*"/||;s|"$||' | sort -u); do
    [ -f "autopilot-content-machine/skills/$c.md" ] || [ -f "digital-product-machine/skills/$c.md" ] \
      || bad "admin panel offers '/$c' which is not a shipped skill"
  done
  ok "admin panel command config checked"
fi

printf '\n'
if [ "$FAIL" -eq 0 ]; then
  printf 'COHERENCE OK — docs, seed data and panel all match the shipped executables.\n'
else
  printf 'COHERENCE FAILED — see ✗ above. Docs move to match code, never the reverse.\n'
fi
exit "$FAIL"
