# GitHub 发布准备

仓库名与安装标识保持 `cognitive-perspective-check`。项目展示名称使用“认知视角检查器 · Cognitive Perspective Check”，Codex UI 展示名称使用“认知视角检查器”。

可直接粘贴的中英文仓库描述（不超过 GitHub 的 350 字符限制）：

> 认知视角检查器｜以减少用户与 AI 的认知窄化为目标，服务早期项目、设计与决策。少量关键补问理解背景与规则，检验双方预设，对照实质不同的视角、证据与取舍，给出条件建议，由用户选择是否验证、推演或制作方案。Agent Skill for critical thinking and decision support: check assumptions, compare perspectives. Copilot / Codex.

本项目的 Topics 配置：`agent-skills`、`critical-thinking`、`cognitive-narrowing`、`decision-support`、`problem-framing`、`perspective-taking`、`github-copilot`、`codex-skills`。

机器可读的目标描述与标签见 [repository-metadata.json](repository-metadata.json)。该文件用于保存发布配置，提交文件本身不会修改 GitHub 右侧 About 或 Topics；这些字段需要通过 GitHub 元数据编辑入口保存。

## 发布状态

截至 2026-10-11，**`v0.2.0-rc.4` 已公开发布为候选版；前三个候选版本保留为历史版本。**

公开仓库：[EversiusJade/cognitive-perspective-check](https://github.com/EversiusJade/cognitive-perspective-check)。上一版 [v0.2.0-rc.1 Release](https://github.com/EversiusJade/cognitive-perspective-check/releases/tag/v0.2.0-rc.1) 附件包含 Windows 安装 ZIP、纯 skill ZIP 和 SHA-256 校验文件。该链接保留为历史记录。

历史版本 [v0.2.0-rc.2 Release](https://github.com/EversiusJade/cognitive-perspective-check/releases/tag/v0.2.0-rc.2) 与 [v0.2.0-rc.3 Release](https://github.com/EversiusJade/cognitive-perspective-check/releases/tag/v0.2.0-rc.3) 保留。rc.3 发布流程成功，两个 ZIP 的尺寸与 SHA-256 均与当时本地构建一致。本次 [v0.2.0-rc.4 Release](https://github.com/EversiusJade/cognitive-perspective-check/releases/tag/v0.2.0-rc.4) 已公开发布为 pre-release，包含 Windows 安装 ZIP、纯 skill ZIP 与 SHA-256 校验文件。发布流程成功，GitHub 附件元数据中的三个文件尺寸与 SHA-256 均与本地构建一致；这确认分发产物，没有新增安装或模型行为测试，也不等于在实际客户端完成安装验证。

README、核心规则与研究目的保持减少用户和 AI 认知窄化的定位。2026-10-11 已读取 GitHub 实际仓库元数据，确认右侧 About 已使用上面的新版简介，八个 Topics 也已保存。配置文件与实际字段同步；字段生效本身不保证搜索排名或第三方目录收录。

## 上传与发布

将完整包内的文件上传到仓库根目录，确保首页直接看到 README，且入口在 `skills/cognitive-perspective-check/SKILL.md`。不要把制作时的 `work/`、临时 Python 依赖或个人凭证上传。

仓库使用 `.github/workflows/publish-release.yml` 从触发提交构建，再发布附件。打包脚本 `scripts/package_release.py` 仅依赖 Python 标准库，保留安装程序与 skill 的字节。已发布版本不会被流程覆盖。发布后续版本时，更新 skill 的 `metadata.version`、workflow 的 `RELEASE_TAG`、版本说明文件路径和触发路径，并写对应版本说明。

`v0.2.0-rc.4` 沿用原安装程序与运行方式，安装标识不变，采用 MIT 许可，并保留允许隐式调用的配置。源码和分发包应包含相同的核心技能及深入参考文件。

## v0.2.0-rc.4 Release 说明

本版精简核心入口的重复说明，明确少量视角属于本轮覆盖范围，不代表穷尽所有选择；新信息推翻视角时替换受影响的内容。默认少量视角与单分支深入可按用户明确要求和预算调整。制作成果前进行一次简短完成检查，区分方案提议与已完成动作，并新增轻量使用反馈入口。

理解背景是该流程的基础，目标是在早期项目、设计与决策中减少用户和 AI 的认知窄化。保留少量提问、少量视角、适应问题的分析维度和用户选中的单分支深入；完整推演按需展开，假设情景不作为现实证据。明确任务直接交付，目标与约束由用户保留。

提供 Windows Copilot 与共用目录的安装入口；默认保留不同的已有版本，显式更新时备份。稳定安装标识保持 `cognitive-perspective-check`，沿用原安装程序，采用 MIT 许可。

本次包含使用视角的静态审查，**没有新增模型行为实验或安装测试**。现有安装、格式和四个新旧版本行为样例的记录均对应 `v0.2.0-rc.1`；这些历史结果不能证明本版相对增益、自然调用率、token 节省或长期用户效果。文字精简也不等于后台 token 减少。完整版本说明见 [v0.2.0-rc.4.md](releases/v0.2.0-rc.4.md)。

## 在线安装地址

本次候选版下载入口：

- [Windows 便捷安装包](https://github.com/EversiusJade/cognitive-perspective-check/releases/download/v0.2.0-rc.4/cognitive-perspective-check-v0.2.0-rc.4-windows.zip)
- [纯 Skill 包](https://github.com/EversiusJade/cognitive-perspective-check/releases/download/v0.2.0-rc.4/cognitive-perspective-check.zip)
- [版本说明与校验文件](https://github.com/EversiusJade/cognitive-perspective-check/releases/tag/v0.2.0-rc.4)

也可下载 [仓库源码 ZIP](https://github.com/EversiusJade/cognitive-perspective-check/archive/refs/heads/main.zip)，按 [安装说明](../INSTALL.md) 使用。GitHub 托管、Release 下载、第三方目录收录和客户端插件市场各有自己的发布与发现机制。

## 搜索与目录发现

GitHub 默认仓库搜索匹配名称、简介与 Topics。README 的内容可使用 `in:readme` 查找；普通 `docs/` 文件不能替代仓库简介和标签。本项目在 README 中提供中英文能力说明；实际元数据应保留“减少用户和 AI 的认知窄化”的主旨，以及关键提问、预设检验、视角取舍和用户选择的具体行为。[GitHub 搜索说明](https://docs.github.com/en/search-github/searching-on-github/searching-for-repositories)、[Topics 说明](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/classifying-your-repository-with-topics)。

可选的 skills CLI 安装入口（需 Node.js / npm）：

```sh
npx skills add EversiusJade/cognitive-perspective-check --skill cognitive-perspective-check
```

按客户端选择一种安装位置，避免与 ZIP 安装产生同名重复。现有技能结构与命令依据 [官方 CLI 文档](https://github.com/vercel-labs/skills/blob/main/README.md)；本轮未执行该命令，不把文档兼容当作安装验证。Windows ZIP 仍提供无需 Node.js 的原有安装方式。

[skills.sh 官方 FAQ](https://www.skills.sh/docs/faq) 说明，目录榜单通过 CLI 的匿名安装遥测发现技能。真实用户按需安装且参与遥测，才可能通过此路径出现在目录；下载 ZIP、手动复制、创建公开仓库或 Release 本身不代表已经收录。关闭遥测不妨碍用户使用本 skill。当前不声称已被 skills.sh 收录，也不保证处理时限、搜索排名或访问量。

发布后可在 GitHub 仓库搜索中分别查询：`cognitive-perspective-check in:name`、`认知窄化 user:EversiusJade in:description`、`cognitive-narrowing user:EversiusJade in:topics` 和 `认知窄化 user:EversiusJade in:readme`。搜索到只说明该入口可检索；自然流量仍需真实示例、相关社区分享和用户反馈支持。
