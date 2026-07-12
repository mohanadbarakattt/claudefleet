# Category 5 — Automation & Systems

Ten prompts that turn Claude into an operations layer for your business — documentation, briefs, research, and reporting done for you. Fill every `[BRACKETED]` variable before you paste.

---

### Prompt 41 — SOP Writer from a Loom/Call Transcript

**What it makes you:** A polished, step-by-step SOP from a messy recorded walkthrough — sellable as an ops/documentation service.

```
You are an operations documentation specialist who turns raw screen-recording or call transcripts into clear, followable SOPs for a new hire or contractor with zero prior context. Process the transcript below.

Inputs:
- Process being documented: [PROCESS NAME]
- Who will follow this SOP (skill level, role): [AUDIENCE]
- Raw transcript/notes (paste as-is, however messy): [PASTE TRANSCRIPT]
- Tools/systems involved: [TOOLS]

Instructions:
1. Identify the clear start and end point of the process, and state the overall goal/outcome in one sentence at the top.
2. Break the transcript into discrete, numbered steps in the exact order they must be performed — remove filler, false starts, and verbal tangents, but preserve every actual action taken.
3. For each step, write in imperative voice ("Click X," "Open Y," "Enter Z") rather than describing what the speaker did ("then he clicked...").
4. Flag any step where the transcript is ambiguous, skips a detail, or assumes context the reader won't have — mark it as [NEEDS CLARIFICATION: specific question] rather than guessing.
5. Add a "common mistakes" section for any error-prone step mentioned or implied in the transcript.
6. Add a short "when to escalate" section: situations where the person following this SOP should stop and ask for help rather than guess.
7. Write a one-line summary/checklist version at the end for quick reference after the first read-through.

Output format:
## Process Goal
## Step-by-Step SOP (numbered)
## Common Mistakes
## When to Escalate
## Quick-Reference Checklist
## Clarifications Needed (if any)
```

**Sell it as:** $150–$400 per SOP as an ops-documentation service — high demand from founders who've never written anything down.

---

### Prompt 42 — Claude Code / Dev Project Brief Generator

**What it makes you:** A precise technical brief that turns a vague build idea into something a developer (or Claude Code) can execute correctly the first time.

```
You are a technical product manager who writes build briefs precise enough that a developer needs zero follow-up questions to start, while staying readable for a non-technical founder writing it. Build a complete project brief.

Inputs:
- Project/feature idea (however rough): [DESCRIBE THE IDEA]
- Who it's for / the problem it solves: [USER/PROBLEM]
- Existing system/codebase context (if any): [CONTEXT]
- Constraints (budget, timeline, tech stack preferences): [CONSTRAINTS]
- What "done" looks like: [SUCCESS CRITERIA IF KNOWN, or "help me define this"]

Instructions:
1. Restate the goal as a single clear problem statement and the specific outcome that defines success — push back gently if the stated goal is actually two projects disguised as one.
2. Break the project into discrete, ordered work items (not a vague feature list) — each item should be independently buildable and testable.
3. For each work item, define the acceptance criteria: the specific, observable condition that proves it works (not "make it good" but "user can do X and see Y result").
4. Flag the highest-risk or most ambiguous part of the brief and propose 2 options for resolving the ambiguity before work starts, rather than letting the developer guess.
5. List explicit non-goals: what this project is deliberately NOT trying to do, to prevent scope creep during build.
6. Suggest a minimal first milestone (smallest working version) separate from the full scope, so progress can be checked early.

Output format:
## Problem Statement + Success Definition
## Work Items (ordered, with acceptance criteria each)
## Highest-Risk Ambiguity + Resolution Options
## Non-Goals
## Minimal First Milestone
```

**Sell it as:** $200–$600 per brief as a "technical translation" service for non-technical founders hiring developers or using AI coding tools.

---

### Prompt 43 — Custom GPT / Agent Instruction Writer

**What it makes you:** A tight, effective system prompt for a custom AI assistant/agent — a fast-growing freelance niche as every business wants its own bot.

```
You are a prompt engineer who writes system instructions for custom AI assistants that stay reliably in-scope, in-voice, and useful rather than generic or prone to going off the rails. Write a complete system prompt/instruction set.

Inputs:
- Assistant's purpose (what it should help with): [PURPOSE]
- Who will use it (internal team, customers, public): [AUDIENCE]
- Platform (Custom GPT, Claude Project, other agent builder): [PLATFORM]
- Tone/persona: [TONE]
- Things it should never do or say: [BOUNDARIES/RESTRICTIONS]
- Knowledge/context it has access to (docs, FAQs, product info): [CONTEXT SOURCES]

Instructions:
1. Write a clear role definition: what this assistant is, its scope, and one sentence on what it explicitly is NOT (to prevent scope creep in conversation).
2. Write behavior instructions: how it should handle common request types within scope, how it should respond to out-of-scope requests (redirect, don't just refuse bluntly), and its tone/voice guidelines with 2-3 example phrasings.
3. Write explicit guardrails for the listed restrictions — phrased as clear rules, not vague hopes ("never provide X" rather than "try to avoid X").
4. Write instructions for handling uncertainty: what it should say when it doesn't know something, rather than guessing or hallucinating (especially important if it has reference docs — it should distinguish "in my knowledge" vs. general knowledge).
5. Include a short set of example interactions (2-3 sample Q&A pairs) demonstrating ideal behavior in tricky/edge-case situations.
6. Write a closing instruction on formatting/response length preferences appropriate to the use case.

Output format:
Complete system prompt in one block, ready to paste directly into the platform's instruction field, organized with clear headers (Role / Behavior / Guardrails / Uncertainty Handling / Examples / Formatting).
```

**Sell it as:** $250–$800 per custom assistant build — a rapidly growing service category as every SMB wants a branded AI helper.

---

### Prompt 44 — Data-Cleaning Prompt

**What it makes you:** A repeatable process for cleaning and standardizing messy spreadsheet/CSV data — a tedious task clients happily pay to outsource.

```
You are a data operations specialist who cleans and standardizes messy business data (customer lists, product catalogs, financial exports) methodically and flags issues rather than silently guessing. Process the data below.

Inputs:
- Data description (what it represents): [DATA DESCRIPTION]
- Raw data (paste a representative sample, or the full set if small): [PASTE DATA]
- Desired output format/standard (e.g. consistent date format, capitalization rules, deduplication rules): [STANDARDS]
- Known issues to look for (duplicates, typos, inconsistent formatting, missing fields): [KNOWN ISSUES OR "identify them"]

Instructions:
1. Scan the data and report an inventory of issues found: duplicate entries, inconsistent formatting (dates, phone numbers, casing), missing required fields, and obvious typos/misspellings — with counts and examples for each issue type.
2. Apply the requested standardization rules consistently across every row (not just the visible sample) and flag any row where the correct standardization is ambiguous rather than guessing silently.
3. For duplicates, show which rows were flagged as duplicates and the specific field(s) that matched, so a human can quickly verify before merging/deleting.
4. Output the cleaned data in the same structure as the input (table format) so it can be pasted back into a spreadsheet.
5. Provide a summary changelog: what was changed, how many rows were affected by each type of fix, and what still needs manual human review.

Output format:
## Issue Inventory (counts + examples)
## Cleaned Data (full table)
## Changelog Summary
## Rows Needing Manual Review
If the dataset is large, process it in clearly labeled batches and confirm before continuing to the next batch.
```

**Sell it as:** $100–$300 per cleaning job on Upwork/Fiverr — fast turnaround, low competition since most freelancers find it tedious.

---

### Prompt 45 — Competitor Teardown

**What it makes you:** A structured competitive analysis — a common $300-$800 consulting deliverable, or your own strategic input before entering a market.

```
You are a competitive intelligence analyst who builds structured teardowns that identify concrete, actionable gaps rather than generic SWOT filler. Build a complete competitor teardown.

Inputs:
- Your business/product: [YOUR BUSINESS DESCRIPTION]
- Competitors to analyze (2-4): [COMPETITOR NAMES]
- What you know about each (paste any research, screenshots described, pricing, positioning you've observed): [PASTE RAW RESEARCH NOTES]
- Specific question you're trying to answer (e.g. "where can we win on pricing," "what's our differentiation angle"): [SPECIFIC QUESTION]

Instructions:
1. For each competitor, summarize: their core positioning/value prop in one sentence, target customer, pricing model/range, and their apparent primary acquisition channel based on the research notes.
2. Build a comparison table across all competitors plus your business on 5-7 relevant dimensions (price, feature set, target segment, support level, brand positioning, etc. — choose dimensions relevant to the stated question).
3. Identify each competitor's most likely weakness or gap based on the research (something they're not addressing, a segment they're ignoring, a common complaint pattern if review data was provided).
4. Directly answer the specific question asked, with reasoning tied to the comparison — not a generic "it depends."
5. Recommend 2-3 concrete positioning or product moves your business could make to exploit the identified gaps, ranked by how defensible/differentiated they'd be (not just "lower the price").
6. Flag any area where the provided research is too thin to draw a confident conclusion, and specify what additional research would resolve it.

Output format:
## Competitor Summaries
## Comparison Table
## Identified Gaps per Competitor
## Direct Answer to the Core Question
## Recommended Moves (ranked)
## Research Gaps
```

**Sell it as:** $300–$800 per teardown as a standalone strategy deliverable, or bundled into a positioning/marketing retainer.

---

### Prompt 46 — Market Research Synthesizer

**What it makes you:** A structured synthesis of scattered research (articles, reports, notes) into a decision-ready brief — saves hours of manual synthesis.

```
You are a market research analyst who synthesizes scattered raw research into a clear, decision-ready brief rather than just summarizing each source separately. Synthesize the research below.

Inputs:
- Research question/decision this needs to inform: [DECISION/QUESTION]
- Raw research materials (paste article excerpts, notes, data points, however unorganized): [PASTE RAW MATERIALS]
- Audience for the final brief (exec, investor, internal team): [AUDIENCE]

Instructions:
1. Identify the 3-5 core themes that emerge across the raw materials, even if individual sources didn't state them explicitly — this is synthesis, not summary.
2. For each theme, cite which pieces of the raw material support it, and note where sources agree vs. conflict.
3. Extract the specific data points/statistics most relevant to the stated decision, organized clearly (not buried in prose).
4. Write a clear "so what" section: given this research, what does it actually mean for the decision at hand — be direct, not hedgy.
5. Flag any gap in the research — an important question the provided materials don't answer — and note what additional research would close it.
6. Write an executive summary (4-6 sentences) at the top that could stand alone for someone who won't read the full brief.

Output format:
## Executive Summary
## Core Themes (with supporting evidence citations)
## Key Data Points
## Implications for the Decision ("So What")
## Research Gaps
Note: flag any claim in the raw materials that seems unverified or from a low-credibility source, rather than presenting all inputs as equally reliable.
```

**Sell it as:** $250–$600 per brief as a research-synthesis service for founders, investors, or strategy consultants short on time.

---

### Prompt 47 — Weekly Business Review

**What it makes you:** A structured weekly review from raw numbers and notes — turns chaotic week-to-week operating into a repeatable rhythm.

```
You are a fractional COO who runs weekly business reviews that surface what actually matters instead of just restating every number. Build this week's review.

Inputs:
- Business: [BUSINESS DESCRIPTION]
- Key metrics this week (paste raw numbers — revenue, leads, churn, whatever's tracked): [PASTE METRICS]
- Prior week's numbers for comparison (if available): [PASTE PRIOR WEEK OR "not available"]
- Notable events/context this week (launches, issues, wins): [CONTEXT NOTES]
- Goals/targets for this period: [GOALS]

Instructions:
1. Open with the single most important takeaway of the week in one sentence — the thing that matters most, not a list of everything that happened.
2. Present key metrics in a table with week-over-week change and a flag (green/yellow/red equivalent described in words) against the stated goals.
3. For any metric that moved significantly (up or down), give a one-line hypothesis for why, tied to the context notes provided — don't just report the number without interpretation.
4. Identify the top 1-2 risks or blockers that need attention this coming week, stated specifically and directly.
5. Identify the top 1-2 opportunities or wins worth doubling down on.
6. Write 3 specific action items for the coming week, each with a clear owner placeholder [OWNER] and why it's a priority.

Output format:
## This Week's Headline
## Metrics Table (with WoW change + status)
## What's Driving the Numbers
## Risks/Blockers
## Opportunities
## Next Week's Action Items (3, with owner + rationale)
```

**Sell it as:** Run this weekly for yourself for free operating discipline, or sell as a $500-$1,500/mo fractional-ops-review service to small business owners.

---

### Prompt 48 — KPI Dashboard Spec

**What it makes you:** A clear spec for what to track and why — the blueprint before building any dashboard in Sheets, Notion, or a BI tool.

```
You are a business analyst who designs KPI dashboards that track what actually drives decisions, not vanity metrics. Build a complete dashboard spec.

Inputs:
- Business/team: [BUSINESS/TEAM DESCRIPTION]
- Primary goal this dashboard should support: [GOAL]
- Data sources available: [DATA SOURCES — e.g. Stripe, Google Analytics, CRM, manual tracking]
- Audience for the dashboard (founder, team, investors): [AUDIENCE]
- Reporting cadence: [DAILY/WEEKLY/MONTHLY]

Instructions:
1. Define the single "north star" metric this dashboard should center around, tied directly to the stated goal, and explain why it's the right one over other candidate metrics.
2. Define 4-6 supporting metrics that explain movement in the north star metric (leading indicators, not just more lagging outputs) — for each, state the data source and calculation.
3. Explicitly list 2-3 commonly-tracked "vanity metrics" for this type of business that should NOT be prioritized on this dashboard, and why they're less useful than the chosen metrics.
4. Design the dashboard layout: what's shown at the top (north star + trend), what's grouped below (supporting metrics by category), and any segment/breakdown views needed.
5. Define what "good," "warning," and "bad" look like for each key metric (specific thresholds where possible) so the dashboard can visually flag status, not just show raw numbers.
6. Note any data collection gaps — metrics that matter but aren't currently tracked — and suggest the simplest way to start capturing them.

Output format:
## North Star Metric + Rationale
## Supporting Metrics (source + calculation each)
## Vanity Metrics to Avoid
## Dashboard Layout
## Status Thresholds (good/warning/bad per metric)
## Data Gaps + How to Close Them
```

**Sell it as:** $300–$700 per dashboard spec as a fractional-analyst deliverable, often the entry point into an ongoing reporting retainer.

---

### Prompt 49 — Hiring Test Task Generator

**What it makes you:** A realistic, well-scoped paid test task for evaluating a candidate — saves hours of hiring-process design per role.

```
You are a hiring manager who designs test tasks that accurately predict on-the-job performance without wasting the candidate's time or leaking excessive free work. Design a complete test task.

Inputs:
- Role being hired for: [ROLE]
- Core skill(s) this task must evaluate: [SKILLS TO EVALUATE]
- Time budget for the candidate (should be respected, not padded): [TIME BUDGET, e.g. 2 hours]
- Real (but low-stakes) context/materials you can provide (anonymized if needed): [CONTEXT/MATERIALS]
- Compensation for the task (if paid): [COMPENSATION OR "unpaid — keep scope minimal"]

Instructions:
1. Design a task scenario that closely mirrors real day-one work for this role, using realistic (anonymized if needed) context rather than an abstract puzzle unrelated to the actual job.
2. Scope the task to fit clearly within the stated time budget — err toward smaller scope with clear instructions over an ambitious task that overruns.
3. Write the exact instructions the candidate will receive: context, the task, constraints, and exactly what to submit (format, length).
4. Design a scoring rubric: 4-5 criteria tied directly to the core skills being evaluated, each with what a strong/average/weak response looks like — avoid rubric criteria that reward "more effort" over the actual skill being tested.
5. Flag anything in the task design that risks extracting free real work disguised as a test (a red flag for candidates and a legal/ethical risk) and suggest an adjustment if so.
6. Write a short candidate-facing note on timeline (when they'll hear back) and what happens next, to keep the candidate experience respectful.

Output format:
## Task Scenario + Candidate Instructions
## Time Budget + Submission Format
## Scoring Rubric (4-5 criteria, strong/average/weak descriptions)
## Free-Work Risk Check
## Candidate Communication Note
```

**Sell it as:** $150–$400 per role as a fractional-recruiting-ops deliverable, or use directly to build a faster, fairer hiring process.

---

### Prompt 50 — Personal CEO Daily Briefing

**What it makes you:** A daily operating briefing that turns scattered inputs into a clear, prioritized start to the day — a genuine personal productivity unlock.

```
You are an executive assistant/chief-of-staff who prepares daily briefings that cut through noise and tell the founder exactly what matters today. Build today's briefing.

Inputs:
- Business/role: [BUSINESS/ROLE DESCRIPTION]
- Today's calendar/meetings (paste as-is): [PASTE CALENDAR]
- Open tasks/to-dos (paste as-is, however messy): [PASTE TASK LIST]
- Anything urgent or top-of-mind right now: [CURRENT PRIORITIES/CONCERNS]
- Key metrics or numbers to check in on (if relevant today): [METRICS TO WATCH]

Instructions:
1. Write a 2-3 sentence "state of today" summary: the one thing that matters most today given everything provided, stated directly.
2. Review the calendar and flag: any meeting that looks like it lacks a clear purpose or prep needed, and what prep (if any) is needed before each meeting.
3. Review the task list and reorganize it into: 3 "must do today" items (tied to actual stated priorities, not just whatever's oldest), a "can wait" bucket, and anything that looks like it should be delegated or dropped entirely.
4. Flag any conflict between the calendar and the task priorities (e.g. too many meetings to realistically complete the "must do" items) and suggest a specific resolution (what to move or cut).
5. If metrics were provided, give a one-line read on each (fine, needs attention, needs immediate action).
6. Close with a single, specific "if you only do one thing today" recommendation.

Output format:
## State of Today
## Calendar Review + Prep Flags
## Prioritized Task List (Must Do / Can Wait / Delegate-or-Drop)
## Calendar/Task Conflicts + Resolution
## Metrics Check
## If You Only Do One Thing Today
```

**Sell it as:** Run this daily for yourself as a free chief-of-staff, or package as a $300-$700/mo "AI executive assistant" retainer service for other founders.
