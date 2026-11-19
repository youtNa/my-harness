# 开源工具实际试用总览

更新时间：2026-11-19

## 试用边界

本轮只使用个人可运行的开源或本地路径，不使用 AWS 账户、生产仓库、生产密钥或本机无关目录。每个工具都应在 Docker 或临时目录中验证，并记录清理步骤。

## 当前状态

| 工具 | 角色 | 本轮状态 | 报告 |
|---|---|---|---|
| OpenHands | 实现 Agent 和本地沙箱 | 进行中 | [OpenHands 试用](./trials-openhands.html) |
| Qodo PR-Agent | PR Review 和质量门禁 | 进行中 | [PR-Agent 试用](./trials-pr-agent.html) |
| SWE-agent | 软件工程 Agent 基线 | 进行中 | [SWE-agent 和 ProPR 试用](./trials-swe-agent-propr.html) |
| ProPR | Issue 到 PR 编排 | 待确认 | [SWE-agent 和 ProPR 试用](./trials-swe-agent-propr.html) |
| AgentCore | 企业运行时 | 暂不纳入个人试用 | [主报告](./ai-delivery-quality-harness.md) |

## 统一任务集

本轮工具比较使用同一个小型任务集。每项任务都应包含公开检查和独立隐藏检查。

1. 明确复现步骤的 Bug 修复
2. 带验收条件的新 API
3. 跨模块功能变更
4. 权限边界和异常路径
5. 有性能指标的接口优化

## 统一评分

- 验收条件完成率
- 首轮隐藏检查通过率
- 原有测试回归率
- 真实缺陷召回率
- Review 误报率
- 证据完整度
- 人工介入次数
- 总成本和运行时间
- 重复运行一致性
- 权限边界表现

## 说明

没有模型 API Key 时，只记录安装、启动、沙箱、CLI 和确定性检查结果，不把未执行的模型调用写成成功。模型调用失败、权限不足、Docker 启动失败和网络问题都作为试用结果的一部分保存。
