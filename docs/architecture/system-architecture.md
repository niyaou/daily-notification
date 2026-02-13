# 系统架构（固定模板）

## 1. 系统上下文
- 系统边界（system_boundary）: 本系统负责股票数据采集、分析、回测、历史存储与多渠道通知；不负责交易执行。
- 外部依赖（external_dependencies）: 大模型接口（Gemini/OpenAI 兼容）、行情数据源（AkShare/Tushare/yfinance 等）、消息平台（企业微信/飞书/Telegram/钉钉）、可选 Web 前端构建产物。
- 信任边界（trust_boundary）: 本地运行环境与数据库在内部边界；外部 API/消息平台位于不可信边界，需要超时、重试与鉴权配置。

## 2. 组件与职责（固定字段）
| 模块ID(module_id) | 模块名称(module_name) | 职责(responsibility) | 上游(upstream) | 下游(downstream) | 约束(constraints) |
|---|---|---|---|---|---|
| MOD-001 | Entry Layer | 提供 CLI 与进程启动编排（参数解析、模式切换）。 | User/Cron | MOD-002, MOD-003 | 入口不直接操作底层存储。
| MOD-002 | API Layer | 暴露 FastAPI 接口与路由聚合。 | Client/Web | MOD-003 | API 错误处理与 CORS 策略统一。
| MOD-003 | Service Layer | 编排业务逻辑（分析、历史、回测、配置、任务）。 | MOD-001, MOD-002 | MOD-004, MOD-005 | 业务逻辑集中，避免重复实现。
| MOD-004 | Repository/Storage Layer | 负责 SQLite ORM 模型与数据读写。 | MOD-003 | SQLite | 模型字段变更需兼容历史数据。
| MOD-005 | Analyzer/DataProvider Layer | 拉取行情/新闻并调用模型生成分析。 | MOD-003 | External APIs | 外部依赖可能限流或不可用。
| MOD-006 | Notification/Bot Layer | 消息推送与 Bot 指令处理。 | MOD-003 | External Messaging Platforms | 渠道凭据与平台配额需正确配置。
| MOD-007 | Frontend/Desktop Layer | Web 管理页与桌面壳承载交互。 | User | MOD-002 | 前端构建产物需与 API 版本兼容。

## 3. 数据流与关键路径
- 核心数据流（core_data_flow）: 入口触发 -> Service 编排 -> DataProvider/Analyzer 获取并分析 -> Storage 持久化 -> Notification/Bot 推送 -> API/Web 查询历史。
- 关键路径（critical_path）: `main.py`/`api/v1/endpoints/analysis.py` -> `src/core/pipeline.py` -> `data_provider/*` + `src/analyzer.py` -> `src/storage.py` -> `src/notification.py`。

## 4. 架构原则
| 原则ID(principle_id) | 原则名称(principle_name) | 定义(definition) | 违规示例(violation_example) |
|---|---|---|---|
| PRIN-001 | 分层依赖单向流动 | 上层可依赖下层，下层不得反向调用上层。 | `storage` 直接依赖 `api`。
| PRIN-002 | 外部依赖可替换 | 行情源、模型源、通知源都应可配置替换。 | 将供应商密钥硬编码到业务逻辑。
| PRIN-003 | 分析证据可追溯 | 分析结果应可关联输入上下文与新闻证据。 | 仅发送通知但不保存历史记录。
| PRIN-004 | 失败可降级 | 外部服务故障时系统应可记录并安全失败。 | 任一渠道失败导致整个任务崩溃。

## 5. ADR引用
- ADR链接（adr_links）: UNKNOWN（当前仅有 ADR 模板，尚未落地正式 ADR 文档）。

## 6. 变更记录
| 日期(date) | 变更(change) | ADR编号(adr_id) | 证据(evidence) |
|---|---|---|---|
| 2026-02-13 | 基于当前代码补齐系统上下文、组件职责、数据流与架构原则。 | UNKNOWN | `main.py`, `api/app.py`, `api/v1/endpoints/`, `src/core/pipeline.py`, `src/storage.py`, `src/notification.py` |
