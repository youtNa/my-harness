# OpenHands 本地 Docker 试用报告

更新时间：2026-11-19

## 结论

OpenHands 官方容器可以在个人 Mac 上成功拉取和启动。容器内服务成功监听 3000 端口，启动日志显示 SQLite 迁移、MCP session manager 和 Uvicorn 均已完成初始化。

本次没有调用模型，也没有执行真实代码修改任务。原因是当前环境没有可用的模型 API Key，且本轮目标先验证本地运行、隔离挂载和清理链路。因而本报告不能证明 OpenHands 的代码生成质量，只能证明其本地运行基础设施可行。

## 环境

- 主机：macOS
- Docker：29.2.1
- OpenHands 镜像：`ghcr.io/all-hands-ai/openhands:main`
- 镜像 ID：`sha256:0dcd216f296cace3321e911dfb143d3b13d680aead5b542881dc4c419cc1a676`
- 镜像大小：约 394 MB
- 挂载目录：`experiments/e001-local-agent-quality-loop`
- 使用的权限：仅挂载实验目录，没有挂载 SSH、云凭证或其他主机目录

## 实际执行

### 拉取镜像

```bash
docker pull ghcr.io/all-hands-ai/openhands:main
```

结果：成功。

### 入口探测

```bash
docker run --rm ghcr.io/all-hands-ai/openhands:main --help
```

结果：容器启动脚本把 `--help` 当成了应用命令，返回：

```text
/app/entrypoint.sh: line 41: --help: command not found
```

这说明该镜像不是通过容器参数直接暴露 CLI 帮助，使用时应按官方容器启动方式配置环境变量和端口。

### 启动隔离容器

```bash
docker run -d \
  --name my-harness-openhands \
  -p 3000:3000 \
  -v "$PWD/experiments/e001-local-agent-quality-loop:/workspace" \
  ghcr.io/all-hands-ai/openhands:main
```

容器日志包含：

```text
Application startup complete.
Uvicorn running on http://0.0.0.0:3000
Running OpenHands as root
```

SQLite 数据库迁移和 MCP streamable HTTP session manager 也成功启动。

## 观察结果

### 已验证

- 官方镜像可下载
- 容器可启动
- 应用服务可在容器内监听 3000 端口
- 实验目录可以作为独立工作区挂载
- 启动过程会自动执行数据库迁移
- 没有要求 AWS 账户

### 尚未验证

- 模型调用
- Issue 到代码修改
- 测试执行和失败恢复
- GitHub 集成
- Reviewer 上下文隔离
- 成本和长任务稳定性

## 失败和边界

1. 直接传入 `--help` 不能获得应用帮助，因为镜像入口脚本不把参数转发给 CLI。
2. 宿主机对 Docker socket 的访问需要 Docker Desktop 正在运行，并且在受限执行环境中可能需要额外权限。
3. 没有模型 API Key 时不能验证真实 Agent 行为。
4. 本地 HTTP 端口从受限命令环境访问时不稳定，但容器内部日志证明服务已经监听成功。

## 清理

```bash
docker rm -f my-harness-openhands
```

本次没有创建持久化 Docker volume，也没有写入主机凭证目录。镜像是否保留由后续实验决定。如需完全清理：

```bash
docker image rm ghcr.io/all-hands-ai/openhands:main
```

## 下一步

使用个人模型 API Key 或 OpenHands 个人方案，继续在同一个 disposable workspace 执行一个无敏感数据的最小任务。任务必须有一个公开测试和一个独立隐藏测试，并记录完整 diff、测试输出和 Agent 自评之间的差异。

## 2026-11-19 主流程复跑记录

### 任务

在 `experiments/e001-local-agent-quality-loop/task-repo` 中修复 `slugify`。基线为 1 个失败测试、1 个通过测试，目标是将连续空白转换为一个连字符并移除首尾连字符。

### 已执行

- 已配置临时 Anthropic 模型环境变量，未读取或写入密钥。
- 已通过 OpenHands API 创建会话并启动 Agent Loop。
- 默认 Docker Runtime 在创建二级运行时容器时失败，因为主容器没有 Docker Socket。
- 尝试切换到 `RUNTIME=local`，发现镜像缺少 `tmux` 和 Playwright 浏览器依赖。
- 已创建 `infra/openhands-local-runtime.Dockerfile`，补充 `tmux` 和 Playwright 依赖。

### 当前结论

主流程仍未完成代码修改和最终测试。安装和服务启动不能被视为任务成功。

### 需要的下一步

优先使用 OpenHands 官方推荐的运行方式补齐二级沙箱，或确认允许挂载 Docker Socket。Docker Socket 会赋予容器较高的 Docker 守护进程控制权限，当前自动审批拒绝了该操作，因此没有绕过这一安全边界。

## 决策影响

OpenHands 可以作为个人可运行的实现 Agent 和沙箱执行层。它不能单独作为交付质量保证，因此后续必须与独立 Review、隐藏测试和证据报告结合。
