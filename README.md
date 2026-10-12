# 认知视角检查器

Cognitive Perspective Check · 用于早期项目、设计和决策讨论的 Agent Skill

一个想法刚提出时，问题常常还没想清楚，方案却已经定了。例如，“给小店做个 App 提高收入”同时包含了一个目标和一种解法。如果 AI 直接接着设计 App，用户和 AI 就可能一起忽略更影响收入的原因。

这个项目希望减少这种认知窄化：先弄清会影响判断的背景，再检查双方的假设，比较少量真正会改变行动的视角。AI 要给出有依据的建议，也要说清另一条路线的价值。用户决定接下来验证什么、推演什么，以及何时停止。

## 怎么用

不需要先整理一份完整的需求文档。描述你现在的想法、已有约束，以及希望得到的结果即可。第一次使用可以直接点名：

> 使用 cognitive-perspective-check。我们想给小店做个 App 提高收入，但还不清楚瓶颈。请帮我分析有哪些不同的理解，各自会怎样影响方案。

默认流程是利用已有上下文，优先问一个会改变方向的问题；信息足够时直接分析。初始澄清累计最多补问三项关键信息，通常比较两个视角。回答需要说明各条路线的依据、收益和代价，并给出建议成立的条件。

如果你已经要求一份方案、文案或计划，回答应包含能用的成果。之后可以选一条路线继续，也可以纠正 AI 的理解。已经确定的执行任务和普通问答，直接完成即可。

## 为什么这样设计

多列几个方案，仍可能沿用同一个未经检查的前提。这里更关心的是：换一种理解之后，第一步、评价标准或投入方向是否真的会变。例如，收入不足可能与新客少有关，也可能与复购不足有关；两种解释会影响 App 是否值得做，以及先做什么。原因尚不清楚时，AI 应说明要看哪些记录才能区分。

用户的明确目标和约束需要保留，AI 自己补出的解释则需要接受检查。原方案有合理收益时，要把它讲清楚；证据已经充分时，也不必硬找一个反对意见。

为了控制讨论成本，首轮尽量保持简短，深入工作默认围绕用户选中的一个分支展开。推演用来解释条件和后果，不能把假设情节当成事实证据。这些规则约束提问、展开和阅读负担；实际推理 token 仍由客户端和模型控制。

## 安装

当前发布版本是 `v0.2.0-rc.4`。

- Windows 用户可下载 [安装包](https://github.com/EversiusJade/cognitive-perspective-check/releases/download/v0.2.0-rc.4/cognitive-perspective-check-v0.2.0-rc.4-windows.zip)，解压后双击 `install-copilot.cmd`，安装到当前用户的 `.copilot/skills`。
- Codex 与 Copilot 共用时，双击 `install-shared.cmd`，安装到 `.agents/skills`。选一个安装位置即可，避免同名技能重复。
- 手动安装可下载 [纯 Skill 包](https://github.com/EversiusJade/cognitive-perspective-check/releases/download/v0.2.0-rc.4/cognitive-perspective-check.zip)。复制整个 `cognitive-perspective-check` 文件夹，保留其中的目录结构。

安装后新建一轮聊天，先用上面的示例确认可以调用。自然触发取决于客户端支持、配置和模型，需要实际观察。

macOS、Linux、项目级安装、更新和卸载见 [安装说明](INSTALL.md)。Claude Code、Claude 网页/桌面和 Cursor 的安装方法及实测状态见 [客户端兼容说明](docs/client-compatibility.md)。版本说明和校验文件见 [Release](https://github.com/EversiusJade/cognitive-perspective-check/releases/tag/v0.2.0-rc.4)。

已有 Node.js / npm 的用户，也可以按 [skills CLI 文档](https://github.com/vercel-labs/skills/blob/main/README.md) 安装：

```sh
npx skills add EversiusJade/cognitive-perspective-check --skill cognitive-perspective-check
```

这条命令尚未在本项目中实测。GitHub 公开发布和 ZIP 下载不代表已经收录到 skills.sh；目录收录与 CLI 安装遥测的关系见 [官方 FAQ](https://www.skills.sh/docs/faq)。

## 目前验证到哪里

项目还处于候选版本阶段。已有安装检查、小样本输出记录和内容审查，分别保留了对应版本与检查范围。

最近完成了 [8 次 Codex 实际采集](evals/runs/2026-10-11-codex-rc4-first-batch/REPORT.md)：两个单轮场景分别在无 skill、简短提示、安装但不点名、点名调用四种条件下运行。记录包含回答、原生 token 用量和工具失败。点名调用的两个回合都增加了额外说明，其中一个读取 skill 时遇到了工具错误。

这批数据能帮助定位执行问题，还不能证明多视角分析有增益。计划中的其余 40 次采集和独立人工评分尚未完成，也没有真实用户采纳率或 token 节省比例。

实验方法见 [对照方案](evals/experiment/README.md)，Codex 采集方法见 [运行说明](docs/evaluation/codex-first-round.md)。早期 `rc.1` 的结果保留在 [历史验证记录](evals/validation.md)。[演示脚本](docs/demo-script.md) 已准备，实际录屏尚未完成。

## 继续了解

- [研究目的](docs/research-purpose.md)：要减少哪些判断偏差，以及准备观察什么。
- [对话示例](docs/examples.md)：从一个带预设的需求，到比较、纠正和交付。
- [设计取舍](docs/design-decisions.md)：为什么限制追问和展开，怎样保留用户选择。
- [相关项目](docs/comparison.md)：与提问、批判性思考和问题重构方法的重叠与区别。

核心规则在 `skills/cognitive-perspective-check/SKILL.md`。`references/deepen.md` 用于用户选定后的深入工作；安装程序、文档和评估材料分别放在仓库根目录、`docs/` 与 `evals/`。

## English overview

Cognitive Perspective Check is an Agent Skill for early project planning, design, and decision support. It aims to reduce premature cognitive narrowing by checking both user and AI assumptions. It asks only questions that could change the decision, compares a few perspectives with different practical consequences, and explains the evidence and tradeoffs behind its recommendation. The user chooses what to explore next. Evaluation is ongoing; the first eight Codex runs document execution behavior, not a demonstrated improvement in decision quality.

## 反馈与许可

欢迎通过 [Issues](https://github.com/EversiusJade/cognitive-perspective-check/issues) 或 [反馈模板](https://github.com/EversiusJade/cognitive-perspective-check/issues/new?template=usage-feedback.md) 提供实际案例。给出原问题、AI 的回答，以及哪一步有帮助或造成阻碍即可；方便时再补充客户端、模型和版本。请去掉敏感信息。

项目使用 [MIT 许可证](LICENSE)。
