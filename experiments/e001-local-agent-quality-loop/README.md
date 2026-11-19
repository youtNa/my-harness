# E001 Local Agent Quality Loop

## Status

Planned

## Hypothesis

An implementation agent followed by an independently initialized reviewer and deterministic checks will detect more real defects than implementation plus the existing test suite alone.

## Scope

- OpenHands local Docker execution
- Qodo PR-Agent or an equivalent self-hosted PR review path
- A disposable Git repository
- Three tasks with public and hidden checks

## Exclusions

- AWS Bedrock AgentCore
- Production repositories
- Production credentials
- Automatic deployment

## Success criteria

- Every run has a reproducible baseline.
- The reviewer sees the task and diff without the implementer's self-assessment.
- Hidden regression checks are executed outside the agent's control.
- The report distinguishes verified, unverified, and human-judgment items.

## Run record template

See `docs/research/ai-delivery-quality-harness.md` for the reporting convention. Store generated run data under `runs/`, which is ignored by Git.
