---
name: project-governance-bootstrap
description: Use when creating a strict, cross-project governance baseline with fixed documentation structure, deterministic MR/PR review rules, code-diff scanning/filling standards, and reusable templates for requirements, features, architecture, module diagram, and sequence diagram.
---

# Project Governance Bootstrap (Strict Template Mode)

## Core Contract
1. Keep directory and section order fixed.
2. Keep keys and enum values fixed.
3. Scan in fixed input priority.
4. Fill only with evidence.
5. Write UNKNOWN when evidence is missing.

## Setup Steps
1. Run `scripts/bootstrap_docs.py --target <repo-root>`.
2. Run `scripts/validate_strict_mode.py --target <repo-root>`.
3. If validation fails, fix files until all checks pass.

## Fixed Scan Engine
Use `references/scanning-and-filling-rules.md` as the single source of truth for:
- input priority,
- file categorization,
- doc trigger rules,
- DocDelta schema,
- review output field order.

## Review Execution
1. Read PR/MR metadata.
2. Read commits in chronological order.
3. Read file list and diffs.
4. Map each commit to requirement/feature/module.
5. Run 4 checks: `bug_check`, `requirement_fit`, `principle_conflict`, `cross_impact`.
6. Detect `doc_gap=true` and produce DocDelta first.
7. Output commit-level records first, then PR/MR summary.

## Blocking Rules
- `requirement_fit=fail` -> blocking
- `principle_conflict=fail` -> blocking
- security/stability severe issue -> blocking

## Platform Mapping
- GitHub: PR + Actions
- GitLab: MR + CI
See `references/platform-mapping.md`.

