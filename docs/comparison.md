# 差异化假设与竞争边界

本项目没有声称发明批判性思考、苏格拉底式提问、多视角或问题重构。以下比较基于相关项目的公开说明和技能内容，不以星数判断质量，也不声称已跑过竞品。

当前 `0.2.0-rc.4` 的研究对象是连续的早期项目与决策工作流：理解背景和规则，识别核心问题，检验双方预设，比较视角、证据与取舍，给出条件判断，由用户选择深入。背景理解是其中的基础环节；完整目的见 [研究目的](research-purpose.md)。

| 项目 / 能力 | 与我们重叠 | 主体组织方式 | 本项目选择的具体边界 |
|---|---|---|---|
| [agent-thinking-skills](https://github.com/mlevison/agent-thinking-skills) | 用户参与、批判性思考、避免顺从、检查 AI 输出 | 系统思考、批判性思考、GenAI 输出检查、冲突分析分立技能；逐问引导 | 在同一有限流程内连接背景理解、视角比较与条件判断；初始澄清有累计限额，A 先交付可用判断，选择后交付所选成果 |
| [thinking-socratic](https://github.com/tjboudreaux/cc-thinking-skills/blob/main/skills/thinking-socratic/SKILL.md) | 模糊请求、承重问题、少问、及时停止，重叠很强 | 在实施前补齐会改变决定的要求和假设 | 理解背景后继续分析核心问题，展示视角怎样改变行动与取舍；检验双方预设，保留原路线利益并给条件偏向 |
| [concept-fan](https://github.com/danium/lateral-thinking/blob/main/skills/concept-fan/SKILL.md) | 从指定方案回到目的，产生不同路线 | 向上寻找目的、展开概念与具体实现 | 只保留改变本次判断的框架；不做多层创意树 |
| [inversion](https://github.com/danium/lateral-thinking/blob/main/skills/inversion/SKILL.md) | 挑战前提、避免假反例 | 翻转若干假设、筛选可成立情境 | 在背景理解基础上进行一次有限校准；反转是假设检查的一种工具，随后仍需证据、取舍与条件判断 |
| [problem-framing-canvas](https://github.com/deanpeters/Product-Manager-Skills/blob/main/skills/problem-framing-canvas/SKILL.md) | 问题定义、背景、利益相关者和假设 | 较完整的产品发现画布 | 短对话入口，按本次判断选择维度；背景清楚但有视角遗漏仍可分析，已选定执行则直接交付 |

## 我们的可检验主张

2026-10-11 再次核对了上述 [agent-thinking-skills README](https://github.com/mlevison/agent-thinking-skills/blob/main/README.md) 与 [thinking-socratic 核心文件](https://github.com/tjboudreaux/cc-thinking-skills/blob/main/skills/thinking-socratic/SKILL.md)：检查 AI、少量关键提问、执行阶段不重开讨论均有相近实践。我们的辨识度是固定目标下的有限连续流程与成果要求，不能把这些单项能力宣传成独创。

1. 用户无需先准备完整提示词，也能得到保留明确目标、可修正的工作理解；每个补问都能改变判断或行动。
2. 通常两个、最多三个视角有实际行动差别，并检查用户与 AI 的假设；用户能看见原路线何时仍有价值。
3. 选项比较有可追溯的支持或明确未知，AI 偏向说明优先级、假设和改变条件；无法排序时承认缺口，给出有区分能力的下一步。
4. 从初步分析到用户选中的验证、比较、推演或具体成果保持连续；推演不充当证据，用户要求的产物不被流程模板挤掉，达到停止条件便结束。

这些主张是设计目标，竞争优势尚待验证。强模型本身也可能表现良好，只有在相同条件下与无 skill、旧版本及直接相关竞品对照，才能判断附加价值。已有 `0.2.0-rc.1` 小样本记录是历史证据，未验证本轮完整主张。

## 目前容易被复制、仍需提高的部分

- 工作流组合和措辞本身容易被复制。可积累的能力是真实失败案例、透明验证、维护和简单安装。
- 自动触发由宿主控制，描述写得好也不能保证。误触发和漏触发应分别记录。
- 小样本输出好看不证明用户决策更好。需要问用户是否更理解问题、是否更容易选择，并观察后续行动。
- 成本优势需要真实 token、时延、用户阅读和回合记录；正文缩短不等于后台推理减少。
- 更专业的领域判断由相应技能和可靠证据完成；本项目维持早期项目、设计与决策讨论的有限范围。
