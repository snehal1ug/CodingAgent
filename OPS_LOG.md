# OPS_LOG.md — Real-Time Operational Log (§7.5)

> Every session (human or agent) appends here with REAL timestamps.
> This is the attribution ledger: who did what, when, at what cost,
> with what outcome. No silent sessions.

---

## LIVE MONITORING VIEW

| Last session | Agent/Role | Item | Outcome | Tokens | Time |
|---|---|---|---|---|---|
| (latest END entry below) | | | | | |

---

## ENTRY FORMATS

### Session start
```
[START] 2026-09-28T14:30:00+05:30 | agent: executor-1 | role: EXECUTOR
item: A-003 | branch: agent/executor-1/A-003 | budget: 40k tokens
```

### Session end
```
[END] 2026-09-28T15:10:00+05:30 | agent: executor-1 | item: A-003
outcome: DONE | tokens-used: 31k | tests: 12/12 pass
checkpoint: (state + first action next session)
```

### Incident (§7.4 honesty — report immediately)
```
[INCIDENT] 2026-09-28T15:12:00+05:30 | agent: executor-2 | type: build-break
what: merged branch broke main build (auth module) | impact: all agents stopped
action: reverted merge in 15:18, item returned to backlog
```

### Resource event (§7.6)
```
[RESOURCE] 2026-09-28T16:00:00+05:30 | type: disk-low
what: 900MB free before test run | action: cleaned build cache → 6.2GB free
```

---

## LOG (newest on top)

| Timestamp | Agent | Role | Event | Item | Outcome | Tokens |
|---|---|---|---|---|---|---|
| | | | | | | |

---

## TOKEN BUDGET SUMMARY (§7.6)

| Period | Total tokens | Sessions | Avg/session | Budget remaining |
|---|---|---|---|---|
| | | | | |

---

## INCIDENT REGISTER

| # | Time | Agent | Type | What happened | Resolution |
|---|---|---|---|---|---|
| | | | | | |
