param(
  [string]$Root = "."
)

$requiredFiles = @(
  'docs/requirements/requirements-spec.md',
  'docs/features/features-catalog.md',
  'docs/architecture/system-architecture.md',
  'docs/architecture/module-diagram.md',
  'docs/architecture/sequence-diagrams.md',
  'docs/process/review-policy.md',
  'docs/process/review-checklist.md',
  'docs/process/commit-convention.md',
  'docs/templates/pr-template.md',
  'docs/templates/review-report-template.md',
  'docs/templates/diff-doc-summarization-template.md',
  'skills/project-governance-bootstrap/SKILL.md',
  'skills/project-governance-bootstrap/agents/openai.yaml',
  'skills/project-governance-bootstrap/references/scanning-and-filling-rules.md'
)

$missing = @()
foreach ($file in $requiredFiles) {
  if (-not (Test-Path (Join-Path $Root $file))) {
    $missing += $file
  }
}

if ($missing.Count -gt 0) {
  Write-Host "Missing required files:" -ForegroundColor Red
  $missing | ForEach-Object { Write-Host " - $_" -ForegroundColor Red }
  exit 1
}

$reviewPolicy = Get-Content -Raw (Join-Path $Root 'docs/process/review-policy.md')
$mustContain = @(
  'bug_check',
  'requirement_fit',
  'principle_conflict',
  'cross_impact',
  'UNKNOWN',
  'DocDelta',
  'PassWithConditions'
)

$failed = @()
foreach ($token in $mustContain) {
  if ($reviewPolicy -notmatch [regex]::Escape($token)) {
    $failed += "docs/process/review-policy.md missing token: $token"
  }
}

if ($failed.Count -gt 0) {
  $failed | ForEach-Object { Write-Host $_ -ForegroundColor Red }
  exit 1
}

Write-Host 'Strict template baseline check passed.' -ForegroundColor Green
