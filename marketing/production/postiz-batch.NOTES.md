# Notes for `postiz-batch.example.json`

These were originally `_`-prefixed keys inside the JSON. **JSON has no comment
syntax** — the CLI would have sent them as real payload keys, which either errors
or silently pollutes the post. They live here instead; the `.json` file is now
clean and safe to pass to `--json`.

**source** — marketing/calendar/week-4.md — Day 27, CHEAT-CODE, CTA keyword BOTH. Instagram content below is the calendar caption verbatim; other platforms are length-trimmed variants of the same copy, no added claims.

**placeholders** — Every [BRACKETED] value must be replaced. Integration IDs come from `postiz integrations:list`. Media paths come from `postiz upload <file>` (.path). Date is START_DATE + 26 days.

**verify before trusting** — The `date`, `type` and `__type` keys below are our best reading of the JSON multi-platform format; the CLI reference we worked from documents the date as the `-s` flag and draft as the `-t draft` flag, not as JSON keys. Run `postiz posts:create --help` on your installed version, and confirm the first run landed as a DRAFT on the right date in the Postiz UI before scheduling anything else this way.

**provider values** — `provider` must match the `identifier` field that YOUR account returns from `postiz integrations:list`. Do not assume ours match — check first.
