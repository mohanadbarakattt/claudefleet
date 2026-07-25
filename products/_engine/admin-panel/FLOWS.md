# Operations console — the flows, and what each one proves

Five flows, each captured from the console actually running. These are the
shots the calendar and reels point at when a Visual note says "the real admin
panel". Every one is reproducible: open `index.html`, follow the steps.

The console is a **local, offline, file-based operator console**. It has no
backend, makes no network requests, and never executes a command. It records
runs; Claude Code performs them. Every string in the UI says so.

---

## FLOW 1 — Operations: the whole business on one screen
**Open:** `index.html` → **Operations** tab.

Header status strip (machine · stage counts · awaiting-approval · simulation
state · live clock), three operator-maintained service tiles, then the **job
queue**: every stage run as a row — job id, machine, card, stage, the slash
command it corresponds to, status, started-at, duration, artifact path.

**What it proves:** this is a system with state, not a chat. Filters by machine
and status; the summary chips (`4 total · 1 awaiting approval · 2 done · 1
failed`) read at a glance.

**Feeds:** Day 1, Reel 1 row 4, Reel 6 rows 2–3.

---

## FLOW 2 — Simulation starts, and says so
**Do:** Simulate Mode → pick a card → speed `4x` → **Start simulation**.

A striped banner locks to the top: *"SIMULATION — not a real run. No commands
are being executed."* The status strip switches to `SIMULATION running —
nothing executed`. A new job appears carrying a **`SIM` badge** and a `SIM ·`
title prefix.

**What it proves:** the console can be demonstrated without a live Claude
session, and simulated activity is impossible to pass off as real.

> **Compliance — this outranks every other note.** If a shot contains simulated
> activity, the badge or the banner must be legible in frame. A cropped
> screenshot of simulated jobs with no badge visible is indistinguishable from
> a fabricated dashboard, which is the #1 scam tell in this niche.

---

## FLOW 3 — It stops at the human gate *(the one worth filming)*
**Watch:** the simulation advances, then halts. The footer reads *"Paused at a
human gate. Approve it in the inbox to continue."*

**What it proves:** the product's core claim, demonstrated rather than
asserted — **nothing advances unattended.** It will sit there indefinitely.

**Feeds:** Day 30 beat 2 (the three seconds of dead air at a halted gate),
Reel 1 row 5, Day 22.

---

## FLOW 4 — Approval Inbox: acting on a gate changes the board
**Open:** **Approvals** tab.

Each pending item states plainly what approving *does* — e.g. *"Approving marks
`/cf-ideas` at stage 1 · Idea as done and moves the card to Script"* — with the
artifact path, and **Approve** / **Request changes** / **Copy path** /
**Details**. Below, a **BLOCKED — CHANGES REQUESTED** section holds items
returned with a note.

**Do:** click **Approve** on the simulated gate.

Observed: the job advanced `/cf-ideas` → `/cf-script`, the card moved Idea →
Script, and the header counts shifted `Idea 2 / Script 1` → `Idea 1 / Script 2`.

**What it proves:** the inbox and the board are one system. Approving here
mutates the same state the board reads — an operations console, not a tracker.

**Feeds:** Day 9, Day 22, Reel 6.

---

## FLOW 5 — Reset is surgical
**Do:** **Reset** in the simulate bar.

Measured on a live run:

| | before | after |
|---|---|---|
| cards | 11 (1 sim) | 10 (**0** sim) — 10 real cards untouched |
| jobs | 9 (2 sim) | 7 (**0** sim) — 7 real jobs untouched |
| activity | 17 (11 sim) | 6 (**0** sim) — 6 real events untouched |

SIM flags also survive an export → re-import round trip, so a simulated record
cannot lose its badge by passing through `pipeline.json`.

**What it proves:** simulation can never contaminate real state, and the badge
can't be laundered off.

---

## Also in the console

- **Board** — the five-column pipeline. Simulated cards carry diagonal striping
  *and* a `SIM` badge, so they're distinguishable even in a cropped screenshot.
- **Activity** — reverse-chronological feed of every state change, relative
  timestamps, each line badged when simulated and worded honestly
  (*"started — /cf-ideas (simulated; nothing is executed)"*).
- **Ledger** — the append-only run log and the cost tracker. Costs start empty
  by design: you fill them from your own invoices. The console never estimates
  a price and never quotes a vendor's.
- **Artifact drawer** — click any job for its metadata and recorded artifact
  path, with Copy path. It shows the **path**, never a faked file preview — the
  console cannot read your filesystem and doesn't pretend to.

## Recording these

Capture at 1280×1500 or wider; the layout is responsive down to phone width.
Leave the live clock visible — a real timestamp is part of what makes a
recording read as unfaked. Never film Simulate Mode without the banner or
badges in frame. See `../../../marketing/production/screen-record-shotlist.md`
Session D for which days each capture feeds.
