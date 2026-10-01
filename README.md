# CodingAgent — Autonomous Hardening & Delivery Kit

This repository contains a stack-agnostic operating kit for an autonomous coding-agent loop. It is designed to be copied into a project root and used to drive work through reconnaissance, failure and security audits, an approval gate, implementation, verification, and delivery.

**Kit version:** 6.1
**Current repository contents:** protocol and state templates; no application runtime is included.

## Start here

1. Read [`AGENTS.md`](AGENTS.md), then read [`Intent.md`](Intent.md) in full.
2. Read [`PROGRESS.md`](PROGRESS.md) and append a session `START` event to [`OPS_LOG.md`](OPS_LOG.md).
3. Complete Phases 0–1.5 in order: map the project, assess completion, run the failure audit, and run the security audit.
4. Stop at the Phase 2 approval gate until the human explicitly approves the unified plan.
5. After approval, implement one backlog item at a time with tests, verification, a conventional commit, and state updates.
6. Finish only when the termination criteria in `Intent.md` are satisfied and the work is committed and pushed.

## Files

| File | Purpose |
|---|---|
| `AGENTS.md` | Entry point and session rules |
| `Intent.md` | Full autonomous loop, phase gates, safety, integrity, and multi-agent protocol |
| `PROJECT_MAP.md` | Read-only reconnaissance and completion backlog |
| `AUDIT_REPORT.md` | Failure-simulation findings and recommendations |
| `SECURITY_AUDIT.md` | Security checklist and evidence-backed findings |
| `SECURITY.md` | Vulnerability reporting policy and supported versions |
| `PROGRESS.md` | Canonical backlog and phase state |
| `DECISIONS.md` | Reversible autonomous decisions and integrity events |
| `OPS_LOG.md` | Append-only session attribution and operational events |
| `EXTENSIONS.md` | Optional project-type modules and agent self-defense rules |
| `COMPLETION_REPORT.md` | Final verification and delivery report |

## Multi-agent state ownership

- The **orchestrator** owns canonical state files: `PROJECT_MAP.md`, `AUDIT_REPORT.md`, `SECURITY_AUDIT.md`, `PROGRESS.md`, `DECISIONS.md`, `EXTENSIONS.md`, and `COMPLETION_REPORT.md`.
- Executors record `START`, `END`, incidents, and resource events in `OPS_LOG.md` on their branch. An `END` entry must include the checkpoint and first action for the next session.
- The orchestrator serializes those entries and consolidates the canonical `PROGRESS.md` checkpoint. Executors do not edit canonical state files directly.
- Phase 0 is read-only for project code, configuration, and behavior. The only allowed exception is the append-only operational `START` entry in `OPS_LOG.md`; no findings or project changes may be made until the reconnaissance phase is complete.

## Validation

Run the local checks from the repository root:

```bash
bash scripts/validate-kit.sh
```

The GitHub Actions workflow runs the same checks on pushes and pull requests. The checks validate required files and headings, committed-file whitespace, and common accidental secret patterns. Template placeholders in the state documents are intentional and are not treated as completed findings.

## Scope and limitations

This kit does not replace application-specific tests, dependency audits, threat modeling, deployment checks, or human approval. A blank audit template is **not** evidence that a project is secure or complete. Every claim must be filled with evidence from the consuming project.
