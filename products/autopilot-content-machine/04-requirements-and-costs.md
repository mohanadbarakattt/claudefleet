# Requirements and costs

## The short version

| Dependency | Required? | Paid? | Used by stages |
|---|---|---|---|
| Claude Code (paid Claude plan or API billing) | Yes | Yes, recurring | 1, 2, 3, 4, 5 |
| Higgsfield account with credits | Yes | Yes, recurring | 3 |
| Postiz (hosted plan **or** self-hosted) | Yes | Hosted: yes. Self-hosted: your server | 5 |
| Connected social accounts | Yes | Free | 5 |
| macOS or Linux with zsh (Windows: WSL) | Yes | — | all |
| `python3` | Yes (for hooks) | Free | — |
| `jq` | Optional | Free | — |
| A video editor you already know | Yes | Free options exist | 4 |
| A browser | Yes | Free | dashboard |
| Disk space + a backup habit | Yes | — | 3, 4 |

**This product never quotes a price for anything.** Vendor pricing changes, differs by
region, tier and billing period, and anything printed in a file you downloaded is stale the
day after it's written. Every number below is one you look up yourself.

---

## Claude — Claude Code

**What it's for:** the brain. It runs all five skills, delegates to the agents, reads and
writes `pipeline.json`, and produces every word the machine generates — angles, scripts,
captions, generation prompts, cut orders.

**Why the machine can't run without it:** the machine *is* a set of Claude Code skills,
agents and hooks. Without Claude Code there is no orchestration layer at all — you'd be
left with a JSON file and a dashboard.

**What you need:** Claude Code installed and authenticated against a paid Claude plan, or
API billing. Free-tier usage is not a realistic basis for running a content pipeline: you
will hit limits mid-batch. Usage is real and ongoing, and heavier batches cost more.

**Verify current pricing and plan limits at Anthropic's own pricing page before you
commit.** Plans and API billing are structured differently; pick deliberately, and check
what the rate limits are for the tier you're considering, because those limits determine
your realistic batch size more than price does.

## Higgsfield

**What it's for:** the media factory. Stage 3 writes a shot-by-shot generation brief;
Higgsfield renders the video and image assets from those prompts, in **your** account, on
**your** credits.

**Why the machine can't run without it:** the engine writes prompts — it does not generate
media and cannot spend credits you haven't bought. Without a funded media generator, stage
3 has no output and cards stop there. (You *can* substitute your own filmed footage or
stock and skip stage 3, but then you're buying a writing and scheduling system, not this
machine's full loop — decide that before you buy, not after.)

**What you need:** an account with enough credit for your weekly volume. Generation is
credit-consuming per clip, and **retries consume credits too** — which is why the runbook
enforces a two-strike rule. Budget for waste: not every generation is usable, and that is
normal, not a defect.

**Verify current pricing, plan tiers and what a credit buys at Higgsfield's own pricing
page before you commit.** Also generate one throwaway clip by hand before your first
`/cf-render` so you know the interface and roughly how far your credits go at your quality
settings.

## Postiz

**What it's for:** distribution. Stage 5 hands the approved asset, caption and slot to
Postiz, which queues and publishes to the social accounts you've connected.

**Why the machine can't run without it:** the machine's job ends at "approved and ready
with a schedule". Postiz is what turns that into posts on a calendar. Without it you're
publishing by hand, one post at a time, which is exactly the manual work the pipeline
exists to remove.

**What you need:** either a hosted Postiz plan, or a self-hosted install (it's open
source) on a machine or server you control. Self-hosting removes the subscription but
replaces it with a server bill and your own maintenance — that trade is real, not free.
Either way you need the target social accounts connected and authorised inside Postiz.

**Verify current pricing, plan tiers and the supported platform list at Postiz's own
pricing and documentation pages before you commit.** Platform support and API access
change on the platforms' schedules, not Postiz's, so confirm your specific networks are
supported today.

## The rest

- **Social accounts.** Free, but they must exist, be in good standing, and be connectable
  to Postiz. Some networks require a business/creator account for scheduled posting —
  check yours before render day.
- **OS and shell.** macOS or Linux with zsh. On Windows, run everything inside WSL; the
  install script and hooks are POSIX shell and python.
- **`python3`.** The three hooks are python one-liners. No python3, and the hooks silently
  do nothing — you lose the session snapshot and the audit log, and nothing else.
- **`jq`.** Only for the automatic hook merge and the verification commands. There's a
  manual merge path in `_engine/INSTALL.md` if you'd rather not install it.
- **A video editor.** Stage 4 produces a cut order and on-screen text cards; a human cuts
  the actual video. Any editor you already know is fine, including the free ones. This
  machine does not edit video and does not ship an editor.
- **Storage and backup.** Generated clips are large. `~/claudefleet/` is your business
  state — back it up. Keeping the fleet home in a git repo is the cheapest option and
  makes `pipeline.json` history readable.

---

## About the money, plainly

**Your $99 buys the system: the pipeline, the five skills, the agents, the hooks, the
dashboard and this documentation. It does not buy the subscriptions, and it does not
reduce them.**

Claude, Higgsfield and Postiz are three separate vendors who will bill you directly, every
month, for as long as you run this. Those costs are real, recurring, and larger over time
than the price of this product. They scale with your volume: more posts means more Claude
usage and more Higgsfield credits. If those recurring costs don't make sense for your
situation, this machine is not a good purchase — that's a straight answer, and it's better
to have it now than after you've installed it.

What the machine changes is the labour and the consistency, not the vendor bills. It
removes the blank page, keeps the format stable across weeks, and holds the state so work
doesn't die between sessions. It makes no claim about what you'll earn, and you should
distrust any tool that does. The only guarantee attached to this product is the 30-day
money-back guarantee on your purchase price.

**Track what you actually spend.** The `costs` array in `pipeline.json` exists for this:
one entry per month per service, with the amount from your own invoice. Log it weekly (it
takes two minutes, step 5 of the daily loop) and total it in the Friday review. A pipeline
whose costs column is empty tells you nothing about whether the business works.

---

## Pre-flight checklist

Tick every line before your first full run. Anything unticked is a thing that fails
mid-batch instead.

**Accounts and billing**

- [ ] Claude Code installed; `claude --version` prints a version
- [ ] Claude Code authenticated against a paid plan or API billing
- [ ] Checked Anthropic's current pricing page and know what tier you're on
- [ ] Higgsfield account created and funded
- [ ] Checked Higgsfield's current pricing page; know what your credits buy
- [ ] Generated one throwaway Higgsfield clip by hand
- [ ] Postiz running — hosted plan active, or self-hosted install reachable
- [ ] Checked Postiz's current pricing/docs; confirmed your platforms are supported
- [ ] Every target social account connected in Postiz, and one manual test post published
- [ ] A monthly number written down that you're willing to spend across all three

**Machine**

- [ ] `python3 -V` works
- [ ] `ls ~/.claude/skills/*/SKILL.md` lists all five `cf-*` skills
- [ ] `ls ~/.claude/agents` lists this machine's agents
- [ ] `jq '.hooks | keys' ~/.claude/settings.json` includes SessionStart, PostToolUse, Stop
- [ ] Read `_engine/hooks/README.md` and satisfied yourself about what the hooks do
- [ ] `~/.claude/settings.json.bak.*` backup exists
- [ ] Dashboard opens and **Import JSON** loads your real `~/claudefleet/pipeline.json`
- [ ] `~/claudefleet/content-machine/notes/<offer-slug>-intake.md` written, all eight
      questions answered
- [ ] Compliance limits for your niche written into the intake
- [ ] A video editor installed that you can already use
- [ ] A backup destination chosen for `~/claudefleet/`

**Judgment**

- [ ] You know which single metric you'll judge posts on
- [ ] You have a weekly cadence you can sustain in a bad week
- [ ] You have a fixed weekly slot for the review, in your calendar
- [ ] You accept that nothing publishes without you looking at it first
