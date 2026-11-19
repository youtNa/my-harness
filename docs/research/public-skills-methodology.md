# 组件 Research Skill 公开方法调研

更新时间：2026-11-20

## 结论

最适合本项目的不是一个单独的“竞品调研 Skill”，而是把三个公开方法合并：

1. 官方文档驱动的 Research Synthesis
2. Harness Authoring 的结构化发现和成功标准
3. Skill Evals 的运行轨迹、检查项和回归评估

## 公开方法

### OpenAI Skill Evals

OpenAI 将 Skill 评估定义为“提示词、运行轨迹和产物、检查项、可比较分数”。重点检查是否调用了 Skill、是否执行了预期命令，以及输出是否符合约定。该方法要求先用小规模真实运行暴露隐藏假设，再建立 10 到 20 条提示词的回归集。

来源：https://developers.openai.com/blog/eval-skills

### OpenAI Harness Authoring

OpenAI 的 Harness Authoring 示例要求先阅读仓库规则、现有 Harness 和目标边界，再确定 Skill 的触发描述、资源、非目标、验证计划和验收标准。它强调 Skill 的目标是形成可复用工作流，而不是直接开始实现业务代码。

来源：https://developers.openai.com/cookbook/examples/codex/iterating-development-workflows-with-codex

### Anthropic Research Synthesis

Anthropic 的公开 Skill 指南给出 Research Synthesis 模式，要求先阅读全部来源，再提取主题、交叉核对主张、形成结构化总结并验证引用。它也强调“运行验证器、修复错误、再次运行”的反馈循环。

来源：https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices

### OpenAI Skill Catalog 和 Agent Skills 标准

OpenAI 的 Skill Catalog 说明 Skill 是由指令、脚本和资源组成的可发现能力包，并指向 Agent Skills 开放标准。该仓库当前已标记为 deprecated，新的 Skill 和插件示例应参考 OpenAI Plugins 仓库。

来源：https://github.com/openai/skills

### Harness 供应链研究

2026 年公开研究对 3,171 个 GitHub 仓库中的 Agent Harness 配置做了静态和独立复核，覆盖 Skill、Hook、MCP 和 Subagent。研究强调 Skill 是带有开发者权限运行的依赖层，应固定版本、审查权限和验证配置是否真的可用。

来源：https://arxiv.org/abs/2609.07360

## 已吸收到项目 Skill 的规则

- 先读官方文档，再安装
- 先定义主流程成功标准，再开始试用
- 安装成功和核心功能成功分开记录
- 运行轨迹和产物必须可复查
- 结果必须有独立检查
- 有视觉界面时必须抓取真实截图
- 无视觉界面时使用终端或 API 证据
- 每次试用必须留下清理和复现步骤

项目 Skill：`skills/component-research/SKILL.md`
