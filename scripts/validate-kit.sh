#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

required=(
  AGENTS.md Intent.md PROGRESS.md PROJECT_MAP.md AUDIT_REPORT.md
  SECURITY_AUDIT.md DECISIONS.md OPS_LOG.md EXTENSIONS.md
  COMPLETION_REPORT.md README.md
)

for file in "${required[@]}"; do
  [[ -s "$file" ]] || { echo "ERROR: missing or empty $file" >&2; exit 1; }
done

declare -A headings=(
  [AGENTS.md]="# AGENTS.md"
  [Intent.md]="# INTENT.md"
  [PROGRESS.md]="# PROGRESS.md"
  [PROJECT_MAP.md]="# PROJECT_MAP.md"
  [AUDIT_REPORT.md]="# AUDIT_REPORT.md"
  [SECURITY_AUDIT.md]="# SECURITY_AUDIT.md"
  [DECISIONS.md]="# DECISIONS.md"
  [OPS_LOG.md]="# OPS_LOG.md"
  [EXTENSIONS.md]="# EXTENSIONS.md"
  [COMPLETION_REPORT.md]="# COMPLETION_REPORT.md"
  [README.md]="# CodingAgent"
)

for file in "${!headings[@]}"; do
  grep -Fq "${headings[$file]}" "$file" || {
    echo "ERROR: $file does not contain the required top-level heading prefix '${headings[$file]}'" >&2
    exit 1
  }
done

# Check every committed file for whitespace errors, including the root commit.
git diff-tree --check --root HEAD

# Detect common accidental credential material. Documentation may describe secrets,
# but it must not contain credential-shaped values.
if grep -RInE \
  --exclude-dir=.git \
  --exclude='validate-kit.sh' \
  '(BEGIN (RSA|OPENSSH|EC|DSA) PRIVATE KEY|gh[pousr]_[A-Za-z0-9_]{20,}|AKIA[0-9A-Z]{16}|sk-[A-Za-z0-9]{20,})' \
  .; then
  echo "ERROR: credential-shaped material found" >&2
  exit 1
fi

echo "CodingAgent kit validation passed (${#required[@]} required files)."
