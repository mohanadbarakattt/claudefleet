# Setup Checklist — Zero to First Client

Work through this in order. Don't skip to sending real cold email before
the earlier steps are done — a bad first campaign burns domain reputation
that's slow to rebuild.

## 1. Tool Signups

- [ ] Create Apollo.io account, confirm which plan tier you need based on
      expected monthly send/export volume (see requirements.md)
- [ ] Create Resend account, verify and configure your sending domain
      (SPF/DKIM/DMARC records — Resend's docs walk through this)
- [ ] Create Airtable account (free tier), set up a base with tables for:
      Clients, ICPs, Lead Lists, Sequences, Reply Triage, Suppression List
- [ ] Create Calendly account, set up one event type for "intro call"
- [ ] Confirm your Claude Code / Claude Pro access is active and you can
      run subagents

## 2. Agent Installs

- [ ] Copy the four agent definitions (`agents/prospector.md`,
      `agents/email-copywriter.md`, `agents/follow-up-agent.md`,
      `agents/reporting-agent.md`) into your Claude Code agents directory
- [ ] Run a smoke test on each agent with a dummy prompt to confirm it
      loads and responds in character (e.g. ask prospector to build an
      ICP for a fake client) before using it on real client work

## 3. First ICP Definition

- [ ] Pick a single niche to start with — do not try to serve every
      industry on day one; a narrow ICP makes both your own outreach
      (outreach-system.md) and your first client's outreach easier to
      get right
- [ ] Run `prospector` against your own target client description (see
      outreach-system.md's "Your Own ICP" section) to produce your first
      Apollo.io search spec
- [ ] Sanity-check the resulting filter set manually in Apollo before
      pulling any real contacts

## 4. First 50-Lead Test Batch

- [ ] Pull a small test batch (order of tens, e.g. 50 contacts) using the
      Apollo search spec from step 3 — this is a test of your own
      targeting for selling this service, not yet a client campaign
- [ ] Manually review the batch for obvious quality issues (wrong
      seniority, wrong company size, duplicate companies) before using it
- [ ] If the batch looks off, feed the specific problem back to
      `prospector` to refine filters — don't just re-pull the same query

## 5. First Campaign Send

- [ ] Run `email-copywriter` against your own offer (this service) to
      draft the 4-email sequence, or use the sequence already drafted in
      outreach-system.md as your starting point
- [ ] Run `follow-up-agent` to define cadence and stop conditions for this
      sequence
- [ ] Load the sequence and lead list into Apollo, confirm domain warm-up
      status before sending at volume — do not blast 50 emails on day one
      from a brand-new, unwarmed domain; ramp sending volume gradually
      per your sending tool's warm-up guidance
- [ ] Send to a small first wave, monitor bounces and replies closely for
      the first 24-48 hours before scaling volume
- [ ] Use `follow-up-agent` to triage the first replies as they come in
- [ ] Personally respond to every "interested" and "needs-human-review"
      reply — do not let an agent talk to a real prospect
- [ ] Once you've booked your first real conversation from this test
      batch, use it as the case-in-progress that makes your own pitch
      (outreach-system.md) stronger for the next round — but only cite
      real numbers from this actual run, never a projected or invented one

## 6. Landing Client #1

- [ ] Run your own outreach sequence (outreach-system.md) against your
      real ICP list
- [ ] For any prospect who raises the "how do I know this works"
      objection, offer the paid pilot — do not offer a guarantee
- [ ] Once a client agrees to a pilot, repeat steps 3-5 against their ICP
      and offer
- [ ] Use `reporting-agent` to deliver their first weekly/monthly update,
      and use that update as your retention and upsell touchpoint going
      forward
