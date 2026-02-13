# 发布流程

1. 验证审核结论。
   - 按 `docs/process/review-checklist.md` 执行固定顺序检查。
   - 四项强制检查（`bug_check/requirement_fit/principle_conflict/cross_impact`）必须有结论。
2. 确认 blocker 数量为 0。
   - 若存在 `requirement_fit=fail`、`principle_conflict=fail` 或安全/稳定性 blocker，禁止发布。
3. 确认必需文档已更新。
   - 触发规则命中时，确保 `requirements/features/architecture` 与必要 ADR 已更新。
   - `UNKNOWN` 项必须进入 `open_questions`。
4. 生成发布说明。
   - 汇总本次变更的需求/功能/模块影响面。
   - 明确回滚点、配置变更项、验证命令与结果。
