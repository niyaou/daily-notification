#!/usr/bin/env python3
import argparse
import os
import shutil
from pathlib import Path


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--target", required=True)
    args = parser.parse_args()

    skill_dir = Path(__file__).resolve().parents[1]
    src = skill_dir / "assets" / "templates" / "docs"
    dst = Path(args.target) / "docs"

    if not src.exists():
        raise SystemExit(f"Template source not found: {src}")

    dst.mkdir(parents=True, exist_ok=True)

    for root, _, files in os.walk(src):
        rel = Path(root).relative_to(src)
        out_dir = dst / rel
        out_dir.mkdir(parents=True, exist_ok=True)
        for name in files:
            s = Path(root) / name
            d = out_dir / name
            if not d.exists():
                shutil.copy2(s, d)

    print("Bootstrap completed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

