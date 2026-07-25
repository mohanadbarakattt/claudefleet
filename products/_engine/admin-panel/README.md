# ClaudeFleet Engine — Admin Panel

One file. `index.html`. No build step, no server, no internet.

## Open it

Double-click `index.html`, or drag it into a browser. It runs from a `file://`
URL. Nothing is uploaded anywhere and the page makes zero network requests —
you can open it on a plane.

State is saved to that browser's local storage as you work. First open loads
**demo data** so the panel is explorable straight away; hit **Clear demo data**
in the orange banner before you start running your own pipeline.

If your browser blocks local storage (some `file://` sandboxes do), the panel
still runs — the footer tells you so, and you keep your work by exporting the
JSON before you close the tab.

## The JSON round-trip with Claude Code

The panel and Claude Code hand the same file back and forth: **`pipeline.json`**.

- **Export JSON** downloads the panel's current state as `pipeline.json`. Move it
  over your fleet home's copy — `mv ~/Downloads/pipeline.json ~/claudefleet/pipeline.json`
  — so the skills and hooks can read it. It lives in the **fleet home root**, not
  inside the machine folder. Put it one directory too deep and the hooks silently
  find nothing.
- Run a skill in Claude Code (`/cf-script`, `/dp-build`, …). **The skill** writes
  the result back into `pipeline.json` — new cards, stage changes, run-log lines.
  The hooks only append to `logs/run.log`; by design they never mutate
  `pipeline.json`, so a hook firing mid-edit can't corrupt your pipeline.
- **Import JSON** in the panel, pick that `pipeline.json`, and the board catches
  up with whatever Claude Code did. Import replaces the panel's state after a
  confirm, and unknown or malformed fields are dropped rather than crashing the
  page.

There is no live sync. The file is the handoff, and it is deliberately plain
JSON so you can read or fix it in any editor.

## Changing the stages or commands

The stage names, slash commands and per-stage descriptions for both machines
live in the `MACHINES` object at the very top of the `<script>` block. Edit that
object and the header selector, the board columns, the Next action box and the
run-log dropdown all follow. Each machine has exactly five stages.

## Service status is operator-maintained — not a live check

The CLAUDE / HIGGSFIELD / POSTIZ tiles are a notebook, not a monitor. The panel
cannot and does not contact those services, verify credentials, or detect
outages. You flip the toggle, hit "Set to now", and write the note yourself
after you run something. A green dot means *you said it was working*.

## Costs

The cost tracker starts empty on purpose. It ships with no prices because
Claude, Higgsfield and Postiz each bill on their own plans and those change —
check each vendor's current pricing page and type your own actual invoice
amounts. The panel adds them up per month; it does not estimate, forecast, or
project anything.

Note that all three are paid third-party subscriptions. The engine drives them;
it does not replace them.
