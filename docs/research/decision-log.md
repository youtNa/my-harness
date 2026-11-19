# Decision Log

## 2026-11-19

### Decision

Use a local-first experiment path for personal validation. Exclude Amazon Bedrock AgentCore from the first trial because it requires AWS account credentials and cloud resources.

### Evidence

- OpenHands can run locally with Docker Sandbox.
- SWE-agent supports local installation with Docker as its default backend.
- Qodo's open-source PR-Agent can run through GitHub Actions or self-hosted workflows.
- AgentCore is better suited to enterprise runtime evaluation.

### Product implication

The first product experiment should test the quality-control loop rather than the cloud runtime:

```text
Issue → implementation agent → independent review → sandbox checks → evidence report
```

### Next experiment

Run the same three tasks through OpenHands and Qodo PR-Agent, using hidden regression tests and an evidence-based scorecard.
