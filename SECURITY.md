# Security Policy

## Scope

This repository contains the CodingAgent autonomous hardening and delivery kit: Markdown protocol/state templates, a shell validator, and a GitHub Actions workflow. It does not contain an application runtime, hosted service, database, authentication system, or user-data processing path.

Please report vulnerabilities in the repository contents, validator, workflow, or documented agent protocol. For vulnerabilities in a project that consumes this kit, report them to that project’s maintainers instead.

## Supported versions

| Version | Security support |
|---|---|
| 6.1.x | Supported |
| Older versions | Best effort only; upgrade to 6.1.x first |

## Reporting a vulnerability

Please **do not open a public issue** for an undisclosed security vulnerability.

Use GitHub’s private vulnerability reporting or Security Advisories feature for this repository when it is available. If private reporting is not enabled, contact the repository owner through the GitHub profile before disclosing details publicly. Include the affected file and line, a concise impact description, reproduction steps that do not expose real credentials, and any suggested remediation.

Never include API keys, passwords, private keys, tokens, `.env` contents, or other live credentials in a report. Redact them and revoke or rotate any credential that may have been exposed.

## Response targets

Maintainers should aim to acknowledge a report within **5 business days**, provide an initial triage decision within **10 business days**, and communicate material status changes until resolution. These are targets, not a guarantee of service availability.

Reports may be rated by exploitability and impact. A fix may be released as a patch update, accompanied by a changelog or release note when the issue affects users of the kit.

## Disclosure

Please allow maintainers reasonable time to validate and remediate a report before public disclosure. Coordinate any public disclosure date with the maintainers, and avoid publishing exploit details while a live credential or exploitable workflow remains active.

## Security baseline

The repository’s baseline controls include:

- Secret-pattern scanning of the current tree and Git history.
- GitHub Actions validation on pushes and pull requests.
- Immutable commit-SHA pinning for third-party Actions.
- Protected `main` branch rules requiring review and the validation check.

These controls do not replace GitHub Secret Scanning and Push Protection, dependency review, application-specific SAST, or a consuming project’s threat model.
