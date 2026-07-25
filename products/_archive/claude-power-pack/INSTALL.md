# Install

Exact zsh commands. Run these from inside the extracted `claude-power-pack` folder.

## 1. Make sure the target folders exist

```zsh
mkdir -p ~/.claude/agents
mkdir -p ~/.claude/commands
```

## 2. Copy the agents

```zsh
cp agents/executor.md ~/.claude/agents/
cp agents/reviewer.md ~/.claude/agents/
cp agents/researcher.md ~/.claude/agents/
cp agents/marketer.md ~/.claude/agents/
cp agents/bug-hunter.md ~/.claude/agents/
```

Or, all at once:

```zsh
cp agents/*.md ~/.claude/agents/
```

## 3. Copy the commands

```zsh
cp commands/ship-check.md ~/.claude/commands/
cp commands/spec.md ~/.claude/commands/
cp commands/bug-hunt.md ~/.claude/commands/
cp commands/content-day.md ~/.claude/commands/
cp commands/seo-pass.md ~/.claude/commands/
cp commands/client-proposal.md ~/.claude/commands/
cp commands/standup.md ~/.claude/commands/
```

Or, all at once:

```zsh
cp commands/*.md ~/.claude/commands/
```

## 4. (Optional but recommended) Add the delegation policy to your global CLAUDE.md

If you don't already have `~/.claude/CLAUDE.md`:

```zsh
cp CLAUDE-template.md ~/.claude/CLAUDE.md
```

If you already have one and want to keep your existing content, append instead of overwrite:

```zsh
printf '\n\n' >> ~/.claude/CLAUDE.md
cat CLAUDE-template.md >> ~/.claude/CLAUDE.md
```

Then open `~/.claude/CLAUDE.md` and skim it once — merge/dedupe if you had a similar policy
already, since Claude Code reads this file on every session start.

## 5. Verify the install

Start (or restart) a Claude Code session, then run:

```
/agents
```

You should see `executor`, `reviewer`, `researcher`, `marketer`, and `bug-hunter` listed.

Then check the commands are registered:

```
/help
```

You should see `/ship-check`, `/spec`, `/bug-hunt`, `/content-day`, `/seo-pass`,
`/client-proposal`, and `/standup` in the list.

## 6. Quick smoke test

From any project directory, run:

```
/standup
```

If it reads your git log and produces a short update, the install worked end to end.

## Uninstall

```zsh
rm ~/.claude/agents/executor.md ~/.claude/agents/reviewer.md ~/.claude/agents/researcher.md \
   ~/.claude/agents/marketer.md ~/.claude/agents/bug-hunter.md

rm ~/.claude/commands/ship-check.md ~/.claude/commands/spec.md ~/.claude/commands/bug-hunt.md \
   ~/.claude/commands/content-day.md ~/.claude/commands/seo-pass.md \
   ~/.claude/commands/client-proposal.md ~/.claude/commands/standup.md
```

(The `CLAUDE-template.md` content you merged into `~/.claude/CLAUDE.md` is not automatically
removed — edit that file by hand if you want to remove the policy section.)
