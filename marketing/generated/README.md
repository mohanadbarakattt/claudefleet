# Generated Video Assets — ClaudeFleet Launch Reels

**Status: complete.** All 24 scenes generated via Higgsfield (`kling3_0_turbo`,
9:16, 4s each) directly from the prompts in `../higgsfield-prompts.md` — this
is the actual rendered output, downloaded and saved in `clips/`. Total cost:
144 credits (6 credits × 24 clips). See `manifest.json` for the reel → scene
→ file → job ID map.

## What's here
- `clips/reel{1-6}-scene{1-4}.mp4` — 24 files, ~85MB total, ready to edit.
- `manifest.json` — machine-readable mapping (reel title, CTA keyword, scene
  role, file path, original Higgsfield job ID for regeneration/reference).

## What to do with these
1. Open `clips/` — each reel's 4 scenes are numbered in cut order.
2. Import into CapCut (or any editor) in scene order (1→2→3→4).
3. Add the voiceover + on-screen text from `../reel-scripts.md` (hook/plot/
   payoff/CTA are already written per reel).
4. Post in the order from `../reel-scripts.md`'s posting notes:
   5 → 1 → 2 → 3 → 6 → 4.

## What these are (and aren't)
Clips are AI-generated stylized footage (holograms, abstract desks, macro
shots, a recurring "man in a home office" character) — not real people
claiming real results, consistent with the compliance rules in
`../content-system.md`. No character reference image was supplied to
Higgsfield, so the "man" character's exact appearance varies slightly
between scenes within the same reel — expected for a first pass. If a cut
needs tighter face/outfit consistency across scenes, regenerate that scene
with `medias: [{role: "start_image", value: <uploaded reference photo>}]`
using the job IDs in `manifest.json` as a prompt starting point.

## Note on Higgsfield preset auto-matching
A few prompts were close enough to built-in Higgsfield presets ("IN THE
DARK", "Earth zoom out") that the API offered to use the preset instead.
Every one of those was declined in favor of generating the literal prompt
from `higgsfield-prompts.md`, so all 24 clips match the original creative
direction, not a generic preset look.
