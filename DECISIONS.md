# DECISIONS.md — Autonomous Decision Log

> The agent records EVERY judgment call made without human input.
> Format: dated entry, context, options considered, choice, rationale,
> reversibility.

---

| # | Date | Context | Decision | Options considered | Rationale | Reversible? |
|---|---|---|---|---|---|---|
| D-001 | | | | | | |

---

## ENTRY TEMPLATE (copy per decision)

```
### D-00X: <short title>
- **Date:** YYYY-MM-DD
- **Phase:** PHASE-n
- **Context:** (what situation forced a decision)
- **Options considered:** (list)
- **Chosen:** (what was done)
- **Rationale:** (why — prefer: standard, reversible, stack-native, minimal)
- **Reversible?** yes/no + how
- **Consequences:** (anything the next cycle must know)
```

---

## INTEGRITY EVENTS (§6 violations — must be rare)

| # | Date | Type (hallucination/stall/scope-creep/integrity-fail) | What happened | Correction |
|---|---|---|---|---|
| | | | | |

---

## STANDING CONVENTIONS (accumulated from decisions)

- (e.g., "All HTTP calls default to 5s timeout + 3 retries w/ jitter — per D-004")
