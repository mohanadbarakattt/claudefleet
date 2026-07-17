# Higgsfield Technique Guide — which tool for which ClaudeFleet asset

Quick reference so future asset generation picks the right Higgsfield surface
instead of defaulting to "generic AI video" every time. Written for this
project specifically — not a copy of Higgsfield's own docs, just the parts
that apply to us.

## The decision

| You need... | Use | Why |
|---|---|---|
| A stylized abstract Reel scene (hologram desk, floating cards, glowing folder) | **Cinema Studio** (`kling3_0_turbo` etc. via MCP) | What we already used for the 24 launch clips. Fine for abstract motion, bad at rendering words. |
| The same, but with tighter camera physics / CGI product-reveal polish | **Hyper Motion** (Marketing Studio) | Built specifically for premium reveal shots — the "phone crashes into a void, product assembles" style. Reel 6 is the best candidate. |
| A talking-to-camera testimonial-style ad, built from our real site | **Marketing Studio → App mode (UGC)** | Paste the live URL, it pulls real UI + product info automatically, pick an avatar, generate. See below. |
| A longer lifestyle/brand narrative for YouTube or the site itself, not just Reels | **Marketing Studio → TV Spot (16:9)** | Same pull-from-URL flow, longer format, cinematic pacing. |
| Anything with **readable on-screen text** — hero headline animation, feature-card micro-interactions, pricing reveal on the site | **Vibe Motion** (web app only — not in the MCP tool list, must be run at higgsfield.ai) | Generates real UI/motion code, not video pixels — this is the only mode where text stays sharp. Cinema Studio and Marketing Studio video models both warp on-screen words (this is exactly what broke 2 of our first 24 clips — see `generated/README.md`). |
| A structured "how it works" explainer with narration | **Explainer** (web app) | Paste a URL (our site) or describe the topic, pick a visual preset, set duration/voice, generate a complete narrated video in one pass. Good candidate for a "how ClaudeFleet Machines works" explainer if we want one later. |

## Marketing Studio "App" mode — run this on our real site

This is the highest-leverage thing we haven't done yet: point Higgsfield at
the actual live product instead of describing it from scratch.

1. Open Higgsfield → Marketing Studio → **App**.
2. Paste: `https://site-delta-hazel-30.vercel.app` (or the `claudefleet.com`
   domain once it's registered — re-run this once that's live, the ad will
   look more credible with the real domain visible).
3. It fetches the site — pulls the logo, copy, product cards, color palette
   automatically. No manual screenshotting needed.
4. Set format: **mobile / 9:16** for Reels.
5. Pick an avatar (or none, for a pure UI-reveal cut).
6. Prompt — use Reel 4's script from `production-scripts.md` as the brief,
   not verbatim: describe the moment (someone discovering the site, scrolling
   the product cards, landing on the $129 bundle), the mood (confident, a
   little "wait, this is real?"), and let Marketing Studio handle camera
   moves and audio.
7. Generate.

**Cost note:** Marketing Studio videos have a 12–15s minimum duration and
generally cost more per clip than a plain 4s Cinema Studio shot — check the
in-app credit estimate before generating, same as we did for every clip in
this repo. Not run automatically here; flagged for you to trigger when
you're ready to spend on it.

## Prompt-writing rules we learned the hard way

1. **Never put literal words in a Cinema Studio / Marketing Studio video
   prompt.** No "APPROVED" stamps, no "PROMPT → DELIVERABLE" text lines. If
   the shot needs to communicate a word, either (a) redesign it as pure
   abstract motion (a glow, a pulse, a fold) or (b) build it in Vibe Motion
   instead, where text is a first-class element, not a rendering guess.
2. **One clear reaction per clip.** A prompt trying to show three things
   happening at once tends to blur all three. Split it into two clips if
   needed — we're already cutting scenes together in CapCut regardless.
3. **Name the camera move explicitly.** "Slow dolly-in," "orbital arc,"
   "static with a push-in" — every clip in `production-scripts.md` does
   this on purpose. Vague prompts get vague, drifting camera motion.
4. **Keep the same style anchor phrase across a reel's clips** (we use:
   `cinematic, moody teal-and-orange grade, shallow depth of field, 35mm
   lens, soft practical lighting, photorealistic`) so cuts within one reel
   feel like one film even without a character reference image.
