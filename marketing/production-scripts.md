# ClaudeFleet — Production Scripts v2

Rewrite of `reel-scripts.md` after two lessons learned from the first
render batch:

1. **Never put literal words in an AI-video prompt.** Kling (and most
   video models) warp on-screen text — that's what happened to the
   "PROMPT → DELIVERABLE → PRICE → BUYER" and "APPROVED" clips in the first
   batch (fixed in `generated/manifest.json`, see `generated/README.md`).
   Every prompt below is written text-free: abstract light, motion,
   objects — never words the model has to render.
2. **Match the Higgsfield mode to the job, not the other way round.**
   A generic "AI video" prompt is the weakest tool in the kit. Below,
   every shot names which Higgsfield surface it actually belongs in:
   - **UGC** (Marketing Studio, avatar + hook + setting) — for
     testimonial-style, talking-to-camera content. Real product info
     pulled automatically when you paste a URL.
   - **TV Spot** (Marketing Studio, 16:9) — longer-form lifestyle/brand
     narrative, for YouTube or the site itself, not just Reels.
   - **Hyper Motion** (Marketing Studio) — CGI-grade abstract product
     reveal. This is what the "hologram desk" and "storefront assembling"
     shots should have been all along — it's built for exactly this, with
     tighter camera physics than a plain text-to-video prompt.
   - **Cinema Studio** (`kling3_0_turbo` / `cinematic_studio_video_v2` via
     the MCP) — the general-purpose cinematic model used for the first
     batch. Good default when nothing above fits; keep prompts text-free.
   - **Vibe Motion** (web only, not in the MCP model list) — for anything
     that needs *readable* on-screen text or UI: the site's hero
     animation, feature-card micro-interactions, the pricing table
     reveal. This is the fix for the text problem, not "avoid text
     forever" — Vibe Motion generates real UI/motion code, so text stays
     crisp. Use it for the site, not for Reels.

Every reel keeps its original core concept and CTA keyword (so the
dm-automation.md mapping doesn't need to change) but the copy, shot list,
and mode selection are rewritten from scratch.

---

## Reel 1 — "Unemployed" · sells Power Pack · keyword **STACK**
**Angle: Curated Secret** — "there's a way to use this tool you don't know about yet."

| Time | VO / on-screen | Mode | Shot |
|---|---|---|---|
| 0–2s | *(no VO)* "Most people are using 20% of this." | Cinema Studio | Man leaning back, monitor glow only, idle cursor blinking — static, unimpressed. Slow dolly-in. No UI text visible, just the glow. |
| 2–8s | "You ask Claude a question. It answers. You close the tab. That's the whole relationship most people have with it." | Cinema Studio | Macro on a terminal window, lines of text appearing too fast to read (never claim it's readable — motion blur hides it) |
| 8–16s | "Five people built this differently. They gave it a staff, not a search bar. An executor. A reviewer. A researcher. A marketer. A bug-hunter." | Cinema Studio | Five translucent colored silhouettes materializing around a desk, orbital camera |
| 16–24s | "None of them get paid. None of them sleep." | Cinema Studio | Wide shot: man asleep on a couch, monitor still working in foreground, warm lamp vs cool screen light |
| 24–30s | "I packaged the exact five, plus seven commands. Two-minute install." | — | Cut to text card (edit in CapCut, not AI-generated — clean readable text) |

**CTA:** "Comment **STACK** — I'll DM you the install."

---

## Reel 2 — "The folder" · sells Prompt Vault · keyword **VAULT**
**Angle: Speed Contrast** — slow old way vs. instant new way, shown, not told.

| Time | VO / on-screen | Mode | Shot |
|---|---|---|---|
| 0–2s | "Fifty prompts. One folder. Here's why that's different from the other 10,000 you've saved." | Cinema Studio | Finger tapping a glowing folder icon, warm gold pulse, punch-in |
| 2–10s | "Most prompt packs are 'write me a poem.' This one is: input, output, and who pays for the output." | Cinema Studio | Papers materializing from a laptop screen, stacking on a desk — audit report, sequence, calendar — top-down crane descend |
| 10–18s | "One writes a website copy audit. People charge real money for those. One turns one video into ten posts." | Cinema Studio | Split-lit portrait, a soft holographic invoice card floating beside a face, slow lateral slide |
| 18–26s | "Every prompt tells you exactly what to sell it as." | Cinema Studio | Fifty glowing cards fanned above a laptop, one pulled into focus, slow pull-back |
| 26–30s | "Fifty prompts. Not four hundred. Fifty that produce something someone pays for." | — | Text card in edit |

**CTA:** "Comment **VAULT** — I'll DM you the link."

---

## Reel 3 — "Fired yourself" · sells Money OS · keyword **OS**
**Angle: Loss Aversion** — the cost of staying in Phase 1 forever.

| Time | VO / on-screen | Mode | Shot |
|---|---|---|---|
| 0–2s | "There are three phases to using AI to make money. Most people never leave phase one." | Cinema Studio | A man drops an employee lanyard on a desk, slow motion, dust in rim light |
| 2–10s | "Phase one: you do everything by hand, Claude just types faster than you. It's still all on you." | Cinema Studio | Same man buried in sticky notes, harsh fluorescent light, clock spinning fast — zoom-out making the desk feel smaller |
| 10–18s | "Phase two: Claude does the work, you do quality control. That's when it starts to feel like leverage." | Cinema Studio | Sticky notes lifting off the desk into a glowing laptop screen, room clearing as they go |
| 18–26s | "Phase three: Claude runs the checklists too. You're not doing the business. You're running it." | Cinema Studio | Same man, feet up, coffee in hand, calm — dolly-in ending on a small smile |
| 26–30s | "The AI was never the hard part. The order was. I wrote the order down." | — | Text card in edit |

**CTA:** "Comment **OS** — 60 seconds, it's in your DMs."

---

## Reel 4 — "I asked Claude to build a business" · sells the $129 bundle · keyword **FULL**
**Angle: Behind-the-scenes proof** — screen-record only, zero AI-generated visuals. This is
the highest-trust format in the whole plan (see market-research.md) — don't dilute it with
stylized footage.

| Time | VO / on-screen | Mode | Shot |
|---|---|---|---|
| 0–3s | "I told Claude: build something people will actually pay for. Then I screen-recorded the whole thing." | Screen-record | Real terminal, real prompt being typed |
| 3–12s | "First it built the tools. Five agents, seven commands." | Screen-record | Real file tree populating in the editor |
| 12–20s | "Then fifty prompts, each one priced." | Screen-record | Real markdown files scrolling |
| 20–27s | "Then the business playbook. Then it built the storefront that's selling all of it right now." | Screen-record | Real browser tab: the live ClaudeFleet site |
| 27–30s | "Everything you just watched costs less than dinner." | — | Text card in edit |

**CTA:** "Comment **FULL** — I'll DM you everything."

**Production note:** this is the one reel worth running through **Marketing Studio's "App"
mode** instead of hand-editing a screen recording — paste the live URL
(`https://site-delta-hazel-30.vercel.app`), let it pull the real UI, pick an avatar or keep it
voiceover-only, and it composites the actual product into the ad. See
`higgsfield-technique-guide.md` → "Marketing Studio App mode" for the exact steps. Not run yet
— costs more credits than a Cinema Studio clip, so it's your call before spending on it.

---

## Reel 5 — "You've made $0" · sells Vault or the funnel starter · keyword **START**
**Angle: Loss Aversion + Curated Secret combined** — names the exact thing free content leaves out.

| Time | VO / on-screen | Mode | Shot |
|---|---|---|---|
| 0–2s | "You've saved four hundred AI tips. You've made zero dollars. Here's the one thing every tip leaves out." | Cinema Studio | Macro thumb doom-scrolling in bed, screen strobing, bookmark icons piling in the corner |
| 2–10s | "A tip is 'use ChatGPT for emails.' It doesn't tell you who pays for that email, or what to charge." | Cinema Studio | Bookmark icons piled like clutter on a desk, an empty wallet lit beside them |
| 10–18s | "The price and the buyer are the actual system. That's what nobody posts for free." | Cinema Studio | Four abstract glowing nodes in sequence connected by a pulsing line (no words) — top-down descend |
| 18–26s | "Because the person posting the tip needs you to keep scrolling, not to actually finish the system." | Cinema Studio | Phone closing face-down on a nightstand, laptop opening instead, dawn light |
| 26–30s | "I sell the finished system. That's the business model." | — | Text card in edit |

**CTA:** "Comment **START** and tell me where you're at — I'll send the one that fits."

---

## Reel 6 — "I gave my AI a company" · sells ClaudeFleet Machines · keyword **FLEET**
**Angle: Aspirational reveal**, paired with an honesty beat — the format research flagged as
the #1 trust-builder in this niche (no hidden costs).

| Time | VO / on-screen | Mode | Shot |
|---|---|---|---|
| 0–2s | "I didn't give my AI a job. I gave it a company." | Hyper Motion | Man in a dark office, three holographic desks lighting up behind him one by one, dolly-in from behind |
| 2–10s | "Not one assistant. A staff. A strategist. A writer. An outreach agent — each with one job." | Hyper Motion | Close orbital shot on one desk, documents and emails assembling above it as if worked by someone invisible |
| 10–18s | "One desk runs a content agency. One runs lead-gen. One launches a product every month." | Hyper Motion | Man at the center desk, reviewing floating cards with a tap, each one glowing and folding away — no text on the cards |
| 18–24s | "I don't do the work. I review the work. That's the entire job now." | Hyper Motion | Wide shot, all three desks active, man leaning back watching it run, dawn light mixing with hologram glow |
| 24–28s | "It's not free — you still run real tools underneath it. I'm not going to pretend otherwise." | — | Text card in edit, plain honest statement, no visual trick |
| 28–30s | "This is for people who don't want another prompt. They want a business with employees who happen to be AI." | — | Text card |

**CTA:** "Comment **FLEET** — I'll DM you what's inside and exactly what it costs to run."

**Production note:** every "Hyper Motion" shot in this reel was generated as plain Cinema
Studio footage in the first batch. Regenerating through actual Hyper Motion (Marketing
Studio's CGI-grade preset) would produce tighter camera physics and cleaner hologram
compositing — flagged here as a worthwhile upgrade, not done automatically (credit cost is
higher per clip; your call).

---

## Posting notes
- Post order: 5 → 1 → 2 → 3 → 6 → 4 (pattern-interrupt first, meta "AI built this" last).
- Reel 4 is the one exception to "always AI-generate" — screen-record only, per the trust
  research. Don't stylize it.
- Reply to every keyword comment within the first hour (dm-automation.md handles this).
- Pin a comment: "🔗 Also linked in bio if you don't want to wait for the DM."
