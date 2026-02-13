# Install `project-governance-bootstrap`

This repository contains one reusable Codex skill:

- `project-governance-bootstrap`

The installer copies it to:

- `$CODEX_HOME/skills/project-governance-bootstrap` (preferred)
- Fallback if `CODEX_HOME` is not set:
  - Windows: `%USERPROFILE%\.codex\skills\project-governance-bootstrap`
  - macOS/Linux: `~/.codex/skills/project-governance-bootstrap`

## Prerequisite

Run commands from this repository root.

## One-click install commands

### Windows (PowerShell)

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-skill.ps1
```

### macOS

```bash
bash ./scripts/install-skill.sh
```

### Linux

```bash
bash ./scripts/install-skill.sh
```

## Verify installation

Check the destination directory exists:

- Windows:

```powershell
Get-ChildItem "$env:CODEX_HOME\skills\project-governance-bootstrap" -Force
```

- macOS/Linux:

```bash
ls -la "${CODEX_HOME:-$HOME/.codex}/skills/project-governance-bootstrap"
```

## Update skill later

Re-run the same install command. Existing files are replaced.
