# GitHub 发布准备

仓库名与安装标识保持 `cognitive-perspective-check`。项目展示名称使用“认知视角检查器 · Cognitive Perspective Check”，Codex UI 展示名称使用“认知视角检查器”。

可直接粘贴的中文仓库描述（不超过 GitHub 的 350 字符限制）：

> 认知视角检查器｜面向早期项目、设计与决策，以减少用户与 AI 的认知窄化为目标。用少量关键问题理解背景、规则与内部逻辑，检查双方预设，对照会改变判断或行动的视角、依据与取舍，给出条件建议；由用户选择是否验证、比较或推演。轻量流程，支持 Copilot 与 Codex。

建议 topics：`agent-skills`、`cognitive-perspectives`、`problem-framing`、`decision-support`、`github-copilot`。

## 发布状态

截至 2026-10-11，**`v0.2.0-rc.2` 已准备，待发布；上一候选版 `v0.2.0-rc.1` 已发布。**

公开仓库：[EversiusJade/cognitive-perspective-check](https://github.com/EversiusJade/cognitive-perspective-check)。上一版 [v0.2.0-rc.1 Release](https://github.com/EversiusJade/cognitive-perspective-check/releases/tag/v0.2.0-rc.1) 附件包含 Windows 安装 ZIP、纯 skill ZIP 和 SHA-256 校验文件。该链接保留为历史记录。

本次发布目标为 [v0.2.0-rc.2 Release](https://github.com/EversiusJade/cognitive-perspective-check/releases/tag/v0.2.0-rc.2)，标记为 pre-release。发布成功后再更新本节状态。

## 上传与发布

将完整包内的文件上传到仓库根目录，确保首页直接看到 README，且入口在 `skills/cognitive-perspective-check/SKILL.md`。不要把制作时的 `work/`、临时 Python 依赖或个人凭证上传。

仓库使用 `.github/workflows/publish-release.yml` 从触发提交构建，再发布附件。打包脚本 `scripts/package_release.py` 仅依赖 Python 标准库，保留安装程序与 skill 的字节。已发布版本不会被流程覆盖。发布后续版本时，更新 skill 的 `metadata.version`、workflow 的 `RELEASE_TAG`、版本说明文件路径和触发路径，并写对应版本说明。

`v0.2.0-rc.2` 沿用原安装程序与运行方式，安装标识不变，采用 MIT 许可，并保留自动调用策略。源码和分发包应包含相同的核心技能及深入参考文件。

## 可使用的 v0.2.0-rc.2 Release 说明

项目展示名称更新为“认知视角检查器 · Cognitive Perspective Check”。本版明确了连续流程：理解背景、规则与内部逻辑，识别并分析核心问题，对照少量有实际差别的视角，按需解释条件后果或进行有限推演，依据证据与取舍给出 AI 的条件偏向，由用户选择继续的分支。

理解背景是该流程的基础，目标是在早期项目、设计与决策中减少用户和 AI 的认知窄化。保留少量提问、少量视角、适应问题的分析维度和用户选中的单分支深入；完整推演按需展开，假设情景不作为现实证据。明确任务直接交付，目标与约束由用户保留。

提供 Windows Copilot 与共用目录的安装入口；默认保留不同的已有版本，显式更新时备份。稳定安装标识保持 `cognitive-perspective-check`，沿用原安装程序，采用 MIT 许可。

本次为定位、规则和文档修订，**没有新增模型行为实验**。现有安装、格式和四个新旧版本行为样例的记录均对应 `v0.2.0-rc.1`；这些历史结果不能证明本版相对增益、自然调用率、token 节省或长期用户效果。

## 在线安装地址

本次候选版下载入口：

- [Windows 便捷安装包](https://github.com/EversiusJade/cognitive-perspective-check/releases/download/v0.2.0-rc.2/cognitive-perspective-check-v0.2.0-rc.2-windows.zip)
- [纯 Skill 包](https://github.com/EversiusJade/cognitive-perspective-check/releases/download/v0.2.0-rc.2/cognitive-perspective-check.zip)
- [版本说明与校验文件](https://github.com/EversiusJade/cognitive-perspective-check/releases/tag/v0.2.0-rc.2)

也可下载 [仓库源码 ZIP](https://github.com/EversiusJade/cognitive-perspective-check/archive/refs/heads/main.zip)，按 [安装说明](../INSTALL.md) 使用。针对目标工具的在线安装命令需另行验证。GitHub 托管、Release 下载、第三方目录收录和客户端插件市场各有自己的发布与发现机制。
