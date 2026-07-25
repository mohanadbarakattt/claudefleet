# Higgsfield Prompts — 30-Day Calendar Days

Paste-ready generation prompts for the **five calendar days whose Visual note
asks for AI-generated video**. Everything else in the 30 days is a screen-record,
a static carousel, a Stories sticker frame, or a live-action skit — do not spend
credits on those.

Companion docs (read before generating): `../higgsfield-technique-guide.md`
(which surface for what + the prompt rules), `../content-system.md` (cast and
compliance), the day files in `../calendar/`.

---

## Constraints as of writing — read these, they change what you do

1. **Higgsfield credits are low.** Every shot below is ranked. There are 8 shots
   across the 5 days; 4 are protected and 4 are droppable, each with a named
   fallback. See **Priority order** at the end. Generate top-down and stop when
   the balance says stop — the file is built so that stopping early still leaves
   five postable days.
2. **The Higgsfield MCP API was erroring at time of writing.** These are
   **paste-into-the-web-app prompts**, not automated generations. Nothing here
   was generated. Open higgsfield.ai → Cinema Studio → paste → check the in-app
   credit estimate → generate.
3. **Cost reference, not a price claim:** `../generated/manifest.json` records
   **144 credits for 24 clips** at 4s / 720p / 9:16 / `kling3_0_turbo` on
   2026-07-17 (6 per clip), plus 12 more for the two text-warp regenerations.
   That is the historical figure in this repo, not today's rate — **read the
   in-app estimate before every generation.**
4. **Postiz CLI is not installed and `POSTIZ_API_KEY` is not set on this
   machine.** Nothing here schedules itself. Finished cuts get posted by hand,
   or by whoever wires Postiz up later.
5. **`[BRACKETED_PLACEHOLDER]`** marks anything you have to supply. There are
   deliberately no invented handles, account IDs, follower counts, engagement
   numbers, or subscription prices anywhere in this file.

---

## Verification — which days actually need generation

Checked all four week files, every Visual note, line by line.

**Confirmed, generation required: Days 1, 10, 14, 19, 23.** Your list was right.

| Day | Visual note says | Verdict |
|---|---|---|
| 1 | "Higgsfield-style AI generation, matching the reel-scripts.md style anchor" | **Generate** |
| 10 | "Higgsfield-style B-roll for Ava's talking segments" + inline prompt | **Generate** |
| 14 | "Higgsfield-style prompt:" + inline prompt | **Generate** |
| 19 | "Higgsfield-style AI generation in the house style" + inline prompt | **Generate** |
| 23 | "Higgsfield-style AI generation, matching the house style" + inline prompt | **Generate** |

**Two things the list misses. Neither changes the count of five, both need a
decision from you:**

- **Day 21 carries a sixth, explicitly optional prompt.** week-3.md line 109:
  *"Optional stylised cutaway for the hook line only, in house style"* — followed
  by a full house-style prompt (man at a desk, two monitors, slow push-in). The
  week's own format-mix note repeats that Day 21 "allows one AI-generated cutaway
  on the hook line." It is optional by design and the day works without it (the
  rest is a real screen-record of both pipelines running). **Not costed as one of
  the five.** If credits ever loosen, the prompt is already written in the
  calendar and needs only the no-text negative appended. Left out of the priority
  ladder on purpose: it is the one shot the day explicitly says it can live
  without.
- **Day 16 features Ava but its Visual note never asks for generation.** It says
  "Ava (AI-avatar character) direct-to-camera, on-screen text assembling the
  five-stage pipeline… the framework appearing as text is the whole visual." No
  Higgsfield reference, no style anchor, no scene description. Ava does not exist
  as footage unless something generates her, so Day 16 has an unstated
  dependency. **Do not generate for it.** Cover it by re-using the Day 10 Ava
  clip (or a still from it) under new VO with the stage text cards on top — which
  is exactly what the note describes, and costs nothing. Flagging it because
  "reuse Day 10" is a decision, not an obvious default.

Days that explicitly *refuse* generation, for the record, so nobody re-litigates
them: Day 6, Day 9, Day 12, Day 13, Day 15 ("deliberately *not* the cinematic
Higgsfield look"), Day 17 ("no Higgsfield footage this day"), Day 18, Day 20,
Day 30 ("No AI-generated footage").

---

## Ava continuity block

Four of the five days are Ava. She is a stylized AI-avatar **guide/narrator
character** — per `../content-system.md` she never claims to have bought
anything or earned anything. She also has to be *the same person* on Day 10, 14,
19 and 23, or the account looks like four unrelated stock avatars.

The last 24-clip batch drifted for exactly this reason — `../generated/README.md`:
*"No character reference image was supplied to Higgsfield, so the 'man'
character's exact appearance varies slightly between scenes."* Do not repeat it.

### The description — paste this verbatim into every Ava prompt

> A composed woman in her early thirties, medium build, warm light-olive skin,
> straight dark-brown shoulder-length hair tucked behind one ear, level brows,
> minimal natural makeup, wearing a plain matte charcoal fine-knit crew-neck
> sweater with no print, pattern, slogan or logo of any kind, sleeves pushed to
> the forearm, one thin brushed-steel band on the left wrist, no other jewellery,
> no earrings.

Wardrobe is deliberately blank: printed clothing is the second most common place
a video model tries to render letters and warps them.

**Default set** (Days 10, 19, 23 — Day 14 overrides it, see that day): minimalist
dark studio, seamless deep-charcoal backdrop, polished dark floor, no furniture,
no signage.

**Default lighting:** soft key from camera-left at 45 degrees, cool teal rim from
behind camera-right separating her shoulder from the backdrop, one warm amber
practical far in the background well out of focus.

**Default framing:** medium shot from mid-chest up, centred and slightly
camera-left, eye-line direct to lens, 9:16 vertical, **lower third kept clear**
so text cards drop in during the edit without covering her face.

### The reference-still rule — this is the part that actually prevents drift

1. Generate **Day 10 Shot A first**. It is the house-style, straight-on medium
   shot — the most neutral and most reusable framing of the four.
2. Scrub the result, find a frame where her face is sharp, expression neutral,
   eyes to lens and hair settled. Export it as a PNG.
3. Save it as `../generated/ava-ref-01.png` and commit it. It is now the
   character bible.
4. **On every subsequent Ava generation, upload `ava-ref-01.png` as the start
   image** (web app: the reference/start-image slot; via MCP once it works again,
   `medias: [{role: "start_image", value: <uploaded ref>}]` — the pattern already
   documented in `../generated/README.md`).
5. Never generate Ava from text alone again. Text-only is how you get four
   different women.

**Caveat that bites:** a start image locks the **first frame**. All three
remaining Ava days open on a medium shot, so `ava-ref-01.png` fits them directly.
If a future day needs to open wide, either let the camera move pull back from the
locked medium opening, or generate a second reference at that framing — do not
just drop the reference, that is where drift restarts.

If the Day 10 generation comes back with warped hands or an off face, regenerate
**that one shot** before moving on. A bad reference still poisons all four days;
one extra generation here is cheaper than three bad ones later.

---

## Rules every prompt below already follows

- **House style anchor, verbatim in every prompt:**
  `cinematic, moody teal-and-orange grade, shallow depth of field, 35mm lens, soft practical lighting, photorealistic`
- **Explicit camera move named** in every prompt. Vague prompts drift.
- **9:16, 4s** unless a shot says otherwise and says why.
- **No words in frame, ever.** Every prompt carries the negative below verbatim.
  This is not a stylistic preference — it already cost this project two
  regenerations. `../generated/README.md`: two of the original 24 prompts asked
  Kling to render literal words, both came back illegible, both had to be
  rewritten text-free and regenerated (12 credits, 2026-07-17). All on-screen
  copy is a **text card added in the edit**. If you ever genuinely need sharp
  readable type on a moving background, that is **Vibe Motion** (web app only),
  a different surface — not Cinema Studio.
- **Canonical negative, appended to every prompt:**
  `Must not appear: no text, no letters, no numbers, no words, no UI labels, no captions, no subtitles, no watermarks, no logos, no brand marks, no signage, no readable writing of any kind anywhere in frame — all screens, panels and plates show abstract glowing shapes only.`
- **One clear subject per clip.** Where a day's Visual note describes two things
  happening, it is split into two shots below — per technique-guide rule 2, a
  prompt trying to do three things blurs all three.
- **Surface: Cinema Studio** for all eight shots. Hyper Motion is flagged once
  (Day 19 Shot B) as an optional upgrade because it costs more per clip.

---

# Day 1 — PATTERN-INTERRUPT

**Hook (from week-1.md):** "Delete this app." *(beat)* "Wait — no. Read the
folder name first."

**What the Visual note actually asks for:** a macro of a thumb about to delete a
phone app, frozen mid-motion with a hard light flare, then a jarring snap-cut to
a glowing desktop folder pulsing once like it just powered on — fast punch-in,
then no easing on the cut.

> ⚠ **The Visual note asks for a folder "labeled AUTOPILOT CONTENT MACHINE."
> That label is not generated.** It is a text card in the edit. Asking Kling for
> it is precisely the defect that already shipped here. The prompt below renders
> a blank glowing folder.

### Shot 1A — the delete-hover freeze *(protected)*

```
A single human thumb hovering a few centimetres above one glowing app icon on a phone screen, the icon trembling as if a fraction of a second from being deleted, then the whole frame freezing mid-motion as a hard horizontal light flare rakes across the glass. Setting: a dark room at night, the phone the only real light source, faint dust drifting in the air. Lighting: cold screen glow throwing up onto the underside of the thumb, one warm amber practical far behind and heavily out of focus. Lens and framing: extreme macro close-up, the phone surface filling most of the frame, vertical 9:16 composition. Camera move: fast punch-in toward the icon that stops dead at the freeze, no easing. Mood: tense, abrupt, interrupted mid-gesture. The app icon is a plain abstract glowing rounded square with no symbol, glyph or marking on it. cinematic, moody teal-and-orange grade, shallow depth of field, 35mm lens, soft practical lighting, photorealistic. Must not appear: no text, no letters, no numbers, no words, no UI labels, no captions, no subtitles, no watermarks, no logos, no brand marks, no signage, no readable writing of any kind anywhere in frame — all screens, panels and plates show abstract glowing shapes only. Duration 4 seconds, aspect ratio 9:16.
```

### Shot 1B — the folder power-on *(droppable — check the archive first)*

Second shot justified because it is a different subject on the far side of a hard
cut; one prompt covering both the phone and the desktop would blur both.

**Check before you generate:** `../generated/clips/reel2-scene1.mp4` is already a
close-up of a glowing desktop folder icon pulsing with light on a punch-in, with
no text in frame. If it cuts, this shot costs nothing.

```
A single folder icon on a dark desktop screen powering on — sitting inert, then pulsing once with a warm internal glow that spills onto the surrounding screen and dies back, as if something inside it just came alive. Setting: a dark room, a desktop monitor filling frame, faint reflection of the glow on a glass desk surface below. Lighting: the folder's own pulse is the key light, cool ambient screen light everywhere else, one warm practical far out of focus behind the monitor. Lens and framing: tight macro on the folder icon, vertical 9:16 composition, the icon slightly above centre. Camera move: snap push-in that arrives hard on the pulse, deliberately jarring, no easing in or out. Mood: sudden, arresting, something switching on. The folder is a plain abstract glowing shape with a completely blank face — no name, no marking, no symbol of any kind on or under it. cinematic, moody teal-and-orange grade, shallow depth of field, 35mm lens, soft practical lighting, photorealistic. Must not appear: no text, no letters, no numbers, no words, no UI labels, no captions, no subtitles, no watermarks, no logos, no brand marks, no signage, no readable writing of any kind anywhere in frame — all screens, panels and plates show abstract glowing shapes only. Duration 4 seconds, aspect ratio 9:16.
```

**Cut note — added in the edit, not generated:**
- Over 1A, on the freeze: `WRONG APP. LOOK AT THIS ONE INSTEAD.`
- Over 1B: the folder name card, `AUTOPILOT CONTENT MACHINE`.
- After 1B: the five stage words as fast one-word cards —
  `Idea → Script → Render → Assemble → Scheduled`.
- Closing line card if wanted: `not a content app — five slash commands`.

**If credits are tight:** this whole day can be shot on real hardware. Film your
own thumb over your own phone with a second camera, and screen-record the actual
Autopilot Content Machine folder on your desktop for 1B — which is what Day 2
does anyway. What's lost is the stylised light-flare freeze and the cinematic
grade on the account's very first post; what's gained is that it is literally
real footage of the real product, which is on-brand for this account. **Drop 1B
first** (reuse `reel2-scene1.mp4` or screen-record it), keep 1A if you can afford
exactly one.

---

# Day 10 — GURU-GUIDE (Ava)

**Hook (from week-2.md):** Ava, direct to camera: "People keep asking me if
Claude can actually run their content for them. Let me show you the difference
between using it and running it."

**What the Visual note actually asks for:** Ava narrating in a minimalist dark
studio with soft rim light and holographic panels of abstract pipeline-stage
icons floating beside her — static medium shot with a slow push-in on the
direct-address lines — cut against a real screen-record of the Operator's actual
`/cf-script` and `/cf-render` output.

### Shot A — Ava, hero medium *(protected — generate this first, it becomes the reference still)*

```
A composed woman in her early thirties, medium build, warm light-olive skin, straight dark-brown shoulder-length hair tucked behind one ear, level brows, minimal natural makeup, wearing a plain matte charcoal fine-knit crew-neck sweater with no print, pattern, slogan or logo of any kind, sleeves pushed to the forearm, one thin brushed-steel band on the left wrist, no other jewellery, no earrings. She stands addressing the lens directly and speaking calmly, one hand rising in a small explanatory gesture. Setting: a minimalist dark studio, seamless deep-charcoal backdrop, polished dark floor, no furniture and no signage; five translucent holographic panels hang in a loose vertical column to her right, each carrying a simple abstract glowing glyph — a spark, a wave, an aperture, a lattice, a ring — and each brightening softly in sequence. Lighting: soft key from camera-left at 45 degrees, cool teal rim from behind camera-right separating her shoulder from the backdrop, one warm amber practical far in the background well out of focus. Lens and framing: medium shot from mid-chest up, subject centred and slightly camera-left, eye-line direct to lens, vertical 9:16 with the lower third left clear and uncluttered. Camera move: static hold that resolves into a slow, barely perceptible push-in toward her face. Mood: calm, credible, explaining rather than selling. cinematic, moody teal-and-orange grade, shallow depth of field, 35mm lens, soft practical lighting, photorealistic. Must not appear: no text, no letters, no numbers, no words, no UI labels, no captions, no subtitles, no watermarks, no logos, no brand marks, no signage, no readable writing of any kind anywhere in frame — all screens, panels and plates show abstract glowing shapes only. Duration 4 seconds, aspect ratio 9:16.
```

### Shot B — the five panels alone *(droppable)*

Second shot justified only because Ava names five stages in a row and the edit
otherwise sits on one unchanging medium shot for the length of a monologue.
Cutting the panels into their own clip also keeps her face and the panel sequence
from fighting for attention inside one prompt.

```
Five translucent holographic panels hanging in a loose vertical column in empty dark space, each carrying a simple abstract glowing glyph — a spark, a wave, an aperture, a lattice, a ring — brightening one after another from top to bottom as a single pulse of light travels down the column and passes off the bottom of frame. Setting: a minimalist dark studio, seamless deep-charcoal backdrop, faint haze catching the light. Lighting: the panels are their own key, cool teal spill onto the haze around them, one warm amber practical deep in the background, heavily defocused. Lens and framing: tight vertical composition on the column of panels, shallow focus falling off on the furthest ones, 9:16. Camera move: slow tilt down following the travelling pulse. Mood: mechanical, orderly, one thing handing to the next. cinematic, moody teal-and-orange grade, shallow depth of field, 35mm lens, soft practical lighting, photorealistic. Must not appear: no text, no letters, no numbers, no words, no UI labels, no captions, no subtitles, no watermarks, no logos, no brand marks, no signage, no readable writing of any kind anywhere in frame — all screens, panels and plates show abstract glowing shapes only. Duration 4 seconds, aspect ratio 9:16.
```

**Cut note — added in the edit, not generated:**
- Stage-name cards over Shot B, one per panel:
  `Idea` · `Script` · `Render` · `Assemble` · `Scheduled`.
- Plain card under beat 5, no styling:
  `$99 = the pipeline. Claude, Higgsfield and Postiz subscriptions are yours, not included.`
- Beat 3 is a **real screen-record insert** of the actual `/cf-script` and
  `/cf-render` output — not generated, not mocked up.

**If credits are tight:** drop Shot B and hold on Shot A, cutting to the real
screen-record for the pipeline beats. Nothing is lost but pacing variety, and the
screen-record is the stronger visual anyway. Shot A itself is **not** droppable —
it is the only Ava footage that exists and Days 14, 16, 19 and 23 all depend on
the reference still it produces. If you can only generate one clip in the entire
month, this is it.

---

# Day 14 — GURU-GUIDE (Ava)

**Hook (from week-2.md):** Ava, direct to camera: "Someone commented 'this feels
like a scam' on my last video. Good. Let's talk about that."

**What the Visual note actually asks for:** Ava on a plain, well-lit set,
deliberately *less* cinematic than her other days — even daylight-balanced
lighting, no dramatic shadows, direct eye-line, static medium shot, no push-in,
so it reads as trustworthy rather than sales-y.

> **Note on the house anchor.** This is the one day whose own Visual note pushes
> against it: it asks for "not moody" and "even soft daylight-balanced." The
> anchor is still included verbatim below for continuity — `35mm`, shallow DOF
> and `photorealistic` all still apply — and is immediately qualified so the
> grade sits back. Ava must still look like the same woman; only the light
> changes.

### Shot A — Ava, plain and level *(droppable — see fallback)*

**No start image on this shot.** A start image locks the first frame, and this day's
set (bright mid-grey wall, flat daylight) is deliberately the opposite of
`ava-ref-01.png`'s dim charcoal studio. Continuity is carried by the casting
sentence, which is pasted verbatim below.

```
A composed woman in her early thirties, medium build, warm light-olive skin, straight dark-brown shoulder-length hair tucked behind one ear, level brows, minimal natural makeup, wearing a plain matte charcoal fine-knit crew-neck sweater with no print, pattern, slogan or logo of any kind, sleeves pushed to the forearm, one thin brushed-steel band on the left wrist, no other jewellery, no earrings. She stands squarely facing the lens, speaking directly and steadily, hands mostly still, an open and unhurried posture. Setting: a clean minimalist studio with a plain mid-grey wall, nothing on it, no props, no signage; a single softly glowing abstract panel sits far behind her shoulder, out of focus, carrying only a faint teal-and-orange colour wash. Lighting: even, soft, daylight-balanced from a large source just off-axis, deliberately flat with no dramatic shadows and no hard rim, shadows open and gentle. Lens and framing: medium shot from mid-chest up, subject dead centre, eye-line straight down the lens, vertical 9:16 with the lower third left clear. Camera move: locked-off static, no push-in, no drift, absolutely steady for the full shot. Mood: calm, plain, grounded, unpolished on purpose. cinematic, moody teal-and-orange grade, shallow depth of field, 35mm lens, soft practical lighting, photorealistic — with the grade held well back on this shot: low contrast, daylight balance, teal and orange present only as a faint wash on the background panel, no moodiness in the key light. Must not appear: no text, no letters, no numbers, no words, no UI labels, no captions, no subtitles, no watermarks, no logos, no brand marks, no signage, no readable writing of any kind anywhere in frame — all screens, panels and plates show abstract glowing shapes only. Duration 4 seconds, aspect ratio 9:16.
```

Single shot on purpose. A second angle would add production polish to the one day
whose entire credibility comes from looking unproduced.

**Cut note — added in the edit, not generated:**
- Beat 2's three scam-tells as one plain list card:
  `fake income screenshots` · `countdown timers` · `anonymous accounts`.
- Beat 3 contrast card: `every screen on this account is a real screen recording`.
- Beat 5 disclosure card, plain:
  `$99 does not include Claude, Higgsfield or Postiz`.
- Nothing stylised. No motion graphics. The flatness is the argument.

**If credits are tight — this is the first day to drop, and there are two
fallbacks:**
1. Re-use the Day 10 Ava clip under new VO with the text cards on top. Costs
   nothing. Loses the "different, plainer set" signal that the note wanted.
2. **Shoot it as a screen-only piece with voiceover.** Costs nothing. Beat 4 is
   the "named, contactable brand" line, and the honest faceless way to carry it
   is to *show* the thing rather than have a figure assert it: hold on the real
   bio, the real contact address, the live site and the refund terms while the
   voiceover says it. Evidence on screen is a stronger messenger for that
   particular claim than any presenter, avatar or otherwise.

   > **Not an option: shooting a real face.** The account is faceless
   > (`../content-system.md` → the faceless rule) — no operator, no hired
   > performer, no AI-generated photoreal person, on any day. Day 14 is the day
   > that *explains* why there's no face, so putting one on it is the one place
   > it would do the most damage.

---

# Day 19 — GURU-GUIDE (Ava speaks; file heads it "GURU-GUIDE")

**Hook (from week-3.md):** Ava: "Two machines. One engine. Here's what's actually
shared."

**What the Visual note actually asks for:** Ava standing between two softly
glowing holographic pipelines in a dim studio, each stage lighting in sequence as
she gestures, on a slow lateral dolly that ends with the two pipelines converging
into one — and the note itself already says **no words rendered in-frame**, stage
labels are text cards.

### Shot A — Ava between the two pipelines *(protected)*

Upload `ava-ref-01.png` as the start image.

```
A composed woman in her early thirties, medium build, warm light-olive skin, straight dark-brown shoulder-length hair tucked behind one ear, level brows, minimal natural makeup, wearing a plain matte charcoal fine-knit crew-neck sweater with no print, pattern, slogan or logo of any kind, sleeves pushed to the forearm, one thin brushed-steel band on the left wrist, no other jewellery, no earrings. She stands between two parallel rows of softly glowing translucent holographic blocks that float at chest height on either side of her, gesturing from one row to the other as the blocks in each row illuminate in sequence, left to right, a pulse of light running the length of each row. Setting: a dim minimalist studio, deep-charcoal seamless backdrop, polished dark floor reflecting the two rows, faint haze in the air holding the light. Lighting: soft key from camera-left at 45 degrees on her face, the two hologram rows providing cool teal and warm amber practical fill from either side, one warm practical far behind, defocused. Lens and framing: medium-wide, her full torso and both rows visible, she is centred with symmetrical negative space, vertical 9:16, lower third kept clear. Camera move: slow lateral dolly travelling right to left, the two rows sliding through frame in parallax against each other. Mood: assured, structural, explaining a mechanism rather than pitching. Each hologram block is a plain abstract glowing plate with no marking, glyph or writing on its face. cinematic, moody teal-and-orange grade, shallow depth of field, 35mm lens, soft practical lighting, photorealistic. Must not appear: no text, no letters, no numbers, no words, no UI labels, no captions, no subtitles, no watermarks, no logos, no brand marks, no signage, no readable writing of any kind anywhere in frame — all screens, panels and plates show abstract glowing shapes only. Duration 4 seconds, aspect ratio 9:16.
```

### Shot B — the convergence *(protected — this is the bundle argument)*

Second shot justified because the convergence is the day's actual payoff and a
different subject: one prompt asked to hold Ava, sequence ten blocks *and* merge
two rows will deliver none of the three cleanly. **5 seconds, not 4** — a merge
is one continuous move and a 4s clip clips it mid-travel.

```
Two parallel rows of softly glowing translucent holographic blocks floating in empty dark space, drifting toward each other and merging into a single brighter row along one shared spine, the light intensifying at the seam as they lock together. Setting: a dim minimalist studio, deep-charcoal seamless backdrop, polished dark floor carrying the reflection of the merge, faint haze catching the glow. Lighting: the holograms are the only key, cool teal on one row and warm amber on the other resolving into a single balanced glow as they join, one distant practical far out of focus. Lens and framing: wide clean composition on the two rows with generous headroom, vertical 9:16, shallow focus on the seam where they meet. Camera move: slow lateral dolly that eases to a stop exactly as the two rows become one. Mood: inevitable, satisfying, two things turning out to be one thing. Every block is a plain abstract glowing plate with a completely blank face — no marking, glyph or writing of any kind. cinematic, moody teal-and-orange grade, shallow depth of field, 35mm lens, soft practical lighting, photorealistic. Must not appear: no text, no letters, no numbers, no words, no UI labels, no captions, no subtitles, no watermarks, no logos, no brand marks, no signage, no readable writing of any kind anywhere in frame — all screens, panels and plates show abstract glowing shapes only. Duration 5 seconds, aspect ratio 9:16.
```

*Optional upgrade, costs more:* per `../higgsfield-technique-guide.md`, **Hyper
Motion** is the surface built for CGI-grade reveal shots and would tighten the
hologram compositing on this shot specifically. Check the credit estimate — with
the balance where it is, plain Cinema Studio is the right call.

**Cut note — added in the edit, not generated:**
- Two stage-name rows over Shot A, one per pipeline:
  `Idea → Script → Render → Assemble → Scheduled`
  `Validate → Build → Package → Launch Kit → Scheduled`
- Over the merge in Shot B: `same 17 prompts · same 5 agents · same admin panel`.
- Closing card: `same crew, different job`.
- No price card on this day — the beats don't state one, so don't invent one.

**If credits are tight:** drop **Shot A** before Shot B, not the other way round.
Shot B carries the actual argument for the $149 bundle in a way no text card
can — two things becoming one — while Ava's presence on this day can be covered
by re-using the Day 10 medium shot under her VO. If both go, the day falls back
to the static Day 18-style carousel treatment: two stage lists side by side on a
dark card, animated in CapCut. What's lost is the only visual in the month that
*argues* rather than *states*.

---

# Day 23 — GURU-GUIDE (Ava)

**Hook (from week-4.md):** "There's a version of Claude that runs a business.
Most people have never met it."

**What the Visual note actually asks for:** Ava in a dim office as five faint
holographic name-tags flicker on above five empty desks, slow dolly-in toward her
as she gestures at each one.

> ⚠ **"Name-tags" cannot be generated.** Names are words. The prompt below
> renders five blank glowing plates hovering above the desks; the five role names
> go on as text cards in the edit. Same defect class as the Day 1 folder label.

### Shot A — Ava and the five empty desks *(protected)*

Upload `ava-ref-01.png` as the start image.

```
A composed woman in her early thirties, medium build, warm light-olive skin, straight dark-brown shoulder-length hair tucked behind one ear, level brows, minimal natural makeup, wearing a plain matte charcoal fine-knit crew-neck sweater with no print, pattern, slogan or logo of any kind, sleeves pushed to the forearm, one thin brushed-steel band on the left wrist, no other jewellery, no earrings. She stands in the foreground gesturing back over her shoulder toward five empty desks arranged in a receding row behind her, and above each desk a faint translucent glowing plate flickers on in sequence, one after another, as if five positions are being filled. Setting: a dim, quiet, empty open-plan office at night, bare desks with no papers or monitors, dark carpet, tall windows in deep shadow at the far end, faint haze in the air. Lighting: soft key from camera-left at 45 degrees on her face, the five hovering plates casting cool teal downlight onto the empty desktops, one warm amber practical far down the room, heavily defocused. Lens and framing: medium shot on her with the desk row falling away behind into shallow focus, vertical 9:16 composition, lower third left clear. Camera move: slow steady dolly-in toward her as the plates light up behind her. Mood: still, slightly eerie, a room waiting to be staffed. Every hovering plate is a plain abstract glowing rectangle with a completely blank face — no name, no marking, no glyph, no writing of any kind. cinematic, moody teal-and-orange grade, shallow depth of field, 35mm lens, soft practical lighting, photorealistic. Must not appear: no text, no letters, no numbers, no words, no UI labels, no captions, no subtitles, no watermarks, no logos, no brand marks, no signage, no readable writing of any kind anywhere in frame — all screens, panels and plates show abstract glowing shapes only. Duration 4 seconds, aspect ratio 9:16.
```

### Shot B — one desk working *(archive clip REJECTED — carries warped lettering)*

`reel6-scene2.mp4` looked like a free substitute and **is not usable**. Its source
prompt (`../higgsfield-prompts.md:83`) asked for "documents, outreach emails, and
content calendars" and predates the no-text rule, so it was never text-negatived.
Checked frame-by-frame with ffmpeg on 2026-07-25: the left holographic panel
carries garbled body-text lines and a garbled header, and the right panel is a
calendar grid full of warped numerals. Cutting it in would ship the exact defect
this whole document exists to prevent. **Do not use it.**

Generate this instead — or take the zero-credit fallback below:

```
Close-up of a single empty desk in a dim office with a faint translucent glowing plate hovering above it, abstract pale document-shaped forms assembling themselves in mid-air over the desk surface and settling into a neat stack, as if an unseen worker is at it. Setting: a dim quiet open-plan office at night, bare desk, dark carpet, the rest of the room falling away into shadow. Lighting: the hovering plate casts cool teal downlight onto the desktop, one warm amber desk-lamp practical just inside frame, everything else in shadow. Lens and framing: tight macro-feel close-up across the desk surface, shallow focus falling off fast, vertical 9:16. Camera move: slow orbital arc around the corner of the desk. Mood: quiet, industrious, unattended. The hovering plate and the document forms are plain abstract glowing shapes with completely blank faces — no marking, glyph or writing of any kind. cinematic, moody teal-and-orange grade, shallow depth of field, 35mm lens, soft practical lighting, photorealistic. Must not appear: no text, no letters, no numbers, no words, no UI labels, no captions, no subtitles, no watermarks, no logos, no brand marks, no signage, no readable writing of any kind anywhere in frame — all screens, panels and plates show abstract glowing shapes only. Duration 4 seconds, aspect ratio 9:16.
```

**Cut note — added in the edit, not generated:**
- Five role cards timed to the five plates lighting up, from beat 3's own
  description: `drafts` · `checks the work` · `keeps the files organised` ·
  `[ROLE_4_NAME]` · `[ROLE_5_NAME]` — week-4.md only names three of the five, so
  pull the remaining two from the actual agent files in the shipped product
  rather than inventing them.
- Beat 4 card: `not more prompts — actual jobs, handed off between roles`.
- Beat 5 card: `it replaces the part of the job you hate doing at 11pm`.

**If credits are tight:** this day has the strongest free fallback of the five —
**screen-record the five actual agent employee files in the real folder**, one
after another, exactly as Day 2 does. That is a receipt rather than a metaphor,
and this account's whole thesis is that receipts beat metaphors. What's lost is
the visual hook in the first two seconds; what's gained is proof. If you generate
nothing else this month, Day 23 still ships.

---

# Priority order — spend credits in this sequence

Eight shots total. Ranked by value delivered per clip generated, cheapest and
most-reusable first. Read the in-app credit estimate at each step; stop when the
balance says stop. Everything below the line you stop at has a named fallback
above and still ships.

| # | Shot | Why it's here | If you skip it |
|---|---|---|---|
| **1** | **Day 10 Shot A** — Ava hero medium | One clip, and it unlocks four days. It is the only Ava footage that will exist and it produces `ava-ref-01.png`, the reference still that keeps Days 14, 16, 19 and 23 looking like the same person. Highest leverage in the file by a distance. | Ava does not exist. Four calendar days lose their host and Week 2–4's guide format collapses. |
| **2** | **Day 19 Shot B** — the convergence | The only shot in the month that *argues* instead of stating: two pipelines becoming one is the visual case for the $149 bundle, and a text card cannot do it. Also has no Ava in it, so it can be generated before or after the reference still exists. | The bundle close falls back to a side-by-side static card. Loses the month's best single image. |
| **3** | **Day 23 Shot A** — Ava and five empty desks | Second Ava appearance, uses the reference still, and covers the "five agent employees" concept that recurs in the Week 4 BOTH push. | Falls back to a real screen-record of the five agent files — genuinely a fine substitute, which is why it sits at 3 and not higher. |
| **4** | **Day 1 Shot A** — the delete-hover freeze | Opening post of the account, and the pattern-interrupt only works if the first frame moves. | Film your own thumb over your own phone. Loses the light-flare freeze and the grade, keeps the beat. |
| — | *— realistic stop line if only 2–3 generations are possible: stop after #2, or #3 —* | | |
| **5** | **Day 19 Shot A** — Ava between the pipelines | Puts Ava on the BOTH-keyword day for continuity with 10 and 23. | Re-use the Day 10 medium under her VO and cut straight to the convergence. Barely noticeable. |
| **6** | **Day 10 Shot B** — five panels alone | Pacing variety on a monologue day. | Hold on Shot A and cut to the real `/cf-script` screen-record. The screen-record is stronger anyway. |
| **7** | **Day 1 Shot B** — folder power-on | Completes the snap-cut. | `../generated/clips/reel2-scene1.mp4` already does this, or screen-record the real folder. Almost certainly never worth generating. |
| **8** | **Day 14 Shot A** — Ava plain and level | Lowest value of the eight: the day deliberately wants the least cinematic look in the month, so generation buys the least here. | Re-use Day 10, or — better — run it screen-only with voiceover, holding on the real bio, contact address, live site and refund terms while beat 4 is spoken. The account is faceless; showing the evidence carries that claim better than any presenter could. |

**Not on the ladder, on purpose:** Day 21's cutaway (the calendar marks it
optional and the day is a screen-record without it) and Day 23 Shot B (reuse
`reel6-scene2.mp4`).

**Total if you generate the protected four (#1–#4): 4 clips.** Every one of the
five days ships at that spend, with Days 10, 19, 1 and 23 carrying generated
footage and Day 14 running on re-used Ava or the Operator.

---

## Pre-generation checklist

- [ ] House anchor present verbatim in the prompt.
- [ ] Camera move named explicitly.
- [ ] `9:16` and duration stated.
- [ ] Canonical no-text negative appended — **and no word, label, name-tag or
      readable surface anywhere in the prompt body**.
- [ ] Ava shots: `ava-ref-01.png` uploaded as start image on **Days 19 and 23 only**.
      **Day 14 deliberately takes no start image** — it is shot on a bright mid-grey
      wall in flat daylight, and a dark-studio first frame would lock it into the
      wrong set and destroy the plain, unpolished look the day exists for.
      Continuity there is carried by the verbatim casting sentence instead.
- [ ] In-app credit estimate read *before* pressing generate.
- [ ] If Higgsfield offers a built-in preset match, decline it — generate the
      literal prompt, as was done for all 24 clips in `../generated/`.
- [ ] Generate 2 takes only for Day 10 Shot A (the reference); 1 take for
      everything else while credits are low.
- [ ] After the cut: watch it once at full speed with sound off and confirm no
      warped lettering crept into any frame. That check is what the last batch
      skipped.
