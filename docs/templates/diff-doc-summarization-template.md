# 文档差异模板（DocDelta，缺文档自动补全）

## 1. 来源
- pr_or_mr_id: PR-XXXX
- commit_range: `<start_sha>..<end_sha>`
- diff_scope: requirement|feature|module|code|architecture|test|docs

## 2. 结构化差异
- requirements_delta: `新增/修改/删除` + requirement_id 列表；无证据填 `UNKNOWN`
- feature_delta: `新增/修改/删除` + feature_id 列表；无证据填 `UNKNOWN`
- task_delta: 任务或流程变化摘要；无证据填 `UNKNOWN`
- code_delta: 代码改动模块、入口点、关键文件摘要
- architecture_delta: 架构边界/依赖/约束变化；无变化填 `none`

## 3. 待澄清问题
- open_questions:
  - Q1: UNKNOWN 项说明（字段 -> 缺失证据 -> 需要谁补充）

## 4. 证据
- evidence_files:
  - `path/to/file_a`
  - `path/to/file_b`
- evidence_commits:
  - `<sha1>`
  - `<sha2>`
- evidence_diff_notes:
  - 说明字段与 diff 片段的映射关系（1 字段 1 来源）
