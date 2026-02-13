# 模块图（Mermaid固定模板）

```mermaid
graph TD
    Client[Client]
    API[API Layer]
    Service[Service Layer]
    Repo[Repository Layer]
    DB[(Database)]

    Client --> API
    API --> Service
    Service --> Repo
    Repo --> DB
```

## 变更规则
1. 模块边界变化必须更新此图。
2. 依赖方向变化必须更新此图。
3. 新增模块必须标注 `module_id` 并同步 `system-architecture.md`。

