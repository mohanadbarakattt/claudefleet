# Comment → DM Automation Kit

Goal: someone comments the keyword on a reel → they instantly get a DM with the
link → link goes to the product (or the site). Fully automated after a 20-minute
one-time setup.

## Why ManyChat (and not custom code)
Instagram's API only grants DM automation to approved Meta apps. Building your own
requires Meta app review (weeks). ManyChat is already approved, has a free tier
(enough to start), and the comment-trigger feature is exactly this use case.
Alternative if you outgrow it: Chatfuel or a custom Meta app later.

## One-time setup (you must do this part — it needs your logins)
1. Convert your Instagram to a **Professional account** (Settings → Account type).
2. Connect it to a Facebook Page (required by Meta for API access).
3. Create a ManyChat account → connect Instagram → grant all messaging permissions.
4. In ManyChat: **Automation → New Automation → Instagram → "User comments on your post"**.

## Build 5 automations (one per keyword)
For each keyword (STACK, VAULT, OS, FULL, START):

- **Trigger:** comment contains the keyword → on *specific post* (attach after posting) or *any post*.
- **Step 1 — public reply** (builds social proof, rotates automatically):
  - "Sent! Check your DMs 📩"
  - "It's in your inbox 🔥"
  - "DM'd you!"
- **Step 2 — DM message** (copy below).
- **Step 3 — condition:** if user hasn't followed you, ManyChat can gate: "Follow me first so the DM doesn't land in requests" (optional — test both; gating raises follows but drops some conversions).

## DM copy per keyword

**STACK →**
> Here's the Claude Code Power Pack 🔧 — 5 AI employees + 7 commands, 2-minute install:
> [LINK]
> Quick q so I send you the right stuff next time: are you already using Claude Code, or just regular Claude?

**VAULT →**
> The AI Income Prompt Vault 💰 — 50 prompts that produce sellable work, each with a "sell it as" price angle:
> [LINK]
> Tip: start with prompt #1 in the freelance file — it's the fastest one to turn into cash.

**OS →**
> Claude Money OS 🧠 — the full playbook: lane → offer → clients → scale, with a 90-day plan:
> [LINK]
> Chapter 1 helps you pick your lane in ~10 minutes. Start there tonight.

**FULL →**
> The Full Stack 📦 — all 3 products, $59 instead of $85:
> [LINK]
> This is everything I showed in the reel: the tools, the prompts, and the plan.

**START →**
> Depends where you are 👇
> Total beginner → Claude Money OS: [LINK_OS]
> Already freelancing → Prompt Vault: [LINK_VAULT]
> Using Claude Code → Power Pack: [LINK_STACK]
> Want it all → Full Stack ($59): [LINK_BUNDLE]

## Follow-up sequence (set in ManyChat, huge conversion lift)
- **+23 hours** (must be <24h per Meta rules), only if link not clicked:
  > "Btw — did the link work for you? If you're on the fence, tell me what you're trying to do with AI and I'll tell you honestly if this fits."
  (Real replies here = your market research goldmine. Answer them personally.)

## Link strategy
- Use the Gumroad product links directly in DMs (fewer clicks = more sales).
- Bio link → the ClaudeStack site (the marketplace page sells the bundle).
- Add `?ref=ig-<keyword>` to every link so Gumroad analytics shows which reel sells.

## Daily loop (5 min/day once running)
1. Check ManyChat inbox for real replies → answer personally.
2. Note which keyword got the most comments → make the next reel a sequel to that one.
3. Screenshot good buyer messages (ask permission) → future testimonial content.
