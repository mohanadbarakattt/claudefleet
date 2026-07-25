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

  # No doc may claim a skill/agent auto-reads a standalone config file. The skills read
  # the intake note and pipeline.json — nothing else. Line-scoped: the filename and the
  # read-claim must appear together, so "cf-render reads my figure from me" stays legal.
  CFG_HITS=$(grep -rnE '(render-spec|channels)\.md' "$M" --include='*.md' 2>/dev/null \
             | grep -E '(reads|read by|will follow|follows|auto-read)' \
             | grep -viE 'unread|never be opened|does not read|would sit|not read')
  if [ -n "$CFG_HITS" ]; then
    bad "a doc claims a skill/agent auto-reads a standalone config file:"
    printf '%s\n' "$CFG_HITS" | sed 's/^/      /'
  else
    ok "no doc claims a skill/agent auto-reads a standalone config file"
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
