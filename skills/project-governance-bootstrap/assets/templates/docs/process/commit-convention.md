# Commit Convention（Conventional Commits 强制）

## 1. 格式
`type(scope): summary`

## 2. type 枚举
- feat
- fix
- refactor
- docs
- test
- chore

## 3. 规则
1. 每个 commit 必须可归因到 requirement_id 或 feature_id 或 module_id。
2. 涉及架构变化的 commit，PR/MR 必须附 ADR 更新。
3. `docs:` commit 不得伪造变更，需有真实差异。

