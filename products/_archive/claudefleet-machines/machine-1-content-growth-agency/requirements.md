# Requirements — Tools to Run This Machine

**Important:** the $97 price of this machine covers the playbook, agents, and
systems in this folder. It does not cover the tools below — running this
machine as a real business requires real, ongoing subscription costs on top of
that one-time purchase. Do not commit to client pricing (see `playbook.md`)
without first checking your actual monthly tool cost against it.

None of the prices below are stated as fixed numbers — verify current pricing
at each tool's official pricing page before budgeting, since published tiers
change over time.

**Rough budgeting ballpark (not a quote — for planning purposes only):** tools
like these commonly run anywhere from roughly two-figures to low-three-figures
in US dollars per month combined at small scale (one operator, a few clients),
before video-generation usage costs (which scale with volume). Treat this as
a planning heuristic only — confirm every number yourself below.

## Higgsfield — AI video generation

- **What it's for:** generating the actual short-form video clips from the
  prompts video-prompt-engineer produces.
- **Why this machine needs it:** the content deliverable is video, not just
  text — if you're selling the Full-Service tier (production included) or
  producing samples for outreach, you need a working AI video generator.
  Starter/Growth tiers (prompts only, no production) can technically run
  without this if the client generates their own clips, but having it
  yourself is what lets you offer the higher-margin Full-Service tier and
  produce a portfolio sample for outreach.
- **Verify current pricing:** check Higgsfield's official pricing page —
  plans commonly range across free/trial and paid monthly tiers as of general
  knowledge, but confirm current tiers and generation limits before
  committing, since AI video tool pricing and credit systems change often.

## Apollo.io — lead data + outreach sending

- **What it's for:** building prospect lists (filtered by industry, size,
  location) and sending/sequencing the cold email sequence in
  `outreach-system.md`.
- **Why this machine needs it:** this offer is sold via outbound, not inbound
  — you need a real, filterable prospect database and a sequencer that
  handles send timing and reply-stopping, rather than manually emailing one
  prospect at a time.
- **Verify current pricing:** check Apollo.io's official pricing page —
  plans commonly range from a free tier up through paid tiers with more
  credits/seats, but confirm current tier limits (contact credits, email
  sends/month) before committing, since these change and directly affect how
  large a prospect batch you can run per month.

## Resend — transactional email delivery

- **What it's for:** sending client-facing deliverables (weekly content
  calendar, script batch notifications) reliably, separate from cold
  outreach sending.
- **Why this machine needs it:** once you have clients, you need a
  dependable way to actually deliver the calendar/scripts on schedule that
  doesn't share sending reputation with cold prospecting — mixing the two
  risks deliverability problems for both.
- **Verify current pricing:** check Resend's official pricing page — plans
  commonly range from a free tier with a monthly email cap up through paid
  tiers with higher volume, but confirm current send limits before
  committing, since a growing client list increases your monthly send volume.

## Gumroad or Lemon Squeezy — getting paid

- **What it's for:** collecting retainer/project payments from clients
  (invoicing, recurring billing, or one-time checkout).
- **Why this machine needs it:** you need a real payment processor to
  actually collect the retainer/project fees described in `playbook.md` —
  this is not optional infrastructure.
- **Verify current pricing:** check Gumroad's or Lemon Squeezy's official
  pricing page — these platforms commonly charge a transaction/payment
  processing fee per sale rather than (or in addition to) a flat monthly
  fee, so confirm the current fee structure before setting client pricing,
  since it directly affects your margin.

## Claude Code or Claude Pro — running the agents

- **What it's for:** running the four subagents in `/agents` (strategist,
  script-writer, video-prompt-engineer, outreach-agent) that do the weekly
  planning and writing work.
- **Why this machine needs it:** the agents are the core labor-replacement
  mechanism of this machine — without a working Claude Code or Claude Pro
  account you're back to doing all the planning/writing/prompt-engineering
  by hand.
- **Verify current pricing:** check Anthropic's official Claude pricing page
  — plans commonly range across a free tier and paid subscription tiers with
  different usage limits, but confirm current tier limits before committing,
  since your weekly agent usage volume (4+ scripts/week per client, times
  however many clients you run) should fit comfortably inside whatever tier
  you choose.

## Bottom line

Expect this machine to carry a real monthly tool-cost floor before you land
your first client — budget for it, and don't price your first retainer so low
that it doesn't clear that floor plus your time. Recalculate your actual
monthly cost from the current prices on each tool's own pricing page before
finalizing what you charge.
