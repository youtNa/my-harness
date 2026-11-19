---
name: research-harness
description: Run reproducible research trials for AI software-engineering agents and turn observed behavior into concise Chinese HTML reports and reusable project knowledge.
---

# Research Harness

Use this skill when evaluating an AI coding agent, multi-agent workflow, verification product, or Harness methodology.

## Required outcome

Produce a short Chinese HTML report that separates:

- 已验证：observed through an actual command or run
- 未验证：not run yet
- 阻塞：could not run and the concrete reason
- 判断：one concise product implication

## Trial rules

1. Pin the image tag, commit, package version, or digest.
2. Prepare a disposable repository with a baseline test and at least one independent regression check.
3. Run the tool's primary workflow, not only installation or `--help`.
4. Prefer Docker. Use a local runtime only when its sandbox boundary is explicit.
5. Never mount the host Docker socket unless the user explicitly approves the elevated risk. Prefer a nested runtime, local process runtime, or a purpose-built sandbox image.
6. Do not read or print secret values. Pass credentials only through ephemeral environment variables when the user has authorized a real run.
7. Capture command, version, input task, output, changed files, test result, failure, cleanup, and cost when available.
8. If the main workflow cannot run, stop after recording the first reproducible blocker and state what information or approval is needed.

## Standard task shape

Use a small task that has:

- a failing baseline test
- a plain-language requirement
- one hidden or separately executed regression check
- a bounded iteration budget

## Report shape

Use `references/report-template.html` as the starting point. Keep the report concise. Prefer a status card, a simple flow diagram, and a small evidence table over long prose.

## Knowledge capture

After each trial, update:

- `docs/research/trials-overview.md`
- the tool-specific HTML report
- `docs/research/decision-log.md` when the product judgment changes
- `docs/ops/` for local commands, image digests, cleanup, and rollback

Do not convert an installation result into a quality claim.
