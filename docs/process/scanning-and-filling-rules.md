# Scanning and Filling Rules（固定规则引擎说明）

## 1. 文件分类映射
| category | 匹配特征 |
|---|---|
| requirement | `docs/requirements/` |
| feature | `docs/features/` |
| module | `docs/architecture/module-diagram.md` |
| architecture | `docs/architecture/system-architecture.md` 或 `docs/architecture/adr/` |
| test | `test`, `tests`, `spec` |
| docs | `docs/` |
| code | 其他源码文件 |

## 2. 文档触发规则
1. 业务行为变化 -> 更新 requirements 或 features
2. 模块边界/依赖变化 -> 更新 module-diagram
3. 流程交互变化 -> 更新 sequence-diagrams
4. 架构约束变化 -> 更新 system-architecture + ADR

## 3. DocDelta固定字段
- requirements_delta
- feature_delta
- task_delta
- code_delta
- architecture_delta
- open_questions

## 4. UNKNOWN策略
- 证据不足时，不推测，统一输出 `UNKNOWN`。

