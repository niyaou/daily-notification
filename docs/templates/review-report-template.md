# 审核报告模板（固定字段与顺序）

## 1. Commit级记录
| record_id | commit_sha | scope | check_item | result | severity | evidence | risk_type | recommendation | blocking | open_questions |
|---|---|---|---|---|---|---|---|---|---|---|
| CR-001 | `<sha>` | code | bug_check | pass/fail/UNKNOWN | Low | `src/a.py` 关键变更说明 | bug/risk/security/stability/maintainability | 修复建议或 `N/A` | true/false | 无则填 `NONE` |

## 2. PR/MR汇总
- conclusion: Pass|PassWithConditions|Reject
- blocker_count: 0
- high_count: 0
- medium_count: 0
- low_count: 0
- doc_gap: true/false

## 3. 结论依据
- requirement_fit_status: pass/fail/UNKNOWN
- principle_conflict_status: pass/fail/UNKNOWN
- security_stability_status: pass/fail/UNKNOWN
- cross_impact_status: pass/fail/UNKNOWN
