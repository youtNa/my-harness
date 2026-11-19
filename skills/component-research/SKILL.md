---
name: component-research
description: Research and trial an AI software component from public documentation through installation, core workflow execution, evidence capture, screenshots, and a concise Chinese HTML report.
---

# Component Research

Use this skill when evaluating an agent, coding tool, runtime, Harness, plugin, SDK, or other software component.

Read [evaluation-contract.md](references/evaluation-contract.md) before running a trial. It is the shared minimum contract for all Research work in this repository.

## Required outcome

Create a Chinese HTML report that answers:

1. What the component is for.
2. What its official documentation says it can do.
3. How it is installed and configured.
4. What the primary user workflow is.
5. Whether that workflow ran successfully in a disposable environment.
6. What evidence demonstrates the result.
7. What the component contributes to the project and what remains unproven.

## Workflow

### 1. Official-source discovery

- Start with the official product page, installation guide, API or CLI reference, examples, and repository.
- Record the page URL, access date, version, runtime requirements, license, supported platforms, and known prerequisites.
- Summarize the architecture and core capability in a short evidence table.
- Do not use search snippets as the only evidence for a capability claim.

### 2. Trial design

- Choose the smallest workflow that exercises the component's main value.
- If the project context is missing, create a disposable task that resembles a real user request.
- Define a baseline, a success condition, an independent check, and a cleanup action before running the component.
- Keep credentials and unrelated host directories outside the trial workspace.

### 3. Installation and deployment

- Prefer Docker or a disposable worktree.
- Pin an image tag, package version, commit, or digest.
- Record the exact install and launch commands.
- Confirm the service, CLI, or API is ready before claiming installation success.

### 4. Core workflow execution

- Run the documented primary workflow end to end.
- Capture the input task, relevant logs, changed files, command output, and final status.
- Run deterministic tests outside the agent's self-report.
- If the workflow stops, record the first reproducible blocker and do not call the trial successful.

### 5. Screenshot evidence

- Capture screenshots of the real UI, terminal, report, or observable output when a visual surface exists.
- Use screenshots to show the workflow state, not decorative title cards.
- Store screenshots under `artifacts/<trial-id>/screenshots/` and reference them from the HTML report with relative paths.
- If the component has no visual surface, include a terminal or API evidence panel instead.

### 6. HTML report

Use a concise report with:

- status cards for 已验证、未验证、阻塞
- a workflow diagram
- official-source summary
- environment and version table
- primary workflow evidence
- screenshots or terminal evidence
- independent verification result
- core value and limitations
- cleanup and reproduction commands

### 7. Knowledge capture

Update the project research index, decision log, trial report, and local operations record. Extract reusable setup facts and failure fixes into this Skill or its references only when they generalize beyond one component.

## Acceptance criteria

- Official documentation was read before installation.
- The main workflow ran or has a recorded first blocker.
- The report distinguishes installation success from feature success.
- At least one result is independently checked.
- Screenshots or equivalent executable evidence are attached.
- The environment can be cleaned without touching unrelated host state.
