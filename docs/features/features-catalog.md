# 功能目录（固定模板）

## 1. 功能总览
| 功能ID(feature_id) | 需求ID(requirement_id) | 功能名称(feature_name) | 模块(module) | 状态(status) | 负责人(owner) |
|---|---|---|---|---|---|
| FEAT-001 | REQ-001 | 多入口分析触发 | main/api | done | UNKNOWN |
| FEAT-002 | REQ-002 | 分析历史与新闻落库查询 | storage/api/services | done | UNKNOWN |
| FEAT-003 | REQ-003 | 多渠道通知与机器人集成 | notification/bot | done | UNKNOWN |
| FEAT-004 | REQ-004 | 系统配置管理与热更新入口 | config/system_config | in-progress | UNKNOWN |
| FEAT-005 | REQ-005 | 历史回测与统计汇总 | services/backtest | done | UNKNOWN |

## 2. 功能明细模板（固定字段）
### FEAT-001
- 目标（objective）: 统一 CLI、API、定时任务三种触发入口，保证分析流程复用。
- 关联需求（linked_requirements）: REQ-001
- 影响模块（impacted_modules）: `main.py`, `src/core/pipeline.py`, `api/v1/endpoints/analysis.py`, `src/scheduler.py`
- 入口点（entry_points）: `main.py` 命令行参数、`/api/v1/analysis/*` 接口、定时调度器回调
- 风险说明（risk_notes）: 入口并发触发时可能导致资源竞争，需要依赖任务队列/限流配置。
- 测试状态（test_status）: 有相关测试，建议补充并发与重入场景。

### FEAT-002
- 目标（objective）: 保存分析与新闻证据，支持按股票/时间/query_id 查询。
- 关联需求（linked_requirements）: REQ-002
- 影响模块（impacted_modules）: `src/storage.py`, `src/services/history_service.py`, `api/v1/endpoints/history.py`
- 入口点（entry_points）: 分析完成写入、历史 API 查询接口
- 风险说明（risk_notes）: SQLite 在高并发场景下可能出现写入瓶颈。
- 测试状态（test_status）: 有历史与存储相关测试，需继续覆盖异常路径。

### FEAT-003
- 目标（objective）: 将分析结果发送到企业微信/飞书/Telegram/钉钉等渠道。
- 关联需求（linked_requirements）: REQ-003
- 影响模块（impacted_modules）: `src/notification.py`, `bot/`, `bot/platforms/`
- 入口点（entry_points）: 分析任务完成后的通知发送、Bot 指令入口
- 风险说明（risk_notes）: 外部渠道 API 不稳定或限流会影响送达率。
- 测试状态（test_status）: 以集成验证为主，自动化测试覆盖有限。

### FEAT-004
- 目标（objective）: 管理系统配置并提供 API 层读写能力。
- 关联需求（linked_requirements）: REQ-004
- 影响模块（impacted_modules）: `src/config.py`, `src/services/system_config_service.py`, `api/v1/endpoints/system_config.py`
- 入口点（entry_points）: 环境变量加载、系统配置接口
- 风险说明（risk_notes）: 错误配置会直接影响调度、数据源和通知行为。
- 测试状态（test_status）: 有系统配置 API/Service 测试。

### FEAT-005
- 目标（objective）: 回测历史分析建议并输出准确率、收益等指标。
- 关联需求（linked_requirements）: REQ-005
- 影响模块（impacted_modules）: `src/services/backtest_service.py`, `src/core/backtest_engine.py`, `src/storage.py`
- 入口点（entry_points）: `main.py --backtest`、自动回测配置开关
- 风险说明（risk_notes）: 回测窗口与样本质量会显著影响指标解释性。
- 测试状态（test_status）: 已有回测相关单测，需持续对齐策略变更。

## 3. 变更记录
| 日期(date) | 功能ID(feature_id) | 变更(change) | 证据(evidence) |
|---|---|---|---|
| 2026-02-13 | FEAT-001~FEAT-005 | 按合并后代码补齐功能目录与明细。 | `main.py`, `api/v1/endpoints/`, `src/services/`, `src/storage.py`, `bot/` |
