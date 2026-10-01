# SECURITY_AUDIT.md — Security Audit (Phase 1.5 Output)

> Every verdict must be proven by actual code (file + line). Status values:
> **SECURE** (evidence shown) · **VULNERABLE** (evidence + exploit path) ·
> **NOT APPLICABLE** (why) · **NOT VERIFIABLE** (what's needed).
> Never claim "secure" without code proof.

---

## 1. INJECTION

| Check | Status | Evidence (file:line) | Notes / exploit path | Severity |
|---|---|---|---|---|
| SQL/NoSQL injection — parameterized queries everywhere | | | | |
| Command injection — no shell string concat | | | | |
| Template/LDAP injection | | | | |
| Unsafe deserialization | | | | |

## 2. AUTHENTICATION

| Check | Status | Evidence | Notes | Severity |
|---|---|---|---|---|
| Password hashing: bcrypt/argon2/scrypt (NOT MD5/SHA1/plain) | | | | |
| Brute-force protection / lockout / rate limit on login | | | | |
| Credential reset flow security (token expiry, single-use) | | | | |
| Session fixation / session invalidation on logout & password change | | | | |
| Token storage & rotation (access/refresh) | | | | |
| MFA hooks present | | | | |

## 3. AUTHORIZATION / IDOR / BOLA

| Endpoint/Resource | User A can access User B's object? (tested) | Ownership check in code | Status | Severity |
|---|---|---|---|---|
| (list EVERY resource-mutating/access endpoint) | | | | |
| Admin/privilege escalation paths | | | | |

## 4. SENSITIVE DATA EXPOSURE

| Check | Status | Evidence | Notes | Severity |
|---|---|---|---|---|
| No PII/secrets in logs or error responses | | | | |
| Encryption at rest (DB, files, backups) | | | | |
| TLS enforced (no plain HTTP in prod paths) | | | | |
| No hardcoded secrets/keys — secrets via manager/env | | | | |
| No committed .env / key files (git history checked) | | | | |
| Production error responses sanitized (no stack traces) | | | | |

## 5. XSS / CSRF

| Check | Status | Evidence | Notes | Severity |
|---|---|---|---|---|
| Output encoding / safe templating everywhere | | | | |
| CSP header set | | | | |
| CSRF protection on state-changing routes | | | | |
| Cookie flags: HttpOnly / Secure / SameSite | | | | |

## 6. SSRF / REDIRECT / TRAVERSAL

| Check | Status | Evidence | Notes | Severity |
|---|---|---|---|---|
| URLs/fetch targets validated (allowlist) | | | | |
| Open redirects sanitized | | | | |
| Path traversal prevented on file operations | | | | |

## 7. SECURITY CONFIGURATION

| Check | Status | Evidence | Notes | Severity |
|---|---|---|---|---|
| Security headers (HSTS, X-Frame-Options, X-Content-Type-Options, etc.) | | | | |
| CORS not wildcard on credentialed routes | | | | |
| Debug/dev modes OFF in production config | | | | |
| Default credentials / sample users removed | | | | |
| Directory listing / exposed files (e.g., .git, backups) | | | | |

## 8. RATE LIMITING & ABUSE

| Check | Status | Evidence | Notes | Severity |
|---|---|---|---|---|
| Per-IP/user rate limiting on auth endpoints | | | | |
| Rate limiting on expensive/mutation endpoints | | | | |
| Pagination/result-size limits | | | | |

## 9. SUPPLY CHAIN & BUILD

| Check | Status | Evidence | Notes | Severity |
|---|---|---|---|---|
| Lockfile present, pinned versions | | | | |
| Known-vulnerable dependencies (audit run) | | | | |
| Unsigned/unmaintained critical packages | | | | |
| Container base images minimal/pinned (if containers) | | | | |
| CI secrets not exposed in logs/artifacts | | | | |

## 10. API SECURITY

| Check | Status | Evidence | Notes | Severity |
|---|---|---|---|---|
| No mass assignment (allowlisted fields only) | | | | |
| Responses expose no excess data | | | | |
| No unauthenticated internal routes | | | | |
| Auth enforced middleware-wide, not per-route by memory | | | | |

---

## SUMMARY

- Critical: __ · High: __ · Medium: __ · Low: __ · N/A: __ · Not verifiable: __
- Top 3 risks:

## FIX PLAN (merged into unified backlog)

| Finding ref | Fix | Priority | Proving regression test |
|---|---|---|---|
| S-001 | | P0/P1 | |
