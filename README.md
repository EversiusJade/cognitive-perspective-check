# 认知视角检查器

Cognitive Perspective Check · 用于早期项目、设计和决策讨论的 Agent Skill

很多人向 AI 求助时，手里只有一个大致的想法：想做个项目、需要作出选择，或者遇到一个说不清的问题。相关背景可能散落在前面的对话里，也可能还有一些自己觉得理所当然、没有说出来的限制。让每个人都先写出完整、精准的 prompt，并不现实。

这时，AI 可能把没理解清楚的地方自行补全，也可能沿着用户已经认定的原因继续分析。回答看起来很详细，却未必在解决用户实际遇到的事。更难察觉的是，AI 补出的解释也可能被用户接受，双方就这样围绕同一个未经检查的前提，越聊越窄。

认知视角检查器从这个问题出发。它先利用已有上下文、用户的表达方式和反复提到的重点，形成可以被纠正的初步理解，再用三项以内的关键补问补齐会影响判断的背景。随后检查用户和 AI 各自的假设，比较少量有实际差别的视角，必要时用短推演解释不同选择的后果。AI 给出理由和建议，用户保留选择与继续深入的决定权。

## 为什么从理解问题开始

例如，用户说：“团队项目总延期，我想每天加半小时站会。”如果直接设计站会，讨论已经默认了“沟通不够”是原因。先问一句“最近延期主要卡在等审批、等别人交付，还是进度发现得太晚？”，就可能改变接下来的方案。已有上下文能回答时，不必再问；用户不清楚时，也可以说明假设后给出条件方案。

理解背景之后，还要检查这份理解本身。短会可能帮助及时发现进度偏差，也可能对审批等待没有多少作用；如果每日会议是必须遵守的规则，方案又需要在这个限制内调整。比较这些视角，是为了看见它们各自的依据、收益和代价。短推演则帮助回答：采用这条路线后，哪一步可能卡住，要看什么信号才能知道需要调整。

因此，从理解问题、补齐背景，到检查预设、比较视角和解释后果，都在处理认知窄化的风险。项目希望减少两类情况：AI 没弄清问题就给方案，以及用户和 AI 一起过早锁定某种解释。用户也应能看见建议的条件和其他路线的价值，判断 AI 是否把讨论带偏。

这套流程尽量减少不必要的追问、重复分析和展开，不要求用户先学会写复杂提示词。这里的理解依据来自对话中可核对的信息；表达习惯只能作为线索，不能据此认定用户的背景、性格或隐藏动机。信息不足就保留未知。实际效果与 token 成本仍需要验证。

## 怎么用

不需要先整理一份完整的需求文档。描述你现在的想法、已有约束，以及希望得到的结果即可。第一次使用可以直接点名：

> 使用 cognitive-perspective-check。我们想给小店做个 App 提高收入，但还不清楚瓶颈。请帮我分析有哪些不同的理解，各自会怎样影响方案。

默认流程是利用已有上下文，优先问一个会改变方向的问题；信息足够时直接分析。初始澄清累计最多补问三项关键信息，通常比较两个视角。回答需要说明各条路线的依据、收益和代价，并给出建议成立的条件。

如果你已经要求一份方案、文案或计划，回答应包含能用的成果。之后可以选一条路线继续，也可以纠正 AI 的理解。已经确定的执行任务和普通问答，直接完成即可。

## 讨论的边界

用户的明确目标和约束需要保留，AI 自己补出的解释则需要接受检查。原方案有合理收益时，要把它讲清楚；证据已经充分时，也不必硬找一个反对意见。

首轮尽量保持简短，深入工作默认围绕用户选中的一个分支展开。推演用来解释条件和后果，不能把假设情节当成事实证据。这些规则约束提问、展开和阅读负担；实际推理 token 仍由客户端和模型控制。

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

Cognitive Perspective Check is an Agent Skill for early project planning, design, and decision support. Users often start with incomplete context and a tentative explanation rather than a detailed prompt. The skill uses relevant conversation context and a few consequential questions to establish a revisable understanding, then checks both user and AI assumptions. It compares perspectives with different practical consequences and uses brief, explicitly hypothetical scenarios when useful. The aim is to reduce premature cognitive narrowing throughout the discussion, while leaving goals and final choices with the user. Evaluation is ongoing; the first eight Codex runs document execution behavior, not a demonstrated improvement in decision quality or token savings.

## 反馈与许可

欢迎通过 [Issues](https://github.com/EversiusJade/cognitive-perspective-check/issues) 或 [反馈模板](https://github.com/EversiusJade/cognitive-perspective-check/issues/new?template=usage-feedback.md) 提供实际案例。给出原问题、AI 的回答，以及哪一步有帮助或造成阻碍即可；方便时再补充客户端、模型和版本。请去掉敏感信息。

项目使用 [MIT 许可证](LICENSE)。
