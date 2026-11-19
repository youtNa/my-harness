# AI 软件交付质量 Harness 竞品与可行性报告

更新时间：2026-11-19

## 1. 项目假设

AI 编码 Agent 正在显著提高软件开发速度，但代码产出速度、测试结果可信度和最终交付质量之间存在明显脱节。目标产品通过需求分析、多 Agent 协作、独立验证、测试执行、质量门禁和交付证据链，降低 AI 生成代码进入主干或生产环境的风险。

当前建议的产品定位是：

> 面向 AI 生成代码的交付质量证明平台。

产品的核心输出不是生成了多少代码，而是说明一次交付满足了哪些要求、哪些检查已经完成、哪些结论有可复现证据、哪些风险仍然没有被证明。

## 2. 当前结论

### 市场成熟度

| 能力 | 成熟度 | 判断 |
|---|---:|---|
| 单 Agent 编码 | 高 | OpenHands、SWE-agent、Codex、Claude Code 等已经能处理大量真实开发任务 |
| Issue 到 PR | 中高 | 已有 ProPR、OpenHands Cloud、Devin 等方案 |
| 多 Agent 协作 | 中 | 角色分工和隔离执行可行，但稳定性、成本和冲突处理仍有限 |
| 自动测试和代码 Review | 中高 | CI、静态扫描和 AI Review 已较普遍 |
| 独立质量验证 | 中低 | 仍缺少统一标准和成熟产品 |
| 端到端交付可信度 | 低 | 尚未形成行业通用的质量证明标准 |
| 长期架构质量 | 低 | 公开生产证据不足，长期代码演化仍是研究问题 |

### 主要判断

市场已经有很多“让 Agent 写得更快”的产品，缺少的是“证明交付结果值得合并”的控制层。多 Agent 数量本身不能保证质量。真正的差异来自独立上下文、可执行验收条件、隔离运行环境、外部测试和可审计证据。

## 3. 关键竞品和试用价值

### OpenHands

通用自主软件工程 Agent，适合本地运行。可以读取仓库、执行命令、修改代码、运行测试和提交结果。官方提供免费本地开源版本以及 Docker Sandbox。

试用重点：Issue 理解、测试执行、失败恢复、是否修改既有测试、长任务上下文保持。

参考：

- https://www.openhands.dev/pricing/
- https://github.com/OpenHands/docs/blob/main/openhands/usage/sandboxes/docker.mdx
- https://arxiv.org/abs/2407.16741

### Qodo PR-Agent

Qodo Merge 已统一到 Qodo 平台，开源 PR-Agent 仍可自托管，支持 GitHub Action、CLI 和 Webhook。它适合验证独立 PR Review、测试建议和合并门禁。

试用重点：真实缺陷召回率、误报率、是否理解 Issue、是否提供可复现证据。

参考：

- https://www.qodo.ai/formerly-qodo-merge/
- https://github.com/qodo-ai/pr-agent

### ProPR

支持 Issue 到 PR、任务拆解、多 Agent、自动 Review、修复循环、独立 worktree、Docker 隔离和成本记录。形态最接近目标产品，但开源项目规模仍较小，适合做流程原型体验。

试用重点：Planner、实施 Agent 和 Reviewer 是否真正独立，自动修复是否引入回归，过程是否留下可审计记录。

参考：https://github.com/integry/propr

### SWE-agent

开源软件工程 Agent，适合本地安装和做基线实验。其核心价值在于 Agent-Computer Interface 和沙箱执行，适合比较模型、工具和 Harness 的影响。

参考：

- https://github.com/SWE-agent/SWE-agent
- https://arxiv.org/abs/2405.15793

### Amazon Bedrock AgentCore

AgentCore 是 Agent 运行基础设施，提供 Runtime、Memory、Gateway、Identity、Observability 和 Evaluations。它不是个人首轮试用产品，因为官方快速开始需要 AWS 账户和凭证。应放到企业平台评估阶段。

参考：https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/agentcore-get-started-cli.html

## 4. 个人可执行的体验路径

### 统一测试仓库

创建一个包含 API、数据库操作、权限逻辑、前端页面、Docker Compose 和 GitHub Actions 的小型仓库，准备 3 到 5 个 Issue。每个 Issue 同时定义公开测试和隐藏回归场景。

建议任务：

1. 有明确复现步骤的 Bug
2. 带验收条件的新 API
3. 跨模块功能变更
4. 权限或数据边界规则
5. 有性能指标的接口优化

### 体验顺序

1. 用 OpenHands 本地完成 Issue，记录执行轨迹和最终 diff。
2. 用 Qodo PR-Agent 审查 OpenHands 生成的 PR。
3. 用 ProPR 跑一次 Issue、计划、实现、Review、修复、再 Review 的闭环。
4. 最后再用 AgentCore 评估企业级运行时，而不是把它作为个人 MVP 的前置依赖。

### 统一评分指标

- 验收条件完成率
- 首轮隐藏测试通过率
- 原有测试回归率
- 真实缺陷召回率
- Review 误报率
- 证据完整度
- 人工介入次数
- 总成本和运行时间
- 重复运行的一致性
- 权限和秘密泄露风险

## 5. 研究证据

### 多 Agent 团队协作

Agyn 将软件工程建模为协调、研究、实现和 Review 角色，并使用隔离环境和结构化通信。它支持“团队流程可行”的判断，但不能证明多 Agent 在所有项目上都比单 Agent 更可靠。

参考：https://arxiv.org/abs/2602.01465

### 工具和执行环境

SWE-agent 说明 Agent 的工具接口、仓库导航、编辑方式和测试反馈对结果有重要影响。OpenHands 进一步提供了通用软件工程执行平台。

参考：

- https://arxiv.org/abs/2405.15793
- https://arxiv.org/abs/2407.16741

### 长周期软件演化

SWE-EVO 显示，长周期软件演化任务的表现显著低于短任务基准，说明短期修复能力不能直接外推为长期架构和维护能力。

参考：https://arxiv.org/abs/2512.18470

### 测试和验证器本身的可靠性

SpecGuardBench 研究 Agent 根据自然语言规格构建验证 Harness 的能力，说明不能只让 Agent 写代码，也不能默认 Agent 写出的测试或验证器是可靠的。

参考：https://arxiv.org/abs/2610.16870

### 基准和评测限制

公开 SWE-bench 高分不能直接代表生产可靠性。现实 Issue 的描述质量、环境、测试完整性和分布外泛化都会显著影响结果。

参考：

- https://www.mdpi.com/1999-5903/18/6/326
- https://arxiv.org/abs/2503.07701
- https://arxiv.org/abs/2504.21798

## 6. 建议的 MVP

第一版不应先做完整的虚拟开发团队，而应做一个 GitHub 质量验证闭环：

```text
GitHub Issue
→ 结构化验收条件
→ OpenHands、Codex 或 Claude Code 实现
→ 独立上下文 Reviewer
→ 沙箱执行测试和扫描
→ 缺口反馈
→ 最多两轮修复
→ 生成 Merge Readiness Report
```

第一版必须支持：

- GitHub Issue 和 PR 集成
- 独立 worktree 或容器
- 测试、Lint、类型检查和安全扫描
- 实现 Agent 与验证 Agent 的上下文隔离
- 防止通过修改既有测试来规避失败
- Markdown、HTML 和 JSON 报告
- 每个结论绑定可复现证据
- 高风险 PR 的合并阻断

## 7. 产品差异化

建议围绕四种项目产物建立产品模型：

1. **Requirement Pack**：需求、边界、验收条件和测试计划。
2. **Execution Trace**：模型、上下文、工具、命令、变更和失败记录。
3. **Verification Pack**：测试、扫描、浏览器验证、日志和指标证据。
4. **Merge Readiness Report**：已证明、未证明、风险和人工判断项。

## 8. 商业验证

先选择已经大量使用 AI 编码 Agent、但对安全、回归和交付责任有要求的研发团队。拿 20 个真实 AI 生成 PR，对比原有 CI、人工 Review 和独立验证流程，记录发现的真实缺陷、返工次数和人工 Review 时间。

当前决策：**Test First**。

方向有明确痛点，但完整产品还没有形成行业标准。最快的验证方式是先提供“AI 生成代码交付质量审查”服务，再决定哪些验证能力值得产品化。

## 9. 后续知识沉淀方式

后续每轮调研或试用都按以下格式追加：

```markdown
## YYYY-MM-DD 研究或试用记录

### 新事实
- 产品、论文或实验观察到的事实

### 证据
- 链接、版本、运行环境、任务和报告路径

### 对产品判断的影响
- 支持、削弱或改变了什么假设

### 下一步实验
- 一个可执行、可复现的验证任务
```

建议后续新增以下文件：

- `docs/research/product-trials.md`：产品试用记录
- `docs/research/papers.md`：论文和研究证据卡片
- `docs/research/decision-log.md`：产品决策和假设变化
- `docs/research/benchmarks/`：测试仓库、任务定义和评测结果
