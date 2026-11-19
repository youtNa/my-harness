# Project Agent Guide

## Purpose

This repository investigates and prototypes quality harnesses for AI-assisted software delivery. The primary question is whether independent, reproducible verification can make AI-generated changes safer to merge.

## Working principles

- Prefer evidence over model claims.
- Keep implementation, verification, and reporting contexts separate when possible.
- Run experiments in Docker or disposable worktrees.
- Never use production credentials or production repositories for experiments.
- Record versions, commands, inputs, outputs, failures, and cleanup steps.
- Make every local change reversible.
- Do not add secrets to the repository. Use `.env` files outside Git or ignored local files.

## Repository layout

- `docs/research/` contains research reports, trial notes, papers, and decision records.
- `experiments/` contains reproducible experiment definitions and scripts.
- `artifacts/` contains generated reports that are safe to commit and contain no secrets.
- `infra/` contains Docker and local-only setup files.

## Experiment protocol

1. Pin the tool version or commit.
2. Use a disposable repository or a fork.
3. Capture the baseline test result before an agent changes code.
4. Run the agent in a container or isolated worktree.
5. Store the diff, test output, review output, and final verdict.
6. Record failures without editing them away.
7. Remove containers, volumes, temporary credentials, and worktrees after the run.

## Reporting standard

Every experiment report should include:

- Objective and hypothesis
- Environment and versions
- Input repository and task
- Exact commands or configuration
- Observed agent behavior
- Deterministic checks and their output
- Human judgment items
- Failure modes
- Cost and elapsed time when available
- Reproduction and cleanup steps
- Decision impact

## Safety boundary

Agent tools must be restricted to the disposable workspace. Do not grant access to SSH keys, cloud credentials, browser profiles, password stores, or unrelated host directories.
