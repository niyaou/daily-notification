# 操作手册

1. 故障识别。
   - 检查进程与入口模式：`main.py`（CLI/定时/API）是否按预期启动。
   - 检查日志目录与最近错误栈：重点关注 `src/core/pipeline.py`、`src/storage.py`、`src/notification.py` 相关报错。
2. 影响评估。
   - 确认影响范围：单股票失败、单渠道通知失败、全量任务失败。
   - 判断数据一致性：是否已写入 `analysis_history`、`news_intel`、`backtest_*` 表。
3. 回滚策略。
   - 配置回滚：恢复最近可用 `.env` 与系统配置项。
   - 部署回滚：回退到上一个可运行版本，优先恢复“可分析+可通知”最小能力。
4. 证据留存。
   - 保存错误日志、触发参数、失败时间窗、受影响股票列表。
   - 对外部依赖故障保留接口响应证据（状态码/错误信息）。
5. 复盘链接。
   - 在 `docs/governance/risk-register.md` 增补风险项或更新状态。
   - 如涉及架构约束变更，补充 ADR（`docs/architecture/adr/`）。
