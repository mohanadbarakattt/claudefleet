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

## Build 4 automations (one per keyword)
For each keyword (CONTENT, PRODUCT, BOTH, START):

> **Catalog changed 2026-07-25.** The store is now two machines, not four small
> products. The old keywords (STACK / VAULT / OS / FLEET / FULL) are retired —
> if you already built those automations in ManyChat, either delete them or
> repoint them at the new links so old reels don't DM dead offers.

- **Trigger:** comment contains the keyword → on *specific post* (attach after posting) or *any post*.
- **Step 1 — public reply** (builds social proof, rotates automatically):
  - "Sent! Check your DMs 📩"
  - "It's in your inbox 🔥"
  - "DM'd you!"
- **Step 2 — DM message** (copy below).
- **Step 3 — condition:** if user hasn't followed you, ManyChat can gate: "Follow me first so the DM doesn't land in requests" (optional — test both; gating raises follows but drops some conversions).

## DM copy per keyword

**CONTENT →**
> The Autopilot Content Machine ⚙️ — idea → script → render → assemble → scheduled, running on Claude + Higgsfield + Postiz. $99:
> [LINK_CONTENT]
> One thing up front so there's no surprise: the $99 is the system, not the subscriptions. It drives three paid services and the requirements doc inside names every one of them.

**PRODUCT →**
> The Digital Product Machine 📦 — validate → build → package → launch kit → scheduled. Same engine, but it ships products instead of posts. $99:
> [LINK_PRODUCT]
> The validation stage is the actual point: it stops you building things nobody asked for. Same honesty note — it needs Claude, Higgsfield and Postiz running underneath.

**BOTH →**
> Both machines 🔧 — they share one engine, so running the pair is less than twice the work. $149 instead of $198:
> [LINK_BUNDLE]
> You get the admin panel, 10 agent employees, 10 skills, the hooks, and 34 prompts across the two.

**START →**
> Depends what you want coming out the other end 👇
> Attention / audience / content → Autopilot Content Machine: [LINK_CONTENT]
> Something you own and sell → Digital Product Machine: [LINK_PRODUCT]
> Both, one engine, $149 → [LINK_BUNDLE]
> Not sure yet? Tell me what you're trying to build and I'll tell you honestly if either fits — some people should buy neither.

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
