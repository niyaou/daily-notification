# 时序图（Mermaid固定模板）

```mermaid
sequenceDiagram
    participant U as User/Cron
    participant E as Entry(main.py/API)
    participant S as Service/Pipeline
    participant P as Provider/LLM
    participant D as Storage(SQLite)
    participant N as Notifier/Bot

    U->>E: trigger analysis
    E->>S: create task + validate config
    S->>P: fetch market/news + run AI analysis
    P-->>S: analysis result
    S->>D: save analysis history + news intel
    D-->>S: persisted
    S->>N: send notifications
    N-->>U: delivered summary

    alt provider timeout/failure
        P-->>S: error
        S->>D: save failure evidence/log
        S-->>E: degraded response
    end
```

## 变更规则
1. 关键业务流程变化必须更新此图。
2. 异常分支变化必须补充 alt/opt 分支。
3. 时序图更新需关联 feature_id 或 requirement_id。
