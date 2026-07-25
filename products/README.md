# products/ — layout and the one thing that confuses everybody

```
products/
  _engine/                     ← ONE canonical copy of the shared engine
    ENGINE.md  INSTALL.md  pipeline.example.json
    admin-panel/index.html     (single-file, offline, no build step)
    hooks/settings-hooks.json  hooks/README.md
  autopilot-content-machine/   ← machine 1 ($99): docs + skills/ + agents/
  digital-product-machine/     ← machine 2 ($99): docs + skills/ + agents/
  _archive/                    ← retired products, not sold (see its README)
  verify-coherence.sh          ← the C17 guard; package.sh refuses to build if it fails
```

## Why the machine folders have no `_engine/` — and why that is correct

Both machines' docs reference `_engine/INSTALL.md`, `_engine/hooks/settings-hooks.json`,
`_engine/admin-panel/index.html` and `_engine/pipeline.example.json` as
`$FLEET_SRC/_engine/...`. Looking at the repo, those paths appear to be missing from the
product folders. **They are not missing.**

`package.sh` copies `products/_engine/` into each machine at package time, so the zip a
buyer downloads contains:

```
autopilot-content-machine/
  _engine/ENGINE.md  _engine/INSTALL.md  _engine/pipeline.example.json
  _engine/admin-panel/index.html  _engine/hooks/...
  00-START-HERE.md  README.md  02-build-prompts.md  ...
  skills/  agents/  bonus/
```

Every `_engine/...` path in the docs is therefore true **for the buyer**, who is the only
audience those docs have. The repo keeps a single copy so there is one file to edit
instead of two that drift — which is the whole point, given drift (defect class C17) is
what bit this product once already.

**Do not "fix" the docs by removing the `_engine/` references, and do not commit a second
copy of the engine into a machine folder.** Verify with:

```bash
bash package.sh && unzip -l dist/claudefleet-content-machine.zip | grep _engine/
```

`verify-coherence.sh` enforces this: it fails if any `_engine/...` path referenced in a
product doc does not exist in `products/_engine/`.

## Ground rule for this directory

`skills/` and `agents/` are **executables and are ground truth.** When a doc and a skill
disagree, the doc is wrong — move the doc. Renaming a shipped skill to match a doc breaks
every buyer who already installed it.
