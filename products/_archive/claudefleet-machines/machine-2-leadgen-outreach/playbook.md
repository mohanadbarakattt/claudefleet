# Machine 2: Lead-Gen & Outreach-as-a-Service — Playbook

## The Business

You run a done-for-you B2B lead generation and cold outreach service. Your
client is a small agency, consultancy, or SaaS founder who knows they need a
steady pipeline of sales conversations but doesn't have the time, tooling, or
patience to build lead lists and write cold emails themselves. You do it for
them, powered by a small team of Claude Code subagents that do the research,
writing, and reporting — you supervise, approve sends, and manage the client
relationship.

You are not selling "leads" as a spreadsheet. You are selling **a working top
of a sales funnel**, delivered every month, that your client can plug straight
into their own sales process.

## The Offer

A monthly retainer covering:

- A defined Ideal Customer Profile (ICP), refined with the client in week 1
- A qualified lead list sourced each month (target volume varies by tier —
  see pricing below; do not promise a fixed number until you've tested your
  own sourcing throughput with Apollo.io on a real ICP)
- A written, personalized cold email sequence (typically 4 emails: intro,
  value/proof, social proof or case-angle, breakup) tailored to fields on
  each lead record (name, title, company, industry, signal/trigger if
  available)
- Sending infrastructure and inbox management: warm-up, deliverability
  monitoring, reply triage, and follow-up cadence
- A weekly or monthly performance report the client can show their own boss
  or use to plan their sales week

What you are explicitly NOT selling: guaranteed replies, guaranteed
meetings, or a fixed dollar return. Reply and meeting-booking rates vary
enormously by industry, list quality, and offer strength — frame any
number you discuss with a client as "a reasonable target to test toward,"
never as a promise.

## Target Customer

- Small agencies (marketing, dev, design, consulting) with 1-10 people who
  sell services B2B and have no dedicated SDR
- Independent consultants and fractional execs who want a pipeline without
  doing the prospecting themselves
- Early-stage B2B SaaS founders who need outbound before they have a sales
  hire
- Common trait: they have a clear enough ICP to describe in one conversation,
  a real offer with a price point that justifies outbound (typically
  higher-ticket services or B2B software, not cheap consumer products), and
  no existing outbound motion to conflict with

## Revenue Model

**Monthly retainer**, billed in advance, month-to-month or with a discount
for a 3-month commitment. This is a service business with recurring
delivery, not a one-off project — the retainer model matches the recurring
nature of sourcing fresh leads and managing an ongoing send cadence every
month.

Do not price per-lead or per-meeting-booked as your primary model when
starting out — it ties your revenue to variables (industry reply rates,
list quality, client's own follow-through on booked calls) you don't fully
control yet. A flat retainer is simpler to sell and simpler to deliver
against consistently.

## Suggested Starting Pricing (test these, don't treat as fixed)

These are starting points to test in your market — adjust based on your
own delivery cost (tool subscriptions + your time) and what your specific
niche will bear. Do not present these as market-validated numbers to
prospects; they are your working assumptions.

**Tier 1 — Starter**
- Smaller monthly lead volume, single ICP, one email sequence
- Best for: solo consultants and very early-stage founders testing outbound
  for the first time
- Positioning: "get outbound running without hiring anyone"

**Tier 2 — Growth**
- Larger monthly lead volume, one ICP with A/B tested sequences, weekly
  reporting, reply-handling included
- Best for: small agencies with an existing client base who want a second
  acquisition channel
- Positioning: "a full outbound motion, managed"

**Tier 3 — Scale**
- Largest monthly lead volume, up to two ICPs run in parallel, custom
  sequence variants, dedicated weekly check-in call
- Best for: agencies/SaaS founders ready to treat outbound as a real channel
  with a named point of contact
- Positioning: "your outsourced SDR team"

Set actual dollar figures per tier based on: (1) your tool costs (Apollo,
Resend, Airtable, Calendly — see requirements.md), (2) hours of your own
time per client per month for review/QA/client calls, and (3) what a
30-60 minute conversation with 3-5 prospective clients in your target
niche tells you they'd pay. Do not guess a number and lock it in without
that conversation.

## How Delivery Actually Works (high level)

1. Kickoff call: define ICP with client (or refine one they bring)
2. `prospector` agent builds/refines Apollo.io search queries against that ICP
3. You review the pulled list for obvious quality issues before it goes further
4. `email-copywriter` agent drafts the sequence, personalized to lead fields
5. You approve copy and load it into the sending tool
6. `follow-up-agent` manages cadence logic and triages replies (interested /
   not interested / out-of-office / unsubscribe) — you handle actual human
   replies personally, the agent's job is triage, not talking to leads
7. `reporting-agent` compiles weekly/monthly numbers into a client-ready report
8. You send the report and use it as the retention/upsell touchpoint

You are the human in the loop at every send-approval and every real reply.
The agents draft, sort, and report — they do not autonomously email
strangers or negotiate with prospects unsupervised.
