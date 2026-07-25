# 05 — Scale With Agents

Everything so far has you doing the work. This chapter is the shift: from you executing every deliverable to you orchestrating a system that executes for you. This is the difference between owning a job and owning a business.

## Claude Code subagents as employees

If you're comfortable with Claude Code (or willing to get comfortable — it doesn't require a programming background to use, just a willingness to write clear instructions), you can set up subagents that each handle one narrow, repeatable part of your delivery pipeline, the same way you'd hire a specialist rather than one generalist.

Think of it in role terms, not tool terms:

- **A researcher subagent**: given a topic or client, gathers and organizes raw material — reads source docs, pulls relevant context, and hands back a structured brief. This is the equivalent of hiring a research assistant.
- **A drafter subagent**: takes the structured brief and produces the first-pass deliverable in your established format and voice profile. This is your equivalent of a junior writer or associate.
- **A QC subagent**: runs your quality-control checklist from chapter 3 against every draft before it reaches you — flags generic phrasing, unverified claims, and scope mismatches. This is your equivalent of an editor.

You are the fourth role: the one who reviews the QC subagent's flags, makes the judgment calls a checklist can't make, and owns the final "this goes to the client" decision. That's the actual job of a business owner — judgment and relationships, not typing.

The practical setup: write each subagent a clear, narrow brief (its one job, its inputs, its output format, and what "done" looks like) and save it as a reusable prompt or agent definition. The first time you build one, it takes real effort. Every time after that, it's a resource you reuse across every client in that lane — this is the leverage.

## Templatizing delivery

Every deliverable type you've shipped more than twice should become a template: the prompt chain, the QC checklist, and the file structure, saved once and reused, not rebuilt from memory each time. If you find yourself re-explaining the same context to Claude for the third time on a similar task, that's the signal to templatize it.

A templatized offer also becomes easier to hand off — to a subagent, or eventually to a human contractor — because the instructions already exist in writing rather than living in your head.

## Productizing the service

The next step past templatizing is turning a custom service into a fixed-scope, fixed-price product. Instead of "I'll figure out what you need and quote you," you offer: "Here is exactly what you get, in exactly this format, for exactly this price." This is a deliberate trade: you give up some flexibility to gain speed of sale (buyers decide faster when the offer is concrete) and speed of delivery (you're not reinventing scope every time).

Signs you're ready to productize a given offer: you've delivered it at least 3–5 times, the scope barely changes between clients, and you can describe the process in a numbered list without hesitation. If any client work still requires significant custom thinking each time, it's not ready to productize yet — force it into a rigid box too early and you'll either underdeliver on complex cases or overdeliver (unpaid) on simple ones.

## When to raise prices

Raise prices when any of these are true, not on a fixed schedule:

- You are consistently full or turning down work at your current rate.
- Your QC pass rate has gone up — deliverables need less rework than they used to, meaning your effective cost to deliver has dropped while your price hasn't moved.
- You have case studies or testimonials (chapter 6) that didn't exist when you set your original price — new proof justifies a new number.
- A meaningful share of prospects say yes immediately with no negotiation — that's a signal you're underpriced, not that you're doing great.

Raise in increments you're comfortable defending out loud (commonly 15–30% at a time), and apply new pricing to new clients first — existing clients can be grandfathered for a period or renegotiated at their natural renewal point, not surprised mid-contract. **VERIFY: check what comparable providers in your niche are charging before each price increase, since "what the market will bear" changes over time and isn't something a static document can tell you.**

## The weekly operating rhythm: the CEO hour

Once you have more than one client, block one fixed hour a week — same day, same time — where you do only business-owner work, not delivery work. Nothing gets drafted, edited, or sent during this hour. The agenda, every week:

1. **Pipeline review** (10 min): who owes you a reply, who you owe a reply, what's stalling.
2. **KPI check** (10 min): pull the tracker from chapter 7 — outreach sent, replies, calls booked, closes, revenue this week vs. last week.
3. **Delivery health check** (10 min): any client deliverable that needed unusual rework this week? That's a signal a template or subagent brief needs updating.
4. **One outreach push** (20 min): even when you're "full," send at least a handful of new outreach messages every week. A pipeline you stop feeding runs dry the moment a client churns — and clients churn.
5. **One system improvement** (10 min): pick exactly one thing to templatize, automate, or delegate to a subagent this week. Not five things — one, done well, compounds faster than five started and abandoned.

The CEO hour is the single highest-leverage hour of your week precisely because it's the one hour where you're not doing the work — you're making the work need less of you next week than it did this week. Protect it like a client meeting, because in the long run, it's the meeting that keeps the business a business instead of a very demanding freelance job.
