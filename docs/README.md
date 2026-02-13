# 文档体系总览

## 1. 固定目录（严格模板模式）
1. `docs/requirements/requirements-spec.md`
2. `docs/features/features-catalog.md`
3. `docs/architecture/system-architecture.md`
4. `docs/architecture/module-diagram.md`
5. `docs/architecture/sequence-diagrams.md`
6. `docs/process/review-policy.md`
7. `docs/process/review-checklist.md`
8. `docs/process/commit-convention.md`
9. `docs/templates/pr-template.md`
10. `docs/templates/review-report-template.md`
11. `docs/templates/diff-doc-summarization-template.md`
12. `docs/architecture/adr/`
13. `docs/governance/`
14. `docs/operations/`

## 2. 不可变规则
1. 目录结构不可增删主目录。
2. 各文档章节顺序固定，不可重排。
3. 字段 key 固定，不可改名。
4. 审核输出格式固定，不可自由发挥。
5. 先 commit 级记录，再 PR/MR 汇总结论。

## 3. 关联文档
- 规则总文档：`docs/process/review-policy.md`
- 扫描与填充：`docs/process/scanning-and-filling-rules.md`
- 词表：`docs/process/glossary.md`

