#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

required=(
  AGENTS.md Intent.md PROGRESS.md PROJECT_MAP.md AUDIT_REPORT.md
  SECURITY_AUDIT.md SECURITY.md DECISIONS.md OPS_LOG.md EXTENSIONS.md
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
  [SECURITY.md]="# Security Policy"
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

# Require every third-party GitHub Action to use a full 40-character commit SHA.
# This prevents a mutable tag or branch from changing the code executed by CI.
while IFS= read -r action_line; do
  action_ref="${action_line##*@}"
  action_ref="${action_ref%%[[:space:]]*}"
  if [[ ! "$action_ref" =~ ^[0-9a-fA-F]{40}$ ]]; then
    echo "ERROR: mutable or invalid GitHub Action reference: $action_line" >&2
    exit 1
  fi
done < <(grep -hE '^[[:space:]]*uses:[[:space:]]+[^[:space:]]+@[^[:space:]]+' .github/workflows/*.yml .github/workflows/*.yaml 2>/dev/null || true)

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
