# ADR目录规则

## 命名
- 格式：`NNNN-title.md`
- 示例：`0001-introduce-event-bus.md`

## 触发条件
1. 系统边界变化。
2. 关键依赖变更。
3. 关键数据流变化。
4. 核心架构原则调整。

## 审核约束
- 触发条件满足但无 ADR，`principle_conflict=fail`。

