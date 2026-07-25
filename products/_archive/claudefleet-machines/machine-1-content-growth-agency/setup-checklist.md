# Setup Checklist — Zero to First Client Delivery

Work top to bottom. Don't skip ahead to outreach before the agents are
actually installed and tested — sending a cold sequence before you can
deliver is how you burn a first-reply lead.

## 1. Accounts to create

- [ ] Claude Code or Claude Pro account active (see `requirements.md`) —
      confirm you can actually run subagents before relying on them
- [ ] Apollo.io account created, workspace set up
- [ ] Resend account created (can wait until just before first delivery, but
      set it up now so it's not a blocker later)
- [ ] Higgsfield account created (needed if offering Full-Service/production,
      or if you want a sample clip for outreach)
- [ ] Gumroad or Lemon Squeezy account created, payment method connected so
      you can actually invoice/collect once you close a client

## 2. Agents to install

- [ ] Copy the four files in `/agents` (`strategist.md`, `script-writer.md`,
      `video-prompt-engineer.md`, `outreach-agent.md`) into your Claude Code
      project's agent directory
- [ ] Confirm each agent loads (check `name`/`description`/`tools` frontmatter
      parses correctly — no YAML errors)
- [ ] Run one test prompt against `strategist` with a made-up niche (e.g. "a
      local pilates studio, audience is busy professionals 25-40, goal is
      class bookings") and confirm it returns a themed weekly plan, not a
      generic list
- [ ] Feed that plan into `script-writer` and confirm it returns a full
      script + captions, not just a summary
- [ ] Feed that script into `video-prompt-engineer` and confirm it returns
      scene-by-scene generation prompts with a consistent style anchor
- [ ] Run `outreach-agent` once against a made-up prospect to confirm the
      tone matches `outreach-system.md`'s base sequence

## 3. First outreach batch

- [ ] Define your target niche for the first batch (pick one specific niche
      to start — "creators" is too broad; "local fitness studios in my metro
      area" is workable)
- [ ] Build a list of 20-30 real prospects in Apollo.io matching that niche
- [ ] Load the 4-email sequence from `outreach-system.md` into an Apollo
      sequence, personalizing the bracketed fields per prospect (use
      `outreach-agent` to help personalize the observation line for each one
      — never send the generic template unedited)
- [ ] Send the first batch and set a calendar reminder to check replies daily
- [ ] Have the warm-audience DM script ready to send to 5-10 people in your
      own existing audience/network in parallel, if you have any following
      already — warm replies typically come faster than cold ones

## 4. First deliverable (produce before you need it, not after closing)

- [ ] Pick one realistic sample client profile (can be a real prospect you're
      pursuing, or a plausible niche you're targeting) and run the full
      pipeline once end-to-end: strategist → script-writer →
      video-prompt-engineer, producing one full week of content
- [ ] Review every script yourself for tone/quality before treating it as
      portfolio-ready — this is the human quality gate the playbook calls out
- [ ] If offering Full-Service, generate at least one actual clip in
      Higgsfield from the prompts to confirm the full loop works
- [ ] Package the output as your sample/portfolio piece to reference in
      outreach follow-ups ("want me to send a sample week for your niche?")
- [ ] Once a real client signs, set up the Resend flow to deliver their first
      real content calendar on the schedule you quoted them — do this before
      the delivery deadline, not on it
