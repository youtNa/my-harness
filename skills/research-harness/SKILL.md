---
name: research-harness
description: Run reproducible research trials for AI software-engineering agents and turn observed behavior into concise Chinese HTML reports and reusable project knowledge.
---

# Research Harness

Use this skill when evaluating an AI coding agent, multi-agent workflow, verification product, or Harness methodology.

For the shared Research contract and the full documentation-to-installation-to-evidence workflow, read `../component-research/SKILL.md` and `../component-research/references/evaluation-contract.md`.

This skill adds the software-engineering profile below.

## Software-engineering trial profile

Use a disposable repository task that has:

- a failing baseline test
- a plain-language requirement
- one hidden or separately executed regression check
- a bounded iteration budget
- a hidden or separately executed regression check
- a diff or Pull Request that another reviewer can inspect

## Report shape

Use `references/report-template.html` as the starting point. Keep the report concise. Prefer a status card, a simple flow diagram, and a small evidence table over long prose. Include implementation-agent and independent-reviewer results separately.

## Knowledge capture

After each trial, update:

- `docs/research/trials-overview.md`
- the tool-specific HTML report
- `docs/research/decision-log.md` when the product judgment changes
- `docs/ops/` for local commands, image digests, cleanup, and rollback

Do not convert an installation result into a quality claim. Do not treat an Agent's self-report as independent verification.
