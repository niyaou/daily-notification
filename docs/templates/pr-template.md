# 合并请求模板（PR/MR，固定段落）

## 1. 元信息
- change_type: feat|fix|refactor|docs|test|chore
- linked_issue: `#123` | `NONE`
- linked_requirements: `REQ-001,REQ-002` | `UNKNOWN`
- linked_features: `FEAT-001` | `UNKNOWN`
- linked_modules: `MOD-001,MOD-003` | `UNKNOWN`

## 2. 变更摘要
- what_changed: 本次具体改动（文件/行为/接口）
- why_changed: 业务动机或问题根因

## 3. 架构影响
- architecture_changed: yes/no
- adr_updated: yes/no
- adr_links: `docs/architecture/adr/xxxx.md` | `UNKNOWN`

## 4. 证据
- test_evidence: 执行命令 + 结果摘要（通过/失败数）
- risk_evidence: 已识别风险与缓解措施
- diff_evidence: 关键 diff 文件路径

## 5. 文档更新
- docs_updated: yes/no
- updated_files:
  - `docs/requirements/requirements-spec.md`
  - `docs/features/features-catalog.md`
- if_no_docs_update_reason: 若为 no，必须说明为何未命中文档触发规则
