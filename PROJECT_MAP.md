# PROJECT_MAP.md — System Map (Phase 0 Output)

> Read-only reconnaissance. Every claim here must trace to an actual
> file/config in the repo. No assumptions.

---

## 1. Identity

| Field | Value |
|---|---|
| Project name | |
| Primary purpose | |
| Current stage | (greenfield / mid-development / complete / in-production) |
| Repository root structure | |

---

## 2. Tech Stack

| Layer | Technology | Version | Evidence (file) |
|---|---|---|---|
| Language(s) | | | |
| Framework(s) | | | |
| Runtime | | | |
| Database(s) | | | |
| Cache / Queue | | | |
| Storage | | | |
| Auth mechanism | | | |
| Package manager | | | |
| Build tool | | | |
| Test framework(s) | | | |
| CI/CD | | | (or "NONE FOUND") |

---

## 3. Module / Service Map

| Module/Service | Responsibility | Entry points | External dependencies | Key files |
|---|---|---|---|---|
| | | | | |

---

## 4. Data Flow

- **API surface:** (routes/endpoints, internal vs external)
- **Data flow:** (request path, write path, async/background paths)
- **State stores:** (DB schemas/tables, caches, queues, file storage — where defined)

---

## 5. Integrations & External Services

| Service | Used for | Where referenced | Failure handling found (yes/no + evidence) |
|---|---|---|---|
| | | | |

---

## 6. Deployment & Configuration

- Environments: (dev / staging / prod configs — where defined)
- Secrets handling: (how env vars/secrets are managed — evidence)
- Deploy mechanism: (or "NONE FOUND")
- Health checks / probes: (or "NONE FOUND")
- Logging/observability setup: (or "NONE FOUND")

---

## 7. Error-Handling Inventory

| Concern | Mechanism found | Evidence (file) |
|---|---|---|
| Timeouts | | (or NONE) |
| Retries | | (or NONE) |
| Validation (input) | | (or NONE) |
| Validation (external responses) | | (or NONE) |
| Transactions/rollback | | (or NONE) |
| Idempotency/dedup | | (or NONE) |
| Fallbacks/degradation | | (or NONE) |
| Circuit breaking | | (or NONE) |
| Central error handler | | (or NONE) |

---

## 8. Stage Assessment (Phase 0.5)

| Field | Value |
|---|---|
| Detected stage | (greenfield / ~X% complete / feature-complete / in-production) |
| Intended end-state (source of truth) | (README / spec / issues / human input — cite it) |
| Human input needed? | (yes/no — if yes, ASK before proceeding) |
| Extensions activated (EXTENSIONS.md) | (list ON toggles + reasons; AGENT_DEFENSE always on) |

## 9. Completion Backlog (Phase 0.5)

| # | Missing/incomplete feature | What exists vs. missing | Acceptance criteria ("done" =) | Depends on | Priority |
|---|---|---|---|---|---|
| C-001 | | | | | P? |

## 10. Open Questions / Unknowns

- (anything that could not be determined from the code — be explicit)
