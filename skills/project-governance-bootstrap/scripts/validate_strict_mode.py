#!/usr/bin/env python3
import argparse
from pathlib import Path

REQUIRED = [
    "docs/requirements/requirements-spec.md",
    "docs/features/features-catalog.md",
    "docs/architecture/system-architecture.md",
    "docs/architecture/module-diagram.md",
    "docs/architecture/sequence-diagrams.md",
    "docs/process/review-policy.md",
    "docs/process/review-checklist.md",
    "docs/process/commit-convention.md",
    "docs/templates/pr-template.md",
    "docs/templates/review-report-template.md",
    "docs/templates/diff-doc-summarization-template.md",
]


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--target", required=True)
    args = parser.parse_args()

    root = Path(args.target)
    missing = [p for p in REQUIRED if not (root / p).exists()]
    if missing:
        print("Missing required files:")
        for p in missing:
            print(f" - {p}")
        return 1

    review = (root / "docs/process/review-policy.md").read_text(encoding="utf-8")
    tokens = [
        "bug_check",
        "requirement_fit",
        "principle_conflict",
        "cross_impact",
        "UNKNOWN",
        "DocDelta",
        "PassWithConditions",
    ]
    missing_tokens = [t for t in tokens if t not in review]
    if missing_tokens:
        print("Missing policy tokens:")
        for t in missing_tokens:
            print(f" - {t}")
        return 1

    print("Strict template validation passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

