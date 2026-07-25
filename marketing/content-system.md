# ClaudeFleet Content System — Cast, Formats, Compliance

This is the spec behind the 30-day calendar. Read `market-research.md` first —
every format below is chosen because research found it currently working,
not because it's trendy-sounding.

## The faceless rule (standing constraint — applies to every asset)

**Nobody appears on camera on this account, ever.** No recognisable human
face in any reel, story, carousel or thumbnail — not the operator, not a
friend, not a hired UGC actor, not an AI-generated photoreal person. Where a
body is needed for motion or scale, the only permitted forms are: hands-only
(frame ends at the wrist), over-the-shoulder with the head out of frame, or an
unlit silhouette / partial figure with no legible features. Everything else is
a screen recording, an object composition, an empty-room shot, abstract
motion, or Ava. If a generated clip returns a legible face, re-prompt or
recrop — it does not ship.

This is a production constraint, not a privacy claim. The brand is still
named and contactable (see below); it just isn't a person's face.

## The cast (recurring characters — all clearly fictional/brand personas)

**IMPORTANT — how to use these honestly:** none of these characters claim to
be a real customer who bought the product and got a specific result. That
would be a fabricated testimonial. Instead, each character has a defined
*role* (narrator, guide, skeptic-being-shown-something) that never crosses
into "I paid for this and made $X." Where a caption could be read as a real
review, add "(dramatization)" or "(character bit)" in the post notes — not
necessarily on-screen, but in your own production notes so you never
accidentally caption it as a genuine unsolicited review.

1. **The Operator** — **a voice and a screen, not a person on camera.** The
   Operator is heard in voiceover and seen only through what they're doing:
   the real terminal, the real admin panel, the real site, hands on a keyboard
   at most. This is still the most trust-building format in the whole plan per
   the research (real screen recordings beat every other proof format in this
   niche) — the proof was always the screen, never the face. Use this for
   anything that could be read as a claim.
2. **Ava** — unchanged. A stylized AI-avatar co-host character (faceless/
   avatar-style content, per the research pattern). Her role: react to and
   explain what ClaudeFleet does, narrate "how this works" segments, and voice
   the cheat-code/hype framing. She never says "I bought this and it made me
   money" — she's a guide/narrator character, not a customer.
3. **Skeptic** — **voice-only or hands-only.** A played character doing a
   "POV: I didn't believe this" arc, carried by voiceover and text cards over
   screen recordings or object shots — never a performer on camera. Still a
   dramatized scenario, same category as any before/after ad skit: label your
   own notes as "(dramatization)" and never present it as an unsolicited real
   review.
4. **The Client (Machine-specific)** — **voice-only or hands-only.** A played
   character representing a business owner receiving a deliverable from a
   ClaudeFleet Machine (e.g., getting their week's content calendar) — shown
   as the deliverable landing on a screen, hands opening it, a voice reacting.
   Same rule: dramatized workflow demo, not a claimed real client
   relationship.

## Compliance notes (read once, apply throughout)

- Never caption a dramatized/acted scene as if it's a genuine unsolicited
  customer review — that's the exact fabricated-testimonial problem the
  products themselves are built to avoid. Acted scenarios are fine as ads
  (all short-form ads use them); just don't misrepresent who's in them.
- Never show a fake bank balance, fake Stripe dashboard, or fake income
  screenshot — research flagged this as the #1 scam tell this audience is
  actively trained to spot. If you show a screen, screen-record something
  real: the actual site, the actual product files, the actual agent output.
- No fake urgency (countdown timers, "3 spots left," fake scarcity).
- No income promises, no "guaranteed" language, no specific dollar claims
  about what a buyer will make.
- **Never film the admin panel's SIMULATION mode as if it were a real run.**
  The console can walk a card through its stages on a timer for demo purposes;
  every simulated record carries a `SIM` badge and a banner sits across the top
  while it runs. If a shot shows simulated activity, the badge or banner must be
  legible in frame, or the shot doesn't ship. Four of the six reels put that
  panel on screen — this rule outranks every other note in the calendar, because
  a cropped screenshot of simulated jobs is indistinguishable from a fabricated
  dashboard, which is the #1 scam tell in this niche.
- Always be identifiable as a real, named operator somewhere in your
  profile/bio — anonymity measurably hurts trust in this niche.

## Carrying trust without a face

Research (`market-research.md`) lists three objections that decide whether
this niche believes you: *"this is a scam / no real proof"*, *"fake urgency"*,
and *"who's actually behind this?"*. A visible operator was one way to answer
the third. Faceless, five concrete things carry the load instead. Each one is
a thing you do in a post, not a tone.

1. **Inspectable artifacts.** Show the file, not a claim about the file. The
   `dp-validate` precondition line, the run log, the `verify-coherence.sh`
   output, the manifest checked against the folder. The viewer can pause the
   frame and read it — and if they buy, they get the same file. Anything you
   assert on screen should exist somewhere a buyer can open.
2. **Real screen recordings, still the strongest format we have.** Unedited-
   feeling capture of the real admin panel, the real terminal, the real site.
   Never a fake balance, dashboard or income screenshot — research flags those
   as the #1 scam tell here. Name the real tool (Claude), not vague "AI."
3. **A named, contactable brand.** Anonymity is a conversion killer in this
   niche; "no face" is not the same as "no name." Profile and bio carry a real
   business name, a real person's name behind it, a working contact address
   and the live site. Reply to comments and DMs as that named operator, in the
   hour. The account is faceless, not anonymous — and if asked directly why
   there's no face, answer plainly: it's a production choice.
4. **A visible refund promise.** The 30-day money-back refund is the only
   guarantee that exists anywhere in this business, and it is about refunds,
   never about earnings. Say it in the pinned comment or the caption on any
   post that names a price, and link to the terms. No income claims, no
   "guaranteed" language, no dollar figures about what a buyer will make.
5. **Limitations stated plainly, before purchase.** It needs paid Claude,
   Higgsfield and Postiz subscriptions and they are not included. It writes
   briefs, it does not spend your credits for you. It is a system to operate,
   not an autopilot that runs a business without you. Reel 4's whole premise —
   publishing bugs found in our own product — is this same move: the fastest
   way to be believed on the good parts is to be first with the bad ones.

## Format pillars (every day's post uses one of these)

- **PATTERN-INTERRUPT** — sub-3-second visual/audio shock hook, then payoff.
- **SCREEN-RECORD PROOF** — The Operator actually using the product/site on
  screen, real and unedited-feeling.
- **BEFORE/AFTER** — a visible transformation (messy → done).
- **LISTICLE** — "3 prompts that..." tip-dense, fast-cut.
- **POV/SKIT** — Skeptic or Client character arc, clearly a played scene,
  carried by voiceover and text over screen/object footage (no performer).
- **GURU-GUIDE** — Ava explains/hypes a concept or product in voiceover.
- **CHEAT-CODE** — leans hardest into "this feels illegal to know" framing,
  always paired with a real screen-record so the hype has a receipt.
- **CAROUSEL** — static multi-slide post (tips, comparison, mini-guide).
- **ENGAGEMENT-BAIT STORY** — poll/question-sticker story post that farms
  replies/warms the audience before a harder pitch later that week.

## CTA keyword map (matches marketing/dm-automation.md)

- CONTENT → Autopilot Content Machine ($99)
- PRODUCT → Digital Product Machine ($99)
- BOTH → both machines, one engine ($149)
- START → funnel starter question ("tell me what you're building")

The catalog is **two machines on a shared engine**, not four small products.
Both require paid Claude + Higgsfield + Postiz subscriptions, and that gets
said out loud in the content — it is a trust asset, not a footnote.

## Weekly arc (how the 30 days are sequenced)

- **Week 1 — Hook & prove**: pattern-interrupts and screen-record proof,
  the Content Machine (CONTENT), build initial trust and following.
- **Week 2 — Teach & warm**: listicle/tip content, light engagement-bait,
  positions the account as useful even to non-buyers (algorithm favors
  saves/shares on this kind of content).
- **Week 3 — Escalate**: POV/skit and guru-guide content, introduces the
  Digital Product Machine (PRODUCT) and builds toward the both-machines close.
- **Week 4 — Cheat-code push**: heaviest hype framing, the BOTH/bundle
  push, a recap/bundle close, and a "how it's all built" behind-the-scenes
  post to reinforce the Operator's credibility.

## Production note format (used in the daily calendar)

Each day gets: **Format**, **Hook** (first line, on screen and/or spoken),
**Beats** (3-5 short lines), **Visual note** (screen-record instruction or a
Higgsfield-style AI-generation prompt), **Caption**, **CTA keyword**.
