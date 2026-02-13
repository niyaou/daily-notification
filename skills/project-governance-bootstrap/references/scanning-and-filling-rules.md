# Scanning and Filling Rules (Strict Template)

## 1. Input Priority
1. PR/MR metadata
2. Commit list (chronological)
3. Diff file list
4. Code diff content
5. Existing docs and constraints

## 2. File Categorization
| category | matching rule |
|---|---|
| requirement | path starts with `docs/requirements/` |
| feature | path starts with `docs/features/` |
| module | equals `docs/architecture/module-diagram.md` |
| architecture | `docs/architecture/system-architecture.md` or `docs/architecture/adr/` |
| test | contains `test`, `tests`, or `spec` |
| docs | path starts with `docs/` |
| code | fallback category |

## 3. Trigger Rules
1. Business behavior change => requirements/features update required.
2. Module boundary/dependency change => module diagram update required.
3. Workflow interaction change => sequence diagram update required.
4. Architecture boundary/constraint change => system architecture and ADR update required.

## 4. Fixed Checks
- bug_check
- requirement_fit
- principle_conflict
- cross_impact

## 5. Fixed Enums
- Severity: `Blocker|High|Medium|Low`
- Conclusion: `Pass|PassWithConditions|Reject`

## 6. UNKNOWN Rule
No evidence => write `UNKNOWN` and append to `open_questions`.

## 7. Output Order
1. Commit-level records
2. PR/MR summary

