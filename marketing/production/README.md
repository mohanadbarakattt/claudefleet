# Production pack — how to actually shoot and ship the 30 days

Everything upstream of this folder is *written*: two products, a storefront, 30
days of calendar, 6 launch reels, a DM funnel. This folder is how that becomes
posted content.

Read this page first. It is the sequence; the other files are the detail.

## State of play (checked, not assumed — 2026-07-25)

| Thing | State | What it means for you |
|---|---|---|
| Higgsfield MCP API | **erroring** (`net::ERR_FAILED`) | Generate in the Higgsfield **web app** by pasting prompts. Automated generation isn't available right now. |
| Higgsfield credits | **low** | The packs are priority-ordered. Generate the style test first, then only what's load-bearing. |
| Postiz CLI | **not installed** | `npm install -g postiz` — node 25 and npm 11 are already here, so this is a one-liner. |
| `POSTIZ_API_KEY` | **not set** | Nothing Postiz-related runs until you export it. |
| Gumroad links | **still placeholders** | ⚠️ **This gates everything below.** Posting drives comments → DMs → a dead link. Do not start the calendar until checkout works. |

## The one hard dependency

**Do not post day 1 until the storefront can take money.** The whole funnel ends
at a link. Four placeholders remain in `site/index.html`
(`GUMROAD_LINK_CONTENT_MACHINE`, `GUMROAD_LINK_PRODUCT_MACHINE`,
`GUMROAD_LINK_BUNDLE`, `FORM_ENDPOINT`). Everything else here can be produced
in advance while that's pending — footage doesn't expire.

## Order of operations

**1. Record the screen captures — do this first.**
`screen-record-shotlist.md`. About 25 of 30 days and two entire launch reels
(Reels 2 and 4) are real screen recordings. They cost nothing but your time,
they're the highest-trust format in the research, and they're the only thing
here with zero external dependency. The shot list is grouped into capture
sessions so you record once and cut many times.

**2. Generate the AI video — only 16 clips, in priority order.**
- `higgsfield-reel-prompts.md` — the launch reels (Reels 1, 3, 5, 6).
- `higgsfield-calendar-prompts.md` — the five calendar days that need it
  (Ava's guru-guide days, plus Day 1's pattern-interrupt).

Generate the **style test shot first** in each pack. One clip's worth of credit
tells you whether the look is right before you commit to the rest. Both packs
carry a character continuity block — use one approved still as the start image
for every later shot, or the characters drift and the account stops looking
like one account.

**3. Edit.** Cut per the 4-column tables in `../production-scripts.md` and the
per-day Beats in `../calendar/`. **All on-screen text is added here, never
generated** — that rule exists because two clips in the first batch shipped
with warped text and had to be redone.

**4. Schedule through Postiz.** `postiz-pack.md` + `postiz-batch.example.json`.
Install, export the key, `integrations:list` to get your real IDs, upload media
to Postiz *before* posting (several platforms reject external URLs), then
schedule **as drafts** and review before anything goes live.

**5. Wire the DM funnel.** `../dm-automation.md`, keywords
**CONTENT / PRODUCT / BOTH / START**. Retire the old STACK/VAULT/OS/FLEET/FULL
automations or old reels will DM people about products that no longer exist.

## What is deliberately not automated

The engine schedules; it does not publish. Every stage stops at a human gate —
that's the product's own rule and this pack follows it. Nothing in here posts
on your behalf, and the batch script creates **drafts**.

Two more, stated plainly because they're the difference between this working
and this being another AI-slop account:

- **Never fake a screen.** No mocked dashboards, no invented balances, no
  income screenshots. Fraud researchers name that as the #1 tell, and the whole
  positioning here is that we show the real folder.
- **Never call sped-up footage "unedited."** Say "sped up, not cut."

## What you still have to supply

Nothing in these packs invents your data. You will fill in:
`[START_DATE]`, your Postiz integration IDs and channel handles, your timezone
and posting windows, and your own recordings. Any figure you want to state
publicly has to be one you can point at.
