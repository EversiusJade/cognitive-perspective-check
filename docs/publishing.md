# GitHub 发布准备

推荐仓库名：`cognitive-perspective-check`。保留这个安装标识，展示名称使用“问题框架校准器”。

可直接粘贴的仓库描述：

> A lightweight Agent Skill for vague early needs: ask only pivotal questions, show how problem frames change actions, and let users choose the depth. 模糊需求的少量澄清与问题框架校准。

建议 topics：`agent-skills`、`problem-framing`、`decision-support`、`github-copilot`。

## 上传与发布

将完整包内的文件上传到仓库根目录，确保首页直接看到 README，且入口在 `skills/cognitive-perspective-check/SKILL.md`。不要把制作时的 `work/`、临时 Python 依赖或个人凭证上传。

首次建议发布预览 Release，tag 使用 `v0.2.0-rc.1`，勾选 pre-release。附件放 Windows 安装 ZIP 和纯 skill ZIP。README 中的版本与技能 metadata 一致。仓库仍未由制作助手实际创建或发布。

## 可使用的 Release 说明

本版本将定位收束到模糊、带预设的早期需求校准。增加关键问题的筛选规则、不同框架怎样改变实际方案、有条件的偏向、用户选中的单分支推演，以及已确定执行任务的直接交付边界。

提供 Windows Copilot 与共用目录的安装入口；默认保留不同的已有版本，显式更新时备份。采用 MIT 许可。入口正文字符数比旧版减少约32%，不是已测得的 token 节省。

Windows PowerShell 安装检查与格式检查已通过。包含四个新旧版本的行为样例及作者评阅；尚未测量实际客户端的自然调用率、无技能基线增益、真实 token 使用或长期用户效果。

## 在线安装地址

仓库发布后再加入真实仓库链接和针对目标工具验证过的安装命令。发布前不提供虚构仓库地址，也不声称已经进入技能市场。GitHub 托管、Release 下载、第三方目录收录和客户端插件市场是不同发布渠道，各自需要验证。
