# 差异化假设与竞争边界

本项目没有声称发明批判性思考、苏格拉底式提问、多视角或问题重构。以下比较基于相关项目的公开说明和技能内容，不以星数判断质量，也不声称已跑过竞品。

| 项目 / 能力 | 与我们重叠 | 主体组织方式 | 本项目选择的具体边界 |
|---|---|---|---|
| [agent-thinking-skills](https://github.com/mlevison/agent-thinking-skills) | 用户参与、批判性思考、避免顺从 | 批判性思考、系统思考、冲突分析等分立技能；逐问引导 | 初始澄清累计限额，A 必须先交付可用判断；不用完整教学访谈 |
| [thinking-socratic](https://github.com/tjboudreaux/cc-thinking-skills/blob/main/skills/thinking-socratic/SKILL.md) | 模糊请求、承重问题、少问、及时停止，重叠很强 | 在实施前补齐会改变决定的要求和假设 | 在澄清之后展示“换框架改变什么”，保留原路线收益、给条件偏向，并由用户选深入 |
| [concept-fan](https://github.com/danium/lateral-thinking/blob/main/skills/concept-fan/SKILL.md) | 从指定方案回到目的，产生不同路线 | 向上寻找目的、展开概念与具体实现 | 只保留改变本次判断的框架；不做多层创意树 |
| [inversion](https://github.com/danium/lateral-thinking/blob/main/skills/inversion/SKILL.md) | 挑战前提、避免假反例 | 翻转若干假设、筛选可成立情境 | 在用户背景理解后进行一次有限校准；不把反转假设作为默认入口 |
| [problem-framing-canvas](https://github.com/deanpeters/Product-Manager-Skills/blob/main/skills/problem-framing-canvas/SKILL.md) | 问题定义、背景、利益相关者和假设 | 较完整的产品发现画布 | 短对话入口，按方向影响选维度；已有明确需求则直接交付 |

## 我们的可检验主张

1. 用户无需先准备完整提示词，也能得到准确、可修正的工作理解。
2. 每个补问都有方向价值，不会演变成无限访谈。
3. 替代框架有可观察的行动差别，且用户知道原方案什么条件下仍有价值。
4. 用户选中路径后，AI 能保持范围并给出有限的验证、比较或推演。

这些主张是设计目标，竞争优势尚待验证。强模型本身也可能表现良好，只有在相同条件下与无 skill、旧版本及直接相关竞品对照，才能判断附加价值。

## 目前容易被复制、仍需提高的部分

- 工作流组合和措辞本身容易被复制。可积累的能力是真实失败案例、透明验证、维护和简单安装。
- 自动触发由宿主控制，描述写得好也不能保证。误触发和漏触发应分别记录。
- 小样本输出好看不证明用户决策更好。需要问用户是否更理解问题、是否更容易选择，并观察后续行动。
- 成本优势需要真实 token、时延、用户阅读和回合记录；正文缩短不等于后台推理减少。
- 更专业的领域判断由相应技能和可靠证据完成；本项目维持前期校准边界。
