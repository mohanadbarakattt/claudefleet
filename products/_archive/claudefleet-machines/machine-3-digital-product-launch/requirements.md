# Requirements

Tools needed to run this machine end to end. None of the specific dollar prices below are
invented — verify current pricing directly on each tool's pricing page before budgeting, since
tiers and prices change over time.

**Rough budgeting ballpark (not a quote — for planning purposes only):** tools like these
commonly run anywhere from free-tier/low-single-figures up to roughly two-figures in US dollars
per month combined at small scale (one operator, one product line), since most of this stack has
usable free tiers until you scale. Treat this as a planning heuristic only — confirm every number
yourself below.

## Required

**Gumroad or LemonSqueezy** — selling and delivery
What: hosted storefront + checkout + file delivery for the digital product; handles payment
processing, tax/VAT compliance in many regions, and buyer download links automatically.
Why: this machine needs a place to actually sell and deliver the product without building custom
checkout/payment infrastructure. Pick one, not both, to start — either covers the core need.
Verify current pricing/fee structure (transaction fees, monthly plans, payout terms) at
gumroad.com/pricing or lemonsqueezy.com/pricing before choosing.

**Resend** — email delivery for the launch sequence
What: transactional/marketing email API for sending the 5-email pre-launch/launch/post-launch
sequence to the operator's list.
Why: reliable deliverability (avoiding spam folders) matters more for a launch sequence than for
casual email — a dedicated sending service handles this better than a personal inbox at list
sizes beyond a couple hundred people. If the operator already has an ESP (ConvertKit, Mailchimp,
Beehiiv, etc.), that works too — Resend is the default recommendation, not a requirement to
switch existing setups.
Verify current pricing/send volume limits at resend.com/pricing before committing.

**Claude Code or Claude Pro** — running the agents
What: the environment that runs researcher, product-builder, marketer, and support-agent.
Why: this is the engine of the whole machine — without it, the operator is back to doing
research, writing, and copywriting manually.
Verify current plan options and usage limits at claude.com/pricing before choosing a tier.

## Optional

**ManyChat** — comment-to-DM automation for launch announcements
What: automates auto-DMing a buy link to anyone who comments a trigger word on a launch-day
social post (see outreach-system.md for the exact pattern).
Why: increases launch-day reach and conversion without manual DM-ing, and keeps the outbound link
out of the post caption (better organic reach on most platforms). Purely optional — the launch
sequence and social posts work without it; add it once the operator wants to scale launch-day
distribution beyond what manual DMs could handle.
Verify current plan tiers and platform support (Instagram, Facebook, TikTok) at manychat.com
before setting up, since supported platforms and pricing tiers change.

**Higgsfield** — AI promo video generation
What: generates a short promo/launch video from the structured video prompt marketer.md produces.
Why: a short video for social/launch-day posts increases engagement over static text-only posts,
but is not required to launch — text and social posts alone are a complete launch kit without it.
Verify current generation capabilities, output length limits, and pricing at higgsfield.ai before
relying on it for a launch — capabilities and plans change.

## Not required, but worth knowing about

A design tool (Canva or similar) for a simple product cover image/thumbnail is close to
mandatory in practice — Gumroad/LemonSqueezy listings convert much better with a real cover image
than a blank placeholder. Not listed as a core requirement here since most operators already have
access to one; verify current pricing at canva.com/pricing if starting from scratch.
