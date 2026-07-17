# Generated Video Assets — ClaudeFleet Launch Reels

**Status: complete, 2 clips patched.** All 24 scenes generated via Higgsfield
(`kling3_0_turbo`, 9:16, 4s each). Total cost: 156 credits (144 for the
original 24 + 12 for the 2 text-fix regenerations below). See
`manifest.json` for the reel → scene → file → job ID map.

**Shooting script is now `../production-scripts.md`**, not
`../reel-scripts.md` — it's the rewritten, higher-quality version with a
4-column format, per-reel psychological hook, and the correct Higgsfield
mode named for every shot. `../higgsfield-technique-guide.md` explains why
(which Higgsfield surface to use for what, and the prompt rules below).

## What's here
- `clips/reel{1-6}-scene{1-4}.mp4` — 24 files, ~85MB total, ready to edit.
- `manifest.json` — machine-readable mapping (reel title, CTA keyword, scene
  role, file path, original Higgsfield job ID; patched entries carry a
  `note` explaining the fix).

## Bug found and fixed: garbled on-screen text
Two of the original 24 prompts asked the video model to render literal
words on screen (`reel5-scene3`: "PROMPT → DELIVERABLE → PRICE → BUYER";
`reel6-scene3`: "APPROVED" stamps). Kling — like most video-generation
models — warps text, so both clips came out with illegible on-screen
words. Both were rewritten as text-free abstract motion (glowing
sequenced nodes; folding translucent cards) and regenerated — same
camera direction and mood, no rendering risk. Fixed 2026-07-17, 12 credits.
The lesson is now a standing rule in `../higgsfield-technique-guide.md`:
never put literal text in a Cinema Studio / Marketing Studio prompt — use
Vibe Motion (a different, UI-code-based Higgsfield surface) for anything
that needs to show real words.

## What to do with these
1. Open `clips/` — each reel's 4 scenes are numbered in cut order.
2. Import into CapCut (or any editor) in scene order (1→2→3→4).
3. Add the voiceover + on-screen text from `../production-scripts.md`
   (per-shot dialogue and text cards are already written per reel).
4. Post in the order from `../production-scripts.md`'s posting notes:
   5 → 1 → 2 → 3 → 6 → 4. Note Reel 4 is screen-record only by design —
   don't cut AI-generated clips into it.

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
Every one of those was declined in favor of generating the literal prompt,
so all clips match the original creative direction, not a generic preset
look.

## Not yet done (flagged for a credit-spend decision, not run automatically)
- **Reel 6 through actual Hyper Motion** (Marketing Studio's CGI-grade
  preset) instead of plain Cinema Studio — would tighten the hologram
  compositing. Costs more per clip; your call.
- **Reel 4 through Marketing Studio "App" mode** pointed at the real live
  site (`https://site-delta-hazel-30.vercel.app`) — pulls the actual UI
  into a composited ad instead of a plain screen recording. See
  `../higgsfield-technique-guide.md` for the exact steps. 12–15s minimum
  duration, costs more than a 4s Cinema Studio clip — not run since you
  flagged wanting to conserve credits for another project.
