#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="${1:-project-governance-bootstrap}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
SOURCE="${REPO_ROOT}/skills/${SKILL_NAME}"

if [[ ! -d "${SOURCE}" ]]; then
  echo "Skill source not found: ${SOURCE}" >&2
  exit 1
fi

CODEX_HOME_DIR="${CODEX_HOME:-${HOME}/.codex}"
DEST_ROOT="${CODEX_HOME_DIR}/skills"
DEST="${DEST_ROOT}/${SKILL_NAME}"

mkdir -p "${DEST_ROOT}"
rm -rf "${DEST}"
cp -R "${SOURCE}" "${DEST}"

echo "Installed: ${SKILL_NAME}"
echo "From: ${SOURCE}"
echo "To:   ${DEST}"
