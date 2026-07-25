# Machine 1: Content & Growth Agency — Playbook

## What this machine is

A done-for-you AI-run agency that sells short-form video/content production and
posting systems to creators and small brands. You are the operator; four Claude
Code subagents (in `/agents`) do the planning, writing, and prompt-engineering
work that a $2-4k/mo content team would otherwise do. You run the client
relationship, quality-check output, and hit publish.

This is not "prompts for content ideas." It is a repeatable production line:
intake a client's niche → strategist plans the week → script-writer drafts
scripts → video-prompt-engineer turns scripts into AI video generation prompts
→ you (or the client) generate the clips in Higgsfield → deliver a content
calendar + assets on schedule.

## The offer

**Core deliverable (retainer default):** 4 short-form videos/week, each with:
- A written hook + full script (15-45 sec read time)
- 3-5 caption variants (platform-native tone) + hashtag set
- A ready-to-use AI video generation prompt sequence (Higgsfield-style) so the
  client — or you — can produce the actual clips
- A posting schedule (day/time/platform) delivered as a simple calendar doc

**If AI-generated video output isn't usable yet** (a client's niche, product, or brand doesn't render well, or a generation batch just looks bad): don't hold the delivery hostage to fixing the clips. Ship the script + captions + a static carousel or talking-head-style shot list as the week's deliverable instead, note the video attempt as "in progress," and retry generation with a revised prompt for the following week. The written deliverables (script, captions, calendar) are the reliable core of the offer — video generation is the upside, not the guarantee.

**Optional add-ons to test once the core offer is selling:**
- Full video production (you generate + edit the clips yourself, not just the
  prompts) — charge materially more since it's real labor + generation cost
- Cross-posting to multiple platforms with platform-specific edits
- Monthly strategy call + performance review

## Target customer

- Solo creators (10k-200k followers) who have an audience but no time/system
  to post consistently
- Small local or DTC brands (1-20 person team) who know they need short-form
  video but have nobody in-house to plan or write it
- Coaches/consultants/course-sellers who want content to run as a lead-gen
  channel, not just for views

Avoid: enterprise brands (procurement cycles, compliance review — too slow for
a one-person agency), and anyone expecting overnight virality guarantees.

## Revenue model: retainer vs. project

**Retainer is the primary model** — this is a system, not a one-off deliverable,
and recurring revenue is the point of running it as a "machine." Structure it
as a monthly subscription billed in advance.

**Project/one-off pricing** works as a lower-friction entry point: sell a single
"content sprint" (one week or one month of content, no ongoing commitment) to
get a client into the pipeline, then upsell to retainer once they see the
output quality.

## Suggested starting price tiers (test these, don't treat as guaranteed rates)

These are starting points to anchor your own pricing conversation — actual
achievable pricing depends on your niche, portfolio, and local market. Adjust
after your first 3-5 client conversations tell you what the market will bear.

| Tier | What's included | Suggested starting price/mo |
|---|---|---|
| **Starter** | 4 scripts+prompts/week, 1 platform, no production | $500-$800 |
| **Growth** | 4 scripts+prompts/week, 2 platforms, monthly strategy call | $1,200-$1,800 |
| **Full-Service** | Growth tier + you generate/edit the actual video clips | $2,500-$4,000 |

These are suggested ranges to test, not promised income — actual close rates
and pricing power depend on your outreach volume, niche fit, and portfolio.
Never quote a client a rate you found in this document as if it were a market
rate; run your own conversations and adjust.

## How this machine makes money

1. **Outreach** (see `outreach-system.md`) lands a client on a retainer or a
   trial project.
2. **Strategist agent** turns the client's niche + goals into a week's worth of
   content themes — this replaces the strategy-call hours a human strategist
   would bill.
3. **Script-writer agent** turns each theme into a finished hook + script +
   captions — this replaces a copywriter.
4. **Video-prompt-engineer agent** turns each script into an AI video generation
   prompt sequence — this replaces a scriptwriter-to-director handoff.
5. You review the output for quality/brand fit (this is the one step that stays
   human — clients are paying for judgment, not just raw AI output), generate
   the clips in Higgsfield if production is in-scope, and deliver on schedule.
6. Margin = retainer price minus your time (should shrink each week as your
   agent prompts get better) minus tool subscription costs (see
   `requirements.md`).

The business scales by taking on more clients per operator-hour, not by
raising agent quality alone — the agents remove the writing/planning bottleneck
so your time budget is mostly review + client comms + new outreach.
