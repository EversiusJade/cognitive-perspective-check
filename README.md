# 认知视角检查器

Cognitive Perspective Check · 面向早期项目、设计与决策的 Agent Skill

“我想给小店做个 App。”“团队总延期，要不要每天加个站会？”

很多人问 AI 时，已经带着一个方案。背景还没讲清，原因也没确认，AI 就顺着写出了一份计划。用户的猜测，加上 AI 的猜测，很快就变成了共同的前提。

我做这个 Skill，是想让 AI 别急着顺着我的话给方案。先用已有上下文理解问题，只问会改变方向的少数信息，再检查双方的假设，比较真正影响行动的视角。目的是减少用户和 AI 的认知窄化。

不用先写好一份完美的 prompt。带着模糊想法也能开始，发现 AI 理解错了就纠正它。给出的建议需要说明依据、适用条件，以及什么信息会让判断改变。

## 比如，团队总延期

> 团队项目总延期，我想每天加半小时站会。大家已经抱怨会多，别问太多。

这里先问一个问题：延期主要卡在等审批、等别人交付，还是进度偏差发现得太晚？已有对话能回答，就不用再问。

发现偏差太晚，短会可能有帮助；总在等审批，更需要有人处理阻塞。暂时不知道原因，也可以先拿到按不同情况安排的方案。

如果再补一句“老板要求每天开会”，就沿用这个约束，把会议用来确认阻塞和处理人。已经说清的背景继续用，讨论不用重来。

这是设计示例，用来说明不同理解怎样改变第一步。

## 怎么用

安装后，在聊天里点名，直接说想法、已有条件和想要的结果：

> 使用 cognitive-perspective-check。我想给小店做个 App 提高收入，但还不清楚瓶颈。帮我看看有哪些值得比较的方向。

它先读上下文。缺少影响选择的信息才补问，通常零问或一问，初始澄清累计最多三项。接着通常比较两个视角，说明依据、收益和代价，给出有条件的建议。

你可以选一条路线继续查证或推演，也可以当轮要求方案、文案或计划。推演会标明假设，帮助找出接下来要查的事。

交付前做一次简短 review：是否偏离目标，视角是否改变行动，猜测有没有被写成事实，建议有没有依据。发现问题直接修正，无需额外一轮问答或一份审阅报告。

已经确定的任务直接完成。只要降价公告，就写公告。能暂定的细节先标明假设；缺原文、关键约束等必要信息，才补问那个缺口。普通问答直接回答。

## 安装

当前版本：[v0.2.0-rc.9](https://github.com/EversiusJade/cognitive-perspective-check/releases/tag/v0.2.0-rc.9)。

下载 [Skill ZIP](https://github.com/EversiusJade/cognitive-perspective-check/releases/download/v0.2.0-rc.9/cognitive-perspective-check.zip)，解压，把整个 `cognitive-perspective-check` 文件夹放进客户端的技能目录。Codex 与 Copilot 可使用 `~/.agents/skills/`：

```text
skills/cognitive-perspective-check/
├── SKILL.md
├── agents/
└── references/
```

新建聊天，点名调用一次。其他目录、更新和卸载见 [安装说明](INSTALL.md)，其他客户端见 [兼容说明](docs/client-compatibility.md)。

## 做到了哪里

已有 [8 次 Codex 采集](evals/runs/2026-10-11-codex-rc4-first-batch/REPORT.md)：两个单轮场景，各跑无 Skill、简短提示、安装但不点名、点名调用四种条件。原始回答、token 用量和工具失败记录都在。

计划是 48 次对照采集，目前完成 8 次，还差 40 次。

最先测的是两个短文本任务，默认模型已经能完成。点名调用时多出了使用说明，其中一次还遇到文件读取失败。这些记录能看到触发和执行中出了什么问题，但还说明不了它在早期项目、设计与决策中的帮助。接下来要按计划补齐开放决策场景，独立人工评分也还没完成。

- `rc.6` 根据 [Issue #1](https://github.com/EversiusJade/cognitive-perspective-check/issues/1) 明确已确定任务的停止条件，客户端复测待完成。
- `rc.7` 增加交付前 review。
- `rc.8` 明确执行任务与关键缺口的区别，限制复合追问，补充已有投入和切换成本。
- `rc.9` 只整理措辞，保留原有规则。

rc.7 以来做了规则和文档审阅，没有新增模型效果或 token 成本实验。[对照方案](evals/experiment/README.md)和[早期验证](evals/validation.md)分别记录方法与历史结果。

## 需要查资料时

这个 Skill 用来理解问题、检查预设和比较视角。我把它接进了另一个项目：[观照 · 多视角调研](https://github.com/EversiusJade/guanzhao-research)。观照调用搜索和正文读取工具，在报告里整理网页出处，以及资料对选择的参考价值。

## 文档和反馈

[更多例子](docs/examples.md) · [设计取舍](docs/design-decisions.md) · [研究目的](docs/research-purpose.md) · [相关项目](docs/comparison.md)

核心规则在 `skills/cognitive-perspective-check/SKILL.md`，深入指导在 `references/deepen.md`。

它问多了、忽略条件，或者某个视角帮你看见了新选择，都可以在 [Issues](https://github.com/EversiusJade/cognitive-perspective-check/issues) 留下原问题和回答。去掉私人信息即可。

## English overview

Cognitive Perspective Check helps with early project, design, and decision discussions. It uses existing context, asks a few consequential questions, checks user and AI assumptions, and compares practical alternatives. Suggestions state their evidence, conditions, and what would change them. Settled tasks are completed directly.

## License

[MIT](LICENSE)。
