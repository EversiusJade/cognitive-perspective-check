# 认知视角检查器

Cognitive Perspective Check · 用来讨论项目、设计和选择的 Agent Skill

“我想给小店做个 App。”“团队总延期，要不要每天加个站会？”

很多讨论一开始就带着一个方案。目标是什么，问题卡在哪，这个方案为什么会有效，往往还没讲清。AI 顺着往下写，很快就能给出一份完整计划，最初的判断也就这样被默认了。

我做认知视角检查器，是想让 AI 先把问题看清楚：利用已有背景，问少量会改变方向的问题，把用户和 AI 各自的假设摆出来，再比较几条真正影响行动的路线。

用户不用先写一份完美的 prompt。可以带着一个模糊想法开始，也可以纠正 AI 的理解。最后得到的建议，要说清为什么这么选、适合什么条件，以及什么信息会让判断改变。

## 拿“团队总延期”举个例子

> 团队项目总延期，我想每天加半小时站会。大家已经抱怨会多，别问太多。

这是一个设计示例。这里值得先弄清的是：延期主要卡在等审批、等别人交付，还是进度偏差发现得太晚？已有对话能回答时，就直接用；需要补充时，先问这一个问题。

如果进度发现得太晚，短会可以帮助及时暴露问题；如果主要在等待审批，接下来更需要明确谁来处理阻塞。用户暂时不知道原因，也可以先得到按不同情况安排的方案。

再补一句“老板要求每天开会”，建议就要沿着这条约束调整：利用会议确认阻塞和处理人。已经讲清的背景继续沿用，讨论不用从头再来。

我希望它帮人看见这种差别：表面上都在解决延期，真正需要采取的行动可能不同。

## 怎么用

安装后，在聊天里点名调用，描述你现在的想法、已有条件和想得到的结果：

> 使用 cognitive-perspective-check。我想给小店做个 App 提高收入，但还不清楚瓶颈。帮我看看有哪些值得比较的方向。

它会先读已有上下文。信息足够就继续，缺少会影响选择的条件才补问；通常零问或一问，初始澄清累计最多三项关键信息。接着通常比较两个视角，解释各自的依据、收益和代价，再给出有条件的建议。

你可以选一条路线继续验证或推演，也可以要求当轮给出方案、文案或计划。推演会标明假设，帮助发现下一步该查什么。

已经确定的任务直接完成。比如只要一段降价公告，就写公告；普通问答也直接回答。这些收束规则在 `rc.6` 中进一步明确，避免每次都展开一轮分析。

## 安装

当前版本：`v0.2.0-rc.6`。

下载 [Skill ZIP](https://github.com/EversiusJade/cognitive-perspective-check/releases/download/v0.2.0-rc.6/cognitive-perspective-check.zip)，解压后把整个 `cognitive-perspective-check` 文件夹放进客户端的技能目录。Codex 与 Copilot 可使用 `~/.agents/skills/`，最终结构为：

```text
skills/cognitive-perspective-check/
├── SKILL.md
├── agents/
└── references/
```

安装后新建聊天，点名调用一次。其他目录、更新和卸载见 [安装说明](INSTALL.md)，其他客户端见 [兼容说明](docs/client-compatibility.md)。

## 验证与迭代

已有 [8 次 Codex 实际采集](evals/runs/2026-10-11-codex-rc4-first-batch/REPORT.md)：两个单轮场景，分别在无 Skill、简短提示、安装但不点名、点名调用四种条件下运行。回答、原生 token 用量和工具失败都保留在记录中。

这些记录用于检查触发和执行情况。独立人工评分尚未完成，多视角分析对判断质量的影响还需后续对照。`rc.6` 根据 [Issue #1](https://github.com/EversiusJade/cognitive-perspective-check/issues/1) 补充了已确定任务的停止条件，客户端复测待完成。

实验方法见 [对照方案](evals/experiment/README.md)，历史记录见 [早期验证](evals/validation.md)。

## 从框架到资料查证

这个 Skill 负责理清问题、检查预设和比较视角。需要实际搜索资料时，我把这套流程接进了另一个项目：[观照 · 多视角调研](https://github.com/EversiusJade/guanzhao-research)。观照调用搜索和正文读取工具，把网页出处及资料对选择的参考价值整理进报告。

## 文档与反馈

- [更多例子](docs/examples.md)：补充背景、纠正理解，再推进到成果。
- [设计取舍](docs/design-decisions.md)：为什么限制追问，怎样保留用户的目标和选择。
- [研究目的](docs/research-purpose.md)与[相关项目](docs/comparison.md)：问题定义和对照思路。

核心规则在 `skills/cognitive-perspective-check/SKILL.md`，深入工作放在 `references/deepen.md`。

如果它问多了、忽略了条件，或者某个视角帮你看到了新的选择，欢迎在 [Issues](https://github.com/EversiusJade/cognitive-perspective-check/issues) 留下原问题和回答，去掉私人信息即可。

## English overview

Cognitive Perspective Check is an Agent Skill for discussing projects, designs, and decisions. It uses the context already available, asks a few consequential questions, and checks assumptions on both sides before comparing practical alternatives. Suggestions explain when they apply and what would change them. Settled tasks are completed directly.

## License

[MIT](LICENSE)。
