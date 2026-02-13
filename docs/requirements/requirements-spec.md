# 需求规格（固定模板）

## 1. 背景与目标
- 项目ID（project_id）: PROJ-DAILY-STOCK-ANALYSIS
- 业务背景（business_context）: 提供 A 股/港股/美股自选股的日常分析能力，支持 CLI、定时任务、FastAPI、Bot 渠道推送与 Web 管理端，减少人工盯盘与信息汇总成本。
- 成功指标（success_metrics）:
  - 每日定时任务可按配置稳定触发并完成（见 `src/scheduler.py`、`main.py --schedule`）
  - 可对指定股票完成分析并落库历史记录（见 `src/core/pipeline.py`、`src/storage.py`）
  - 至少一个通知渠道可接收分析结果（见 `src/notification.py`、`bot/platforms/`）
  - API 健康检查与核心分析接口可用（见 `api/app.py`、`api/v1/endpoints/analysis.py`）

## 2. 范围
- 范围内（in_scope）:
  - 自选股数据获取、分析、结果生成与通知
  - 定时运行与手动触发（CLI/API）
  - 分析历史与回测数据持久化
  - Web 前端管理页与桌面端壳程序
- 范围外（out_of_scope）:
  - 自动下单、券商交易执行
  - 投资收益承诺与投顾合规输出
  - 高频交易或毫秒级实时行情撮合

## 3. 需求列表（固定字段）
| 需求ID(requirement_id) | 标题(title) | 描述(description) | 验收标准(acceptance_criteria) | 优先级(priority) | 来源(source) | 状态(status) |
|---|---|---|---|---|---|---|
| REQ-001 | 多入口分析执行 | 系统需支持 CLI、定时任务与 API 三种入口触发分析。 | `main.py` 支持 `--schedule/--serve/--serve-only`，且 API 可通过 `api/v1/endpoints/analysis.py` 触发分析。 | P0 | prd | active |
| REQ-002 | 分析结果可追溯 | 每次分析结果与关联新闻应可落库并按条件查询。 | `src/storage.py` 存在 `AnalysisHistory`/`NewsIntel` 模型与查询接口，API 历史接口可分页查询。 | P0 | prd | active |
| REQ-003 | 多渠道通知 | 系统需支持至少一种消息渠道推送分析结果，并支持扩展。 | `src/notification.py` 与 `bot/platforms/` 支持企业微信/飞书/Telegram/钉钉等渠道。 | P1 | issue | active |
| REQ-004 | 可配置化运行 | 关键运行参数应可通过环境变量或配置管理。 | `src/config.py`、`.env.example` 提供模型、数据源、调度、通知、Web/API 等配置项。 | P0 | prd | active |
| REQ-005 | 回测评估闭环 | 系统应支持对历史分析结果执行回测并产出统计汇总。 | `src/services/backtest_service.py` 与 `BacktestResult/BacktestSummary` 可运行并写入结果。 | P1 | issue | active |

## 4. 约束与原则映射
| 原则ID(principle_id) | 原则名称(principle_name) | 需求ID(requirement_id) | 备注(notes) |
|---|---|---|---|
| PRIN-001 | 分层解耦 | REQ-001 | API->Service->Repository/Storage 分层，避免入口层直接访问底层存储。 |
| PRIN-002 | 证据可追溯 | REQ-002 | 分析链路通过 `query_id` 关联新闻与分析历史。 |
| PRIN-003 | 可扩展通知 | REQ-003 | 渠道适配器集中在 `bot/platforms/`，支持按配置启用。 |
| PRIN-004 | 配置优先 | REQ-004 | 运行参数由环境变量和配置对象统一管理。 |
| PRIN-005 | 评估闭环 | REQ-005 | 回测服务对分析建议进行后验统计。 |

## 5. 变更记录
| 日期(date) | 变更(change) | 作者(author) | 证据(evidence) |
|---|---|---|---|
| 2026-02-13 | 首次基于合并后代码补齐需求背景、范围、需求列表与原则映射。 | codex | `main.py`, `api/app.py`, `api/v1/endpoints/analysis.py`, `src/storage.py`, `src/config.py`, `src/services/backtest_service.py` |
