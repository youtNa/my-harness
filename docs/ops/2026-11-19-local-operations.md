# 本机操作记录

日期：2026-11-19

## Git

- 初始化仓库：`git init -b main`
- 添加远端：`git@github.com:youtNa/my-harness.git`
- 初始推送：commit `719c1e9`
- OpenHands 试用报告：commit `ed4caab`

## Docker

- 启动 Docker Desktop
- 拉取镜像：`ghcr.io/all-hands-ai/openhands:main`
- 镜像摘要：`sha256:0dcd216f296cace3321e911dfb143d3b13d680aead5b542881dc4c419cc1a676`
- 创建临时容器：`my-harness-openhands`
- 仅挂载：`experiments/e001-local-agent-quality-loop`
- 已清理临时容器：`docker rm -f my-harness-openhands`
- 未创建持久化 Volume，未挂载 SSH、云凭证或其他主机目录

## 可回退

- 删除未提交文件：使用 Git 状态确认后逐项移除
- 回退项目内容：`git reset --hard 719c1e9`
- 删除 Docker 镜像：`docker image rm ghcr.io/all-hands-ai/openhands:main`
- 删除本地仓库元数据：删除项目下 `.git` 目录前需确认远端已有推送
