# ClaudeFleet — Production Scripts v3 (two-machine catalog)

Supersedes v2, which sold the retired four-product catalog. Six reels, two
machines, four CTA keywords: **CONTENT** ($99) · **PRODUCT** ($99) · **BOTH**
($149) · **START**.

Read `higgsfield-technique-guide.md` before generating anything, and
`content-system.md` for the cast and the compliance rules. Two rules from
those that bite hardest here:

1. **Never put literal words in an AI-video prompt.** Video models warp text.
   On-screen copy is a text card added in the edit, or built in Vibe Motion.
2. **Screen recordings must be real.** Every "screen-record" note below points
   at something that actually exists — the live site, the real admin panel, the
   real fleet home. Faking one is the exact scam tell this audience is trained
   to spot.

**Reel 4 is the most valuable one in this set and the least obvious.** Reels
1–3 and 6 sell the product; Reel 4 buys trust, which in this niche is the
scarce resource. Post it even though it makes us look fallible — that is the
entire point.

---

## Reel 1 — "Your AI forgets your business every morning" · CONTENT
**Angle: name the real bottleneck.** This script came out of the machine
itself (`/cf-script` on card c-0100) — it is dogfooded copy, not written for
this doc.

| Time | VO / on-screen | Mode | Shot |
|---|---|---|---|
| 0:00–0:02 | "You don't have a prompting problem. You have an amnesia problem." | Cinema Studio | Man at a dark desk lit only by a monitor, staring at a blinking cursor in an empty chat input, shoulders dropping. Slow push-in. |
| 0:02–0:08 | "Every session you re-explain the business, re-find where you stopped, and redo thinking you already paid for." | Cinema Studio | Macro at speed: hands reopening the same folders, papers sliding in a loop, clock hand sweeping. Locked-off, timelapse feel. |
| 0:08–0:16 | "The model isn't the bottleneck. State is. Nothing between one session and the next remembers what stage anything was at." | Cinema Studio | Five translucent cards materialise in a row, lighting up left to right, one pulse travelling along them. Lateral dolly. |
| 0:16–0:24 | "So I gave it a pipeline. Idea, script, render, assemble, scheduled. It survives closing the laptop." | Screen-record | The **real** admin panel: the five-column board with cards sitting in different stages. |
| 0:24–0:30 | "I don't operate it. I approve at the gates and it holds the rest." | Cinema Studio | Man leans back, arms folded, watching the row keep moving without him. Static, focus pull cards→face. |

**Text card:** APPROVE, DON'T OPERATE
**CTA:** "Comment **CONTENT** and I'll send you what it is."

---

## Reel 2 — "I made the machine write its own ad" · CONTENT
**Angle: recursive proof.** Screen-record only. No stylized footage.

| Time | VO | Mode | Shot |
|---|---|---|---|
| 0:00–0:03 | "I asked my content machine to write the ad for itself. Filming the whole thing." | Screen-record | Terminal in the fleet home, typing `/cf-script`. |
| 0:03–0:12 | "It reads the intake — who I sell to, what I'm banned from claiming — then drafts the hook, the beats, the timecodes." | Screen-record | The real `c-0100-script.md` scrolling: hook, beat table, alternative hooks. |
| 0:12–0:20 | "Then `/cf-render` turns the script into a shot-by-shot brief. Four shots, camera moves, what must never appear in frame." | Screen-record | The real `c-0100-higgsfield.md` brief. |
| 0:20–0:27 | "It doesn't generate the video. It writes the brief and hands it back — my account, my credits, my call." | Screen-record | Panel run log showing `/cf-render — 4 shots, 0 credits spent`. |
| 0:27–0:32 | "The reel you're watching started as that file." | — | Text card in edit. |

**CTA:** "Comment **CONTENT** for the machine."

---

## Reel 3 — "No demand signal, no build" · PRODUCT
**Angle: the gate is the product.** The most defensible idea in the catalog.

| Time | VO | Mode | Shot |
|---|---|---|---|
| 0:00–0:02 | "Most digital products fail before anyone writes a word of them." | Cinema Studio | A finished product box sitting alone under a single hard light, dust settling. Slow push-in. |
| 0:02–0:10 | "Not because they're bad. Because nobody checked whether anyone wanted the thing first." | Cinema Studio | Shelves of identical unopened boxes receding into darkness. Slow lateral dolly. |
| 0:10–0:18 | "So the build stage is locked. It will not run until validation returns a GO — two independent demand signals and one comparable product people already pay for." | Screen-record | The real `dp-validate` skill file, on the precondition line: *no GO, no build*. |
| 0:18–0:26 | "That's not a feature I added. It's a gate I can't talk my way past at 1am when I'm excited about an idea." | Cinema Studio | A heavy door with one green indicator, staying shut. Static, slight push-in. |
| 0:26–0:32 | "The machine's job is to stop me building things nobody asked for." | — | Text card in edit. |

**CTA:** "Comment **PRODUCT** and I'll send you the gate."

---

## Reel 4 — "I found three bugs in my own product before you could" · BOTH
**Angle: adversarial honesty.** Nobody in this niche posts this. That's why it
works. Screen-record throughout — no stylized footage, no music bed that makes
it feel like an ad.

| Time | VO | Mode | Shot |
|---|---|---|---|
| 0:00–0:03 | "Before I put this on sale I bought my own product. Downloaded the zip like a customer and installed it from scratch." | Screen-record | Unzipping the actual `claudefleet-content-machine.zip`. |
| 0:03–0:11 | "The very first command in my own install guide failed. It pointed at a folder the zip doesn't create." | Screen-record | The `ls` erroring in the terminal. |
| 0:11–0:19 | "Second: the installer made two folders. The tool writes to six. It would have broken on the first real run." | Screen-record | Diff of the old `mkdir` line vs the fixed one. |
| 0:19–0:27 | "Third: it shipped with demo cards flagged as real data. You'd have opened your dashboard and found someone else's fake business in it." | Screen-record | The panel showing the demo banner now correctly firing. |
| 0:27–0:34 | "All three are fixed, and there's now a check that fails the build if any of them come back. I'd rather tell you I found them than let you find them." | Screen-record | `verify-coherence.sh` running green. |

**CTA:** "Comment **BOTH** if you want the thing that got tested this way."

---

## Reel 5 — "You've saved 400 AI tips and made nothing" · START
**Angle: loss aversion + the missing piece.**

| Time | VO | Mode | Shot |
|---|---|---|---|
| 0:00–0:02 | "Four hundred saved AI tips. Nothing shipped. Here's the part every tip leaves out." | Cinema Studio | Macro thumb doom-scrolling in bed, bookmark icons piling in the corner. Tilt up to the eyes. |
| 0:02–0:10 | "A tip is a thing you do once. It doesn't tell you what happens to the output, or where it goes next." | Cinema Studio | Bookmark icons piled like clutter on a desk, gathering dust. Slow lateral dolly. |
| 0:10–0:18 | "A system has stages. Something enters, something leaves, and the thing in between remembers where it got to." | Cinema Studio | Four abstract glowing nodes connected by a pulse travelling in sequence — **no words in frame**. Top-down descend. |
| 0:18–0:26 | "That's the whole difference. Not better prompts. State." | Screen-record | The real board, a card visibly sitting in one column. |
| 0:26–0:32 | "Tell me what you're trying to build and I'll tell you which of the two fits — or that neither does." | — | Text card. |

**CTA:** "Comment **START**."

---

## Reel 6 — "One engine, two businesses" · BOTH
**Angle: the bundle close.** Runs last.

| Time | VO | Mode | Shot |
|---|---|---|---|
| 0:00–0:03 | "Same engine. Two completely different businesses coming out of it." | Hyper Motion | One glowing core with two distinct pipelines branching away from it. Slow orbital arc. |
| 0:03–0:12 | "One turns an idea into a scheduled post. The other turns a validated problem into a product with a launch kit." | Screen-record | The panel's machine selector switching, stage names visibly changing. |
| 0:12–0:20 | "Same admin panel, same hooks, same state file. Learn it once." | Screen-record | The same board, both machines. |
| 0:20–0:28 | "It runs on Claude, Higgsfield and Postiz — three paid subscriptions that aren't included. I'd rather say that now than after you've paid." | — | Text card, plain, no visual trick. |
| 0:28–0:34 | "Ninety-nine each. One-forty-nine for both." | — | Text card. |

**CTA:** "Comment **BOTH**."

---

## Posting notes
- Order: **1 → 3 → 5 → 2 → 4 → 6.** Problem first, then the gate, then the
  soft-entry START, then proof, then trust, then the close.
- Reels 2 and 4 are screen-record only by design. Do not cut AI-generated
  footage into them — the whole value is that they're unfaked.
- Reel 6 carries the subscription disclosure. If you only ever post one reel
  that mentions cost, make it that one.
- Reply to keyword comments within the hour; automation covers it (see
  `dm-automation.md`, keywords CONTENT/PRODUCT/BOTH/START).
