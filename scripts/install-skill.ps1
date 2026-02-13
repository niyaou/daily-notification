param(
  [string]$SkillName = "project-governance-bootstrap"
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$source = Join-Path $repoRoot "skills\$SkillName"

if (-not (Test-Path $source)) {
  throw "Skill source not found: $source"
}

$codexHome = $env:CODEX_HOME
if ([string]::IsNullOrWhiteSpace($codexHome)) {
  $codexHome = Join-Path $env:USERPROFILE ".codex"
}

$destRoot = Join-Path $codexHome "skills"
$dest = Join-Path $destRoot $SkillName

New-Item -ItemType Directory -Path $destRoot -Force | Out-Null

if (Test-Path $dest) {
  Remove-Item -Recurse -Force $dest
}

Copy-Item -Recurse -Force $source $dest

Write-Host "Installed: $SkillName"
Write-Host "From: $source"
Write-Host "To:   $dest"
