# Research Skill 重叠与整合判断

更新时间：2026-11-20

## 判断

两个 Skill 不应删除其中一个。它们是“通用基类 + 软件工程专用配置”的关系，但当前存在重复规则，需要整合。

| Skill | 作用范围 | 保留理由 |
|---|---|---|
| `component-research` | 任意组件、SDK、插件、运行时和 Agent | 负责官方文档、安装、主流程、截图、证据和 HTML 报告 |
| `research-harness` | AI 编码 Agent、多 Agent、验证 Harness | 负责任务仓库、基线测试、独立 Reviewer、隐藏回归和交付质量判断 |

## 重叠部分

- Docker 或临时 worktree
- 版本固定
- 主流程执行
- 独立验证
- 中文 HTML 报告
- 已验证、未验证和阻塞状态
- 日志、产物和清理记录

## 互补部分

`component-research` 面向“组件是否能被真实使用”。`research-harness` 面向“AI 软件工程组件是否能交付可靠代码”。后者需要额外的基线失败测试、隐藏回归、差异审查和实现 Agent 与 Reviewer 的上下文分离。

## 已完成的整合

- 把共同最低要求抽到 `skills/component-research/references/evaluation-contract.md`。
- `component-research` 作为通用 Research 入口。
- `research-harness` 只保留软件工程专用规则，并引用通用入口和契约。
- 保留两个名称，避免已有调用路径失效。

## 使用规则

- 研究单个产品或组件时使用 `component-research`。
- 研究编码 Agent、PR Review、测试 Harness 或多 Agent 交付时使用 `research-harness`。
- 一个任务同时包含组件研究和代码交付验证时，先执行 `component-research` 的通用阶段，再叠加 `research-harness` 的软件工程试验阶段。
