# Requirements — Tools & Ongoing Costs

**Important: this $97 purchase gets you the playbook, agent definitions,
and system docs. It does NOT include the tool subscriptions below. Running
this machine has real, ongoing monthly costs on top of the $97 — budget for
them before you sell your first client engagement. Verify every price
below directly on the vendor's pricing page before committing; do not
trust any number from memory or from this document, since pricing changes
over time.**

**Rough budgeting ballpark (not a quote — for planning purposes only):**
tools like these commonly run anywhere from roughly two-figures to low-three-figures
in US dollars per month combined at small scale (one operator, a handful of
clients), before Claude usage. This range is a planning heuristic only —
go through the checklist below and confirm every number yourself before
you commit to a client price.

## Apollo.io — lead database + sending infrastructure

**What it's for:** This is your core sourcing and sending tool. It gives
you a searchable B2B contact database (used by the `prospector` agent's
search specs) and built-in email sequencing (used to actually send the
copy the `email-copywriter` agent drafts, on the cadence the
`follow-up-agent` defines).

**Why this one:** Apollo bundles both the lead database and the sending
infrastructure in one product, which reduces the number of tools you have
to stitch together when you're starting out.

**Cost:** Apollo runs on a tiered subscription model with usage limits
(contacts you can view/export, emails you can send) that vary by plan.
Check current pricing and plan limits at Apollo.io's pricing page before
committing — do not assume a specific price point holds.

## Resend — deliverability / domain warming for transactional confirmations

**What it's for:** Use Resend for transactional email you control by
code/API — things like booking confirmations, internal alerts, or any
automated confirmation email tied to your delivery process. This is
separate from the actual cold-outreach sending, which runs through Apollo;
Resend's job here is keeping your transactional sending domain reputation
clean and warmed up.

**Why this one:** Deliverability is the single biggest risk to this
business — if your sending domain gets flagged as spam, every client's
campaign suffers at once. Keeping transactional mail on a dedicated,
properly warmed sending path helps protect the reputation of your outbound
sending domains.

**Cost:** Resend has a usage-based pricing model tied to email volume.
Check current pricing and free-tier limits at Resend's pricing page before
committing.

## Airtable — CRM / campaign tracker

**What it's for:** Track clients, their ICPs, lead lists, sequence
status, and reply triage results in one place. This is the shared system
of record the `reporting-agent` pulls from when building a client update,
and where you log suppression lists (unsubscribes/complaints) so no
follow-up-agent-triaged lead is ever recontacted.

**Why this one:** Airtable's free tier is capable enough to run this
entire operation for your first several clients — you don't need a paid
CRM to start. Move to a paid plan only once you hit its free-tier record
or feature limits.

**Cost:** Free tier available; paid tiers unlock higher record limits and
automation features. Check current tier limits and pricing at Airtable's
pricing page before assuming the free tier covers your scale.

## Calendly — booking

**What it's for:** The link you put in your own outreach (see
outreach-system.md) and hand to clients' interested leads so booking a
call doesn't require back-and-forth email.

**Why this one:** It's the standard, low-friction scheduling tool most
prospects already recognize and trust enough to click through.

**Cost:** Free tier exists with basic single-event-type scheduling; paid
tiers add multiple event types, integrations, and team features. Check
current pricing and free-tier limits at Calendly's pricing page before
committing.

## Claude Code / Claude Pro — running the agents

**What it's for:** This is the runtime for the four subagents
(`prospector`, `email-copywriter`, `follow-up-agent`, `reporting-agent`)
that do the drafting, triage, and update work described in playbook.md.

**Why this one:** You already need an AI agent runtime to use the agent
definitions included in this product — this is not optional infrastructure,
it's the thing that runs them.

**Cost:** Claude Pro/subscription tiers and Claude Code usage costs vary
by plan and usage volume. Check current pricing at Anthropic's pricing
page before committing, and factor per-client usage into your retainer
pricing math (more clients running in parallel means more agent runs per
month).

## Legal & Jurisdictional Note (read before your first send)

Cold outreach law varies by where your leads live, not where you live. This
machine's guardrails cover CAN-SPAM basics (unsubscribe handling, permanent
suppression), but that is a US-centric baseline, not global coverage:

- **EU/UK leads:** GDPR restricts unsolicited commercial email far more than
  CAN-SPAM does — in most cases you need a lawful basis (often consent, or a
  narrow "legitimate interest" argument for B2B) before emailing someone cold.
  Do not run EU/UK campaigns on the assumption that CAN-SPAM-style rules apply.
- **Any jurisdiction:** verify current cold-email and data-privacy law for
  every region you're prospecting into — this document is not legal advice,
  and laws change. When in doubt, restrict initial campaigns to jurisdictions
  you've actually checked, and consult a lawyer before scaling into new ones.
- **Data lifecycle:** define a suppression-list and lead-data retention/deletion
  policy before your first send, and be able to honor a deletion request.

## Budgeting Checklist Before Your First Client

- [ ] Confirm current Apollo.io plan cost and contact/send limits
- [ ] Confirm current Resend plan cost and volume limits
- [ ] Confirm Airtable free-tier limits are sufficient for your first
      client count
- [ ] Confirm Calendly free tier is sufficient, or budget for a paid tier
- [ ] Confirm your Claude Code/Pro plan and estimate monthly agent-run
      costs at your target client count
- [ ] Add up total monthly tool cost and divide by your target number of
      clients to know your per-client cost floor — your retainer pricing
      (see playbook.md) must clear this floor plus your own time before
      it's a viable business
