#!/usr/bin/env bash
# Package the two ClaudeFleet machines for upload to Gumroad/LemonSqueezy.
#
# Each machine zip is SELF-CONTAINED: it carries its own copy of the shared
# engine at <machine>/_engine/, which is exactly the path every doc references
# ($FLEET_SRC/_engine). The repo keeps one canonical _engine/ so there is a
# single source to edit; this script fans it out at package time.
#
# Bonus material from the retired catalog rides along per _archive/README.md.
#
# Usage: bash package.sh

set -euo pipefail
cd "$(dirname "$0")"

DIST=dist
SRC=products
STAGE=".pkg-stage"

# Refuse to ship an incoherent bundle (defect class C17).
echo "→ Running coherence check before packaging…"
if ! bash "$SRC/verify-coherence.sh" >/dev/null 2>&1; then
  echo "✗ COHERENCE CHECK FAILED — refusing to package."
  echo "  Run: bash $SRC/verify-coherence.sh"
  exit 1
fi
echo "✓ Coherence OK"

rm -rf "$STAGE" "$DIST"
mkdir -p "$DIST" "$STAGE"

pack () {
  local machine="$1" bonus="$2" zipname="$3"
  local dest="$STAGE/$machine"

  mkdir -p "$dest"
  cp -R "$SRC/$machine/." "$dest/"
  cp -R "$SRC/_engine" "$dest/_engine"          # docs reference $FLEET_SRC/_engine

  if [ -n "$bonus" ] && [ -d "$SRC/_archive/$bonus" ]; then
    mkdir -p "$dest/bonus"
    cp -R "$SRC/_archive/$bonus" "$dest/bonus/$bonus"
    cat > "$dest/bonus/README.md" <<EOF
# Bonus material

Included free with this machine. It is supporting reference, not part of the
pipeline — the machine runs fine without it.

- \`$bonus/\` — see its own README for what's inside and how it complements
  the stages in \`01-architecture.md\`.
EOF
  fi

  ( cd "$STAGE" && zip -qr "../$DIST/$zipname" "$machine" )
  echo "  ✓ $zipname  ($(du -h "$DIST/$zipname" | cut -f1 | tr -d ' '))"
}

echo "→ Packaging machines…"
pack autopilot-content-machine prompt-vault      claudefleet-content-machine.zip
pack digital-product-machine   claude-money-os   claudefleet-product-machine.zip

echo "→ Packaging bundle…"
( cd "$STAGE" && zip -qr "../$DIST/claudefleet-both-machines.zip" \
    autopilot-content-machine digital-product-machine )
echo "  ✓ claudefleet-both-machines.zip  ($(du -h "$DIST/claudefleet-both-machines.zip" | cut -f1 | tr -d ' '))"

rm -rf "$STAGE"

echo
echo "Done. Upload from $DIST/:"
echo "  claudefleet-content-machine.zip   → \$99"
echo "  claudefleet-product-machine.zip   → \$99"
echo "  claudefleet-both-machines.zip     → \$149"
