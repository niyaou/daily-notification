# Review Policy（严格模板模式）

## 1. 审核范围
- 强制单位：PR/MR。
- 强制粒度：每个 commit 逐条审核。

## 2. 固定扫描输入优先级
1. PR/MR 元信息（标题、描述、关联 issue）
2. commit 列表（按时间顺序）
3. diff 文件清单
4. 代码改动内容
5. 现有文档（需求/features/架构/约束）

## 3. 固定扫描步骤
1. 变更分类：`requirement/feature/module/code/architecture/test/docs`
2. 影响归因：每个 commit 映射 requirement_id/feature_id/module_id
3. 风险检测：bug、需求偏差、原则冲突、跨功能影响
4. 文档缺失判定：触发更新但未更新，标记 `doc_gap=true`
5. 自动补文档：按 `DocDelta` 固定模板生成草案
6. 输出记录：固定字段、固定顺序

## 4. 强制检查项（固定四项）
1. `bug_check`: pass/fail/UNKNOWN
2. `requirement_fit`: pass/fail/UNKNOWN
3. `principle_conflict`: pass/fail/UNKNOWN
4. `cross_impact`: pass/fail/UNKNOWN

## 5. 填充规则
1. 仅基于证据填充（文件路径/commit/diff）。
2. 无证据时填 `UNKNOWN` 并写入 `open_questions`。
3. 一字段一来源，不混写。
4. 固定枚举：
   - `Severity = Blocker|High|Medium|Low`
   - `Conclusion = Pass|PassWithConditions|Reject`

## 6. 阻断规则
- `requirement_fit=fail` -> blocking=true
- `principle_conflict=fail` -> blocking=true
- 安全或生产稳定性问题 -> blocking=true

## 7. 输出顺序（固定）
1. Commit级记录
2. PR/MR汇总

## 8. 输出字段（固定）
| field | definition |
|---|---|
| record_id | 唯一ID |
| scope | requirement/feature/module/code/architecture |
| commit_sha | commit哈希 |
| check_item | bug_check/requirement_fit/principle_conflict/cross_impact |
| result | pass/fail/UNKNOWN |
| severity | Blocker/High/Medium/Low |
| evidence | 文件+diff片段说明 |
| risk_type | bug/risk/security/stability/maintainability |
| recommendation | 修复建议 |
| blocking | true/false |
| open_questions | 待澄清项 |

## 9. 关联文件
- `docs/process/review-checklist.md`
- `docs/process/scanning-and-filling-rules.md`
- `docs/templates/review-report-template.md`
- `docs/templates/diff-doc-summarization-template.md`

