# Higgsfield Reel Prompts — paste-ready, v3 catalog

Executable generation instructions for the six launch reels in
`../production-scripts.md` (v3, two machines, CONTENT / PRODUCT / BOTH / START).
Every prompt below is a **direct translation of a Shot cell already written in
that file** — no new days, no new reels, no invented visual concepts. If a
prompt and the script disagree, the script wins.

Shot numbers = table row order in `production-scripts.md`, **including the
screen-record rows**, so `Reel 1 · shot 5` here is row 5 there. Screen-record
and text-card rows are listed and skipped, not renumbered away.

---

## Read this before you spend a credit

**1. Credits are low.** There is no budget for a 2-take-per-shot pass like the
first 24 clips got. Plan: **one style-test clip, judged hard, then one take per
shot in the priority order below.** Current balance is
`[HIGGSFIELD_CREDIT_BALANCE]` — check it in-app before starting and again after
the style test. Every reel has a fallback row in the table at the bottom saying
what to drop first.

**2. The Higgsfield MCP API was erroring when this file was written.** These are
**paste-into-the-web-app prompts**, not automated generations. Open
higgsfield.ai → the surface named on each shot → paste the fenced block → set
9:16 → set duration → generate. Nothing here runs itself. If the MCP comes back,
the same prompt text is the payload — nothing needs rewriting.

**3. Never ask the model to render words.** This already cost us: two of the
first 24 clips (`reel5-scene3`, `reel6-scene3`) asked Kling for on-screen text,
came back illegible, and had to be regenerated. Every prompt below carries an
explicit no-text negative, and every piece of on-screen copy in this file is a
**text card added in the edit** — never generated. If a shot needs real,
readable words, that is **Vibe Motion** (web app only), a different surface, not
these prompts.

**4. Scheduling is manual.** The Postiz CLI is not installed on this machine and
`POSTIZ_API_KEY` is not set. Rendering and cutting is where this file ends;
posting is hands-on until that's fixed.

**5. Duration.** Default is **4s per clip**, which is the cheap unit. Several
beats in the script run 6–8s. Do **not** buy a longer generation to cover
them — cover the tail in the edit with a slow ramp (retime the 4s clip to ~60%),
a held last frame under the text card, or by starting the next shot early. Only
the style test is worth re-running.

---

## Reels 2 and 4 get NO prompts. This is deliberate.

**Reel 2 — "I made the machine write its own ad"** and **Reel 4 — "I found three
bugs in my own product before you could"** are **screen-record only**, and
nothing in this file applies to them.

Why, stated plainly because it's the part people get wrong: their entire value
is that they are **unfaked**. Reel 2's claim is "this ad was written by the thing
I'm selling" — the proof is watching `/cf-script` run in the real fleet home and
the real `c-0100-script.md` scroll past. Reel 4's claim is "I broke my own
product before you could" — the proof is the real `ls` erroring, the real diff,
`verify-coherence.sh` actually running green. The moment a stylized AI clip is
cut into either one, the receipt becomes a mood board and the reel is worth less
than nothing: this audience is specifically trained to spot the fake-screenshot
tell, and `../content-system.md` bans it outright.

Reel 4 is also the most valuable reel in the set precisely because it makes us
look fallible. Do not prettify it.

**If you find yourself wanting AI footage for a screen-record beat, the answer is
a longer screen-record or a static card — never a generated clip.**

---

## House style — reuse verbatim

Every cinematic prompt below ends with this anchor, unchanged, so cuts inside a
reel (and across reels) feel like one film:

```
cinematic, moody teal-and-orange grade, shallow depth of field, 35mm lens, soft practical lighting, photorealistic
```

Two rules about the anchor:

- **Do not edit it for macro shots.** Even on the tight thumb/hands shots the
  anchor stays word-for-word; the macro tightness is described in the *framing*
  clause instead. Swapping the lens number breaks the match between clips.
- **Do not drop the negative.** The no-text line is not boilerplate, it is the
  fix for a defect that already shipped once.

Standard negative, appended to every prompt:

```
no text, no letters, no numbers, no words, no captions, no subtitles, no UI labels, no interface chrome, no icons with writing, no signage, no watermarks, no logos, no readable screen content
```

---

# REEL 1 — "Your AI forgets your business every morning" · CONTENT

Cinema Studio × 4. Shot 4 (0:16–0:24) is the **real admin panel** screen-record —
five-column board, cards in different stages. No prompt, and don't fake it.

---

### Reel 1 · shot 1 · 0:00–0:02
> "You don't have a prompting problem. You have an amnesia problem."

**Surface: Cinema Studio.** A photoreal human performance in a real room — this
is exactly what Cinema Studio is for, and there is no CGI reveal here that would
justify Hyper Motion's cost.

```
A man in his early thirties, medium build, light-tan skin, short dark-brown hair cropped close at the sides and slightly longer on top, clean-shaven, no glasses, wearing a plain dark charcoal crew-neck top with no print, pattern, slogan or logo of any kind, no watch and no jewellery, sits alone at a dark desk, shoulders slowly dropping as he stares at a monitor; the monitor shows only a blank glowing panel with a single blinking vertical bar, no interface of any kind. He does not move his hands. Setting: a small home office at night, the monitor is the only real light source, one warm practical lamp far behind him thrown out of focus. Lighting: hard cool monitor key raking across his face, warm amber rim from the practical behind, deep falloff into black on both sides. Framing: medium close-up, chest to head, subject slightly off-centre, screen glow blooming into the edge of frame. Camera move: slow push-in toward his face, settling tight on his eyes. Mood: quiet defeat, the second before someone gives up on a task. cinematic, moody teal-and-orange grade, shallow depth of field, 35mm lens, soft practical lighting, photorealistic. 9:16 vertical, 4 seconds. Negative: no text, no letters, no numbers, no words, no captions, no subtitles, no UI labels, no interface chrome, no icons with writing, no signage, no watermarks, no logos, no readable screen content.
```

**Cut note:** two cards, hard cut between them on the VO beat —
`NOT A PROMPTING PROBLEM.` then `AN AMNESIA PROBLEM.`

---

### Reel 1 · shot 2 · 0:02–0:08
> "Every session you re-explain the business, re-find where you stopped, and redo thinking you already paid for."

**Surface: Cinema Studio.** Macro on real hands and paper — practical texture,
no reveal geometry. Hyper Motion would be wasted here.

```
A pair of hands opens the same manila folder, closes it, and opens it again in a repeating loop, loose blank pages sliding out across the desk and being restacked each time; behind them a wall clock's second hand sweeps unnaturally fast. Every page is blank, unprinted, unmarked. Setting: the same night home office, desk surface cluttered with plain paper and empty folders. Lighting: one warm overhead practical directly above the hands, cool monitor spill entering from the left, everything past the desk edge falling to black. Framing: tight macro on the hands and the folder edge, clock heavily defocused in the background. Camera move: locked-off static frame, the action running at an accelerated timelapse cadence. Mood: compulsive repetition, effort being spent twice. cinematic, moody teal-and-orange grade, shallow depth of field, 35mm lens, soft practical lighting, photorealistic. 9:16 vertical, 4 seconds. Negative: no text, no letters, no numbers, no words, no captions, no subtitles, no UI labels, no interface chrome, no icons with writing, no signage, no watermarks, no logos, no readable screen content, no printing on the pages, no clock face numerals.
```

**Cut note:** one card, three beats appearing in sequence —
`RE-EXPLAIN. / RE-FIND. / REDO.`

---

### Reel 1 · shot 3 · 0:08–0:16
> "The model isn't the bottleneck. State is. Nothing between one session and the next remembers what stage anything was at."

**Surface: Cinema Studio.** Abstract stylized motion is the thing Cinema Studio
handles fine and cheaply. **Highest text-hallucination risk in this reel** — the
five panels are the same object as the real board's five columns, and the model
will want to letter them. The panels must be explicitly, repeatedly blank.

```
Five identical blank translucent glass panels materialise one after another in a straight horizontal row floating above a dark desk, each lighting up in turn from left to right as a single bright pulse travels along the row and hands off from panel to panel. The panels are completely blank — smooth frosted glass, unmarked, nothing printed or projected on them. Setting: an unlit office interior, the row suspended in volumetric haze above the desk surface. Lighting: the panels are their own light source, cool teal core with a warm amber pulse crossing them, soft reflected bounce on the desk below, no other source in frame. Framing: wide, the row occupying the middle third of the vertical frame with dark headroom above and below. Camera move: slow lateral dolly travelling left to right alongside the row, matching the speed of the pulse. Mood: order arriving, a system clicking into place. cinematic, moody teal-and-orange grade, shallow depth of field, 35mm lens, soft practical lighting, photorealistic. 9:16 vertical, 4 seconds. Negative: no text, no letters, no numbers, no words, no captions, no subtitles, no UI labels, no interface chrome, no icons with writing, no signage, no watermarks, no logos, no readable screen content, nothing written on the panels.
```

**Cut note:** card on the second half of the beat —
`THE MODEL ISN'T THE BOTTLENECK. STATE IS.`

---

### Reel 1 · shot 4 · 0:16–0:24 — SCREEN-RECORD, no prompt
The real admin panel, five-column board, cards sitting in different stages.
Record it live. This is the shot the whole reel is buying credibility for.

---

### Reel 1 · shot 5 · 0:24–0:30
> "I don't operate it. I approve at the gates and it holds the rest."

**Surface: Cinema Studio.** Same character, same room as shot 1 — continuity
matters more than polish here. **Requires the approved start image** (see the
continuity block).

```
A man in his early thirties, medium build, light-tan skin, short dark-brown hair cropped close at the sides and slightly longer on top, clean-shaven, no glasses, wearing a plain dark charcoal crew-neck top with no print, pattern, slogan or logo of any kind, no watch and no jewellery. He leans back in his chair and folds his arms, watching the row of blank glowing glass panels keep pulsing and shifting in front of him without him touching anything; his hands stay off the desk for the entire shot. Setting: the same dark home office, same desk, the blank panels floating at roughly eye level between him and camera. Lighting: panel glow acting as the key on his face, warm amber practical rim from behind, deep black surround. Framing: medium shot, the panels sharp in the near plane, the man behind them. Camera move: static locked-off frame with a single focus pull from the panels back to his face. Mood: calm, hands-off, unhurried authority — not smug. cinematic, moody teal-and-orange grade, shallow depth of field, 35mm lens, soft practical lighting, photorealistic. 9:16 vertical, 4 seconds. Negative: no text, no letters, no numbers, no words, no captions, no subtitles, no UI labels, no interface chrome, no icons with writing, no signage, no watermarks, no logos, no readable screen content, nothing written on the panels.
```

**Cut note:** the reel's payoff card, held to the end —
`APPROVE, DON'T OPERATE.` Then the CTA card: `Comment CONTENT.`

---

# REEL 3 — "No demand signal, no build" · PRODUCT

Cinema Studio × 3. Shot 3 (0:10–0:18) is the **real `dp-validate` skill file**
screen-record on the precondition line. Shot 5 is a text card.

**No human appears in any generated shot in this reel.** The script doesn't put
one there and you should not add him — the argument is about objects: a box
nobody wanted, a shelf of them, a door that won't open. The continuity that
carries over is the *world* (grade, practical lighting, haze), not the face.

---

### Reel 3 · shot 1 · 0:00–0:02
> "Most digital products fail before anyone writes a word of them."

**Surface: Cinema Studio.** A lit object under hard light — bread-and-butter
Cinema Studio. It is a *dead* product, not a hero product, so the CGI-reveal
polish of Hyper Motion would fight the meaning.

```
A single sealed matte cardboard box sits alone on a bare concrete floor under one hard overhead light, fine dust drifting down through the beam and settling on its lid. The box is completely blank — plain matte board, no printing, no markings, no tape logos. Setting: an empty dark warehouse interior, everything outside the pool of light falling to solid black. Lighting: one hard top light making a hard-edged pool on the floor, heavy falloff, dust motes catching the beam, a faint cool ambient fill from far off-frame. Framing: low three-quarter angle, the box sitting in the lower third of the vertical frame with empty darkness above it. Camera move: slow push-in toward the box. Mood: abandoned, unsold, already over. cinematic, moody teal-and-orange grade, shallow depth of field, 35mm lens, soft practical lighting, photorealistic. 9:16 vertical, 4 seconds. Negative: no text, no letters, no numbers, no words, no captions, no subtitles, no UI labels, no interface chrome, no icons with writing, no signage, no watermarks, no logos, no printing on the box, no barcodes, no shipping labels.
```

**Cut note:** card on the hook —
`MOST DIGITAL PRODUCTS FAIL BEFORE ANYONE WRITES A WORD.`

---

### Reel 3 · shot 2 · 0:02–0:10
> "Not because they're bad. Because nobody checked whether anyone wanted the thing first."

**Surface: Cinema Studio.** Scale-of-waste establishing shot. Cheapest reading
of the idea; also the most droppable shot in the whole file (see fallbacks).

```
Rows of industrial steel shelving stacked with hundreds of identical sealed blank cardboard boxes, every one unopened, receding in perspective down a long aisle until they disappear into darkness. All boxes are plain matte board, unprinted, unmarked, identical. Setting: a cold warehouse aisle, dust suspended in the air. Lighting: sparse overhead fixtures spaced far apart down the aisle, isolated pools of light with long unlit gaps between them, cool ambient with one warmer fixture deep in the background. Framing: wide, the aisle running from the bottom of the vertical frame into deep background, shelves filling both sides. Camera move: slow lateral dolly gliding sideways past the shelf faces. Mood: silent overstock, waste at scale. cinematic, moody teal-and-orange grade, shallow depth of field, 35mm lens, soft practical lighting, photorealistic. 9:16 vertical, 4 seconds. Negative: no text, no letters, no numbers, no words, no captions, no subtitles, no UI labels, no interface chrome, no icons with writing, no signage, no watermarks, no logos, no printing on the boxes, no barcodes, no shelf labels, no aisle numbers.
```

**Cut note:** card mid-beat —
`NOBODY CHECKED IF ANYONE WANTED IT.`

---

### Reel 3 · shot 3 · 0:10–0:18 — SCREEN-RECORD, no prompt
The real `dp-validate` skill file, held on the precondition line: *no GO, no
build*. This is the receipt for the entire reel.

---

### Reel 3 · shot 4 · 0:18–0:26
> "That's not a feature I added. It's a gate I can't talk my way past at 1am when I'm excited about an idea."

**Surface: Cinema Studio.** A door that refuses to move is a lighting-and-hold
shot, not a reveal. Note the instruction that **nothing opens** — the model's
default instinct is to open the door, which inverts the meaning of the line.

```
A heavy steel industrial door, sealed shut, with a single small green indicator lamp glowing steadily beside its frame. The door does not open, does not move, does not budge at any point; the lamp holds steady without blinking. Setting: a dim concrete corridor, bare walls, nothing else in frame. Lighting: cool ambient corridor light from above, the green indicator lamp as the only saturated colour in frame throwing a small pool on the wall, a warm practical spilling in from off-frame right. Framing: straight-on and symmetrical, the door filling the centre of the vertical frame, floor visible at the bottom. Camera move: static frame with a very slight, very slow push-in. Mood: immovable, final, non-negotiable. cinematic, moody teal-and-orange grade, shallow depth of field, 35mm lens, soft practical lighting, photorealistic. 9:16 vertical, 4 seconds. Negative: no text, no letters, no numbers, no words, no captions, no subtitles, no UI labels, no interface chrome, no icons with writing, no signage, no watermarks, no logos, no keypad digits, no door plates, no room numbers, no warning stickers.
```

**Cut note:** card, held —
`NO GO, NO BUILD.` (the exact precondition line shown for real in shot 3)

---

### Reel 3 · shot 5 · 0:26–0:32 — TEXT CARD, no prompt
`THE MACHINE'S JOB IS TO STOP ME BUILDING THINGS NOBODY ASKED FOR.`
Then the CTA card: `Comment PRODUCT.`

---

# REEL 5 — "You've saved 400 AI tips and made nothing" · START

Cinema Studio × 3. Shot 4 (0:18–0:26) is the **real board** screen-record with a
card visibly sitting in one column. Shot 5 is a text card.

The "four hundred" in the hook is **spoken, never rendered**. No numerals in
frame anywhere in this reel — the negative on every shot enforces it.

---

### Reel 5 · shot 1 · 0:00–0:02
> "Four hundred saved AI tips. Nothing shipped. Here's the part every tip leaves out."

**Surface: Cinema Studio.** Macro on a real hand and a real face. **Uses the
approved start image** — this is the operator's third appearance and the one most
likely to drift, because only his thumb and eyes are in frame.

```
Extreme macro on a thumb flicking endlessly upward across a phone screen in a dark bedroom; the screen is a smeared blur of moving light with nothing readable on it. Small glowing ribbon-shaped glyphs peel off the screen and pile up in the corner of frame as he scrolls — abstract shapes only, no interface. Setting: in bed at night, the edge of a duvet and a pillow soft in frame, room otherwise black. Lighting: the phone screen is the only source, cool light strobing across the tired face of a man in his early thirties, medium build, light-tan skin, short dark-brown hair cropped close at the sides and slightly longer on top, clean-shaven, no glasses, wearing a plain dark charcoal crew-neck top with no print, pattern, slogan or logo of any kind, no watch and no jewellery, no fill. Framing: tight macro on the thumb and the phone edge, the face soft and half out of frame behind it. Camera move: static macro on the thumb, then a slow tilt up to his eyes. Mood: numb compulsion, late-night fatigue, nothing being decided. cinematic, moody teal-and-orange grade, shallow depth of field, 35mm lens, soft practical lighting, photorealistic. 9:16 vertical, 4 seconds. Negative: no text, no letters, no numbers, no words, no captions, no subtitles, no UI labels, no interface chrome, no icons with writing, no signage, no watermarks, no logos, no readable screen content, no app interface, no notification badges, no counters.
```

**Cut note:** two cards, fast —
`SAVED.` then `NEVER SHIPPED.`

---

### Reel 5 · shot 2 · 0:02–0:10
> "A tip is a thing you do once. It doesn't tell you what happens to the output, or where it goes next."

**Surface: Cinema Studio.** Still-life. Cheap, and the least load-bearing shot
in the reel.

```
A mound of small glowing ribbon-shaped glyphs heaped on a desk like discarded paper clutter, dimming as a fine layer of dust settles over them; a few glyphs at the edge of the pile flicker and go dark. The glyphs are plain abstract shapes, blank, nothing written or marked on them. Setting: a dark office desk, bare and empty all around the pile. Lighting: the pile's own fading glow as the main source plus one weak warm practical raking in from off-frame left, dust motes visible in the beam. Framing: low angle across the desk surface, the pile filling the lower half of the vertical frame, darkness above. Camera move: slow lateral dolly travelling across the pile. Mood: accumulation without use, value going cold. cinematic, moody teal-and-orange grade, shallow depth of field, 35mm lens, soft practical lighting, photorealistic. 9:16 vertical, 4 seconds. Negative: no text, no letters, no numbers, no words, no captions, no subtitles, no UI labels, no interface chrome, no icons with writing, no signage, no watermarks, no logos, no readable screen content, nothing written on the glyphs.
```

**Cut note:** card —
`A TIP IS A THING YOU DO ONCE.`

---

### Reel 5 · shot 3 · 0:10–0:18
> "A system has stages. Something enters, something leaves, and the thing in between remembers where it got to."

**Surface: Cinema Studio.** Abstract sequenced motion. **This is the shot whose
ancestor broke** — the original `reel5-scene3` asked for a literal
`PROMPT → DELIVERABLE → PRICE → BUYER` line, Kling warped it, and it cost a
regeneration. The script already carries the fix (*"no words in frame"*) and so
does this prompt. The nodes **staying lit after the pulse passes** is the whole
point: that's "remembers where it got to". Don't let it read as a wave.

```
Four glowing spherical nodes arranged in a line on a dark surface, joined by thin luminous threads, with a single bright pulse travelling along the chain from the first node to the last; each node brightens as the pulse arrives and stays bright after the pulse has moved on, so the lit part of the chain grows. Nodes and threads are plain and unmarked. Setting: an empty dark tabletop surrounded by volumetric haze, nothing else in frame. Lighting: the nodes are self-illuminated, cool teal bodies with a warm amber pulse crossing them, soft reflected glow spreading on the surface below. Framing: top-down, the chain running vertically through the 9:16 frame from top to bottom. Camera move: top-down camera slowly descending toward the chain. Mood: sequence, retention, order holding. cinematic, moody teal-and-orange grade, shallow depth of field, 35mm lens, soft practical lighting, photorealistic. 9:16 vertical, 4 seconds. Negative: no text, no letters, no numbers, no words, no captions, no subtitles, no UI labels, no interface chrome, no icons with writing, no signage, no watermarks, no logos, no diagram labels, nothing written on or beside the nodes.
```

**Cut note:** card —
`A SYSTEM HAS STAGES.` then on the tail: `NOT BETTER PROMPTS. STATE.`

---

### Reel 5 · shot 4 · 0:18–0:26 — SCREEN-RECORD, no prompt
The real board, a card visibly sitting in one column.

### Reel 5 · shot 5 · 0:26–0:32 — TEXT CARD, no prompt
The closing question from the VO, then the CTA card: `Comment START.`

---

# REEL 6 — "One engine, two businesses" · BOTH

**One generated shot in the entire reel.** Shots 2 and 3 are screen-records of
the real panel (machine selector switching, stage names changing; then the same
board with both machines). Shots 4 and 5 are text cards — including the
subscription disclosure, which is plain text on purpose and must not be
prettified into a graphic.

---

### Reel 6 · shot 1 · 0:00–0:03
> "Same engine. Two completely different businesses coming out of it."

**Surface: Hyper Motion (Marketing Studio) — the only Hyper Motion shot in the
set.** The technique guide flags Reel 6 as the best candidate for it, and this
shot is why: it is a CGI-grade product reveal — a single machined hero object
with two streams branching out of it, held on a stable orbital arc. That's
exactly the "premium reveal, tight camera physics" case Hyper Motion exists for,
and it is the first three seconds of the reel that closes the $149 bundle. Cinema
Studio can render this, but softer and with looser camera physics; the difference
is visible in a reveal and invisible in the shots that aren't one, which is why
nothing else in this file uses Hyper Motion.

```
A single machined glowing core object suspended in a black void, with two distinct conduit pipelines branching away from it in opposite directions, each carrying a continuous stream of light outward at a different colour temperature. The core stays perfectly stable and centred while both streams run; nothing wobbles, nothing detaches. The core and conduits are smooth machined surfaces, unbranded, unmarked, with no panels or displays on them. Setting: an empty black void with faint volumetric haze and a soft dark reflective floor beneath. Lighting: the core is the only light source, casting cool teal along one conduit and warm amber along the other, hard specular highlights travelling across the machined edges, deep black surround. Framing: hero product-reveal framing, the core dead-centre, conduits exiting toward the left and right edges of the vertical frame. Camera move: slow orbital arc around the core, ending on a three-quarter view. Mood: premium hardware reveal, engineered, expensive, controlled. cinematic, moody teal-and-orange grade, shallow depth of field, 35mm lens, soft practical lighting, photorealistic. 9:16 vertical, 4 seconds. Negative: no text, no letters, no numbers, no words, no captions, no subtitles, no UI labels, no interface chrome, no icons with writing, no signage, no watermarks, no logos, no brand marks, no readable screen content, no diagram labels on the conduits.
```

**Cut note:** card over the reveal —
`ONE ENGINE. TWO BUSINESSES.`

---

### Reel 6 · shots 2–3 · 0:03–0:20 — SCREEN-RECORD, no prompt
### Reel 6 · shot 4 · 0:20–0:28 — TEXT CARD, no prompt
The subscription disclosure, plain, no visual trick: it runs on Claude,
Higgsfield and Postiz — three paid subscriptions that aren't included. Keep it
ugly and readable. It is the trust asset of the reel.

### Reel 6 · shot 5 · 0:28–0:34 — TEXT CARD, no prompt
Pricing, then the CTA card: `Comment BOTH.`

---

# Continuity — the recurring operator

He appears **on camera in three generated shots only**: `Reel 1 · shot 1`,
`Reel 1 · shot 5`, and `Reel 5 · shot 1` (thumb and eyes). **Reel 3 has no
on-camera human in any generated shot** — do not add him there; the script
deliberately makes the argument with objects. What carries across Reel 3 is the
world, not the face: same grade, same practical-lamp warmth against cool key,
same haze, same fall-to-black surround.

**This has already gone wrong once.** The first 24 clips were generated with no
reference image and the "man in a home office" character's appearance drifted
between scenes inside the same reel. That is the failure this block exists to
prevent.

**Locked spec — do not vary between shots:**

| | Locked value |
|---|---|
| Casting | A man in his early thirties, medium build, light-tan skin, short dark-brown hair cropped close at the sides and slightly longer on top, clean-shaven, no glasses, wearing a plain dark charcoal crew-neck top with no print, pattern, slogan or logo of any kind, no watch and no jewellery. **Paste this sentence verbatim into every operator prompt — do not paraphrase it, and do not add or remove an attribute (facial hair especially).** |
| Wardrobe | Plain dark crew-neck top, no print, no graphics, no visible branding (also forced by the no-text rule). No watch, no jewellery, no lanyard. |
| Location | One small home office: same desk, same single monitor, same warm practical lamp behind the subject. Reel 5 shot 1 is the bedroom in the *same* apartment — same warm practical, same black surround. |
| Palette | Cool monitor/panel key on the face, warm amber practical rim from behind, everything else black. |
| Lighting | Single hard key + single warm rim + no fill. Never add a soft box, never light the back wall. |
| Performance | Hands still and off the desk in every shot he's in. He never types, never gestures at the panels. That restraint *is* the "approve, don't operate" argument. |

**Start-image rule (non-negotiable):**

1. Generate `Reel 1 · shot 1` first (it is also the style test — see below).
2. Scrub it, export **one clean frame** where the face is undistorted and the
   hands are correct. Save it as `[OPERATOR_REFERENCE_STILL]`.
3. Upload that same still as the **start image / reference** on **every later
   shot he appears in** — `Reel 1 · shot 5`, `Reel 5 · shot 1`. In the web app
   that's the reference-image slot; via the MCP it was
   `medias: [{role: "start_image", value: <uploaded reference photo>}]`.
4. Never re-approve a second reference still mid-run. One still, whole set. If
   shot 1 has to be regenerated, the reference still is regenerated with it and
   any shot already made from the old one is now inconsistent — which is another
   reason shot 1 is the style test and gets judged hard before anything else
   runs.

---

# Generation order — style test first, then load-bearing

The point of the order is that **one clip's worth of credit tells you whether the
look is right** before the rest is committed. Do not batch. Judge each tier
before opening the next.

**Tier 0 — the style test (ONE clip): `Reel 1 · shot 1`.**
It is the only shot that tests everything at once: the grade, the practical-vs-
monitor lighting, the operator's face, a blank screen the model wanted to write
on, and a slow push-in. It is also the first frame of the first reel in the
posting order (1 → 3 → 5 → 2 → 4 → 6), so it is the shot with the most riding on
it either way.

Judge it against four pass/fail questions — any "no" means fix the prompt and
re-run **this shot only**:
1. Is the monitor genuinely blank — no letters, no interface, no ghost text?
2. Does the grade match the anchor, or did it come back neutral/grey?
3. Is there a single frame with an undistorted face and correct hands you would
   be willing to lock as `[OPERATOR_REFERENCE_STILL]` for the rest of the set?
4. Does the push-in actually move, and move slowly?

Only after a pass do you export the reference still and continue.

**Tier 1 — the other three hooks.** The first two seconds decide whether anything
else in the reel gets watched, so every reel's opening shot outranks its middle.
`Reel 6 · shot 1` also sits here because it's a *different surface* (Hyper
Motion) with its own cost and its own look — check the in-app credit estimate
before generating and treat it as a second, smaller style test rather than
assuming it matches Cinema Studio.
- `Reel 3 · shot 1` (box under hard light)
- `Reel 5 · shot 1` (doom-scroll macro — start image)
- `Reel 6 · shot 1` (Hyper Motion reveal)

**Tier 2 — the shots that carry an argument.**
- `Reel 1 · shot 5` (payoff, start image, holds `APPROVE, DON'T OPERATE`)
- `Reel 3 · shot 4` (the closed door — the gate metaphor)
- `Reel 1 · shot 3` (five blank panels — re-check for text before accepting)
- `Reel 5 · shot 3` (four nodes — the shot whose ancestor broke; check hardest)

**Tier 3 — texture, generate only if credits survived Tier 2.**
- `Reel 1 · shot 2` (macro folders)
- `Reel 5 · shot 2` (glyph pile)
- `Reel 3 · shot 2` (warehouse shelves)

If credits run out at any tier boundary, stop there and use the fallbacks. A reel
cut from Tier 0–2 with honest substitutions is publishable; a reel with a warped
text frame in it is not.

---

# Fallbacks — what to do when credits run out mid-way

| Reel | Load-bearing (cut it or don't post) | Droppable | Substitute that actually holds up |
|---|---|---|---|
| **1** | `shot 1` (hook — nothing replaces a scroll-stopping first frame), `shot 4` (the real board; costs zero credits and is the proof) | `shot 2`, `shot 3` | **Drop `shot 2`:** screen-record yourself genuinely reopening the same folders and re-pasting the same context — more honest than the stylized version and free. **Drop `shot 3`:** pull the `shot 4` board screen-record earlier to cover 0:08–0:24; it shows the same five stages, for real. **If `shot 5` is unaffordable:** hold the last frame of the board record under the `APPROVE, DON'T OPERATE` card. Reel survives on shot 1 + screen-record. |
| **3** | `shot 1` (hook), `shot 3` (the real `dp-validate` precondition line — the entire proof) | `shot 2`, `shot 4` | **Drop `shot 2`:** retime `shot 1` to ~50% and let the push-in run under both VO lines; one box reads as well as a warehouse. **Drop `shot 4`:** hold on the `dp-validate` screen-record with the precondition line centred and run `NO GO, NO BUILD.` as a static card over it — the file *is* the closed door. Reel survives on shot 1 + screen-record + cards. |
| **5** | `shot 1` (hook — the doom-scroll macro is the whole pattern-interrupt), `shot 4` (real board) | `shot 2`, `shot 3` | **Drop `shot 2`:** static card on black over the VO — it's a definitional line and reads fine unillustrated. **Drop `shot 3`:** pull the `shot 4` board record earlier; a real card sitting in a real column makes the "stages" point better than four abstract nodes do. Reel survives on shot 1 + screen-record + cards. |
| **6** | `shot 1` (the only generated shot AND the opening of the bundle-close reel), `shots 2–3` (real panel, free) | — | Nothing to drop — this reel is already 80% free footage. **If Hyper Motion is unaffordable:** run the identical prompt through **Cinema Studio** at 4s instead (softer, looser camera physics, still on-anchor) rather than skipping the reveal. **If neither is affordable:** open cold on the `shot 2` panel screen-record at 0:00 with `ONE ENGINE. TWO BUSINESSES.` as a static card over a held frame. Weaker open, zero credits, still honest — and shots 4–5 (disclosure + pricing) were always text cards, so the close is unaffected. |

**Two things that are never an acceptable substitute:** generated footage cut
into Reel 2 or Reel 4, and a generated clip carrying rendered words. Both are
cheaper than the alternative and both cost more than they save.

---

# Pre-flight checklist per generation

- Surface matches the shot's Mode in `../production-scripts.md` (Cinema Studio,
  except `Reel 6 · shot 1` = Hyper Motion).
- 9:16 vertical, 4s, unless you have a specific reason and the credits for it.
- House anchor present **verbatim**, negative present, camera move named.
- Start image attached on **`Reel 1 · shot 5` only**.
  **`Reel 5 · shot 1` takes no start image** — it opens on an extreme macro of a
  thumb with the face soft and half out of frame, and the reference still is a
  medium close-up. A start image locks the first frame, so attaching it would open
  the clip on the office face shot and morph away, destroying the doom-scroll
  pattern-interrupt that is the whole point of the hook. Continuity there is carried
  by the verbatim casting sentence plus the locked palette and lighting.
- In-app credit estimate read **before** pressing generate.

# Post-generation acceptance

Reject and re-prompt (don't "fix in post") if any of these are true:
- Any letter, digit, or interface label is visible anywhere in frame.
- The grade drifted off teal-and-orange.
- The camera move is different from the one named, or barely moves.
- The operator's face or wardrobe doesn't match `[OPERATOR_REFERENCE_STILL]`.
- Hands are malformed in a shot where hands are in focus (shots 1·2 and 5·1).

Everything else — pacing, retiming a 4s clip to cover an 8s beat, text cards,
captions, the VO — is an edit problem, not a generation problem. Solve it there
and keep the credits.
