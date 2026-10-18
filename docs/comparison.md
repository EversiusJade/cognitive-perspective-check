# 与相关项目的比较

批判性思考、苏格拉底式提问、多视角分析和问题重构已有不少实践。本项目借用相近方法，在一次简短的项目或决策讨论中理解背景、检查双方预设、比较行动与取舍，再按用户的选择继续。

下面依据 2026-10-11 核对的公开说明和核心文件比较设计。未运行这些项目，也未用星数判断质量。

| 相关项目 | 相近之处 | 组织方式 | 本项目的选择 |
|---|---|---|---|
| [agent-thinking-skills](https://github.com/mlevison/agent-thinking-skills) | 用户参与、检查 AI 输出、批判性思考 | 系统思考、批判性思考和冲突分析等各有技能，逐问引导 | 在一个流程里给出初步判断，限制累计补问，再交付用户选中的成果 |
| [thinking-socratic](https://github.com/tjboudreaux/cc-thinking-skills/blob/main/skills/thinking-socratic/SKILL.md) | 少问关键问题、检查假设、及时停止，重叠较多 | 实施前补齐影响决定的要求和假设 | 进一步说明不同理解怎样改变行动和取舍，保留原路线的价值 |
| [concept-fan](https://github.com/danium/lateral-thinking/blob/main/skills/concept-fan/SKILL.md) | 从指定解法回到目的，寻找其他路线 | 展开目的、概念与具体实现 | 只保留影响本次判断的少量视角 |
| [inversion](https://github.com/danium/lateral-thinking/blob/main/skills/inversion/SKILL.md) | 挑战前提、检查反例 | 翻转假设，筛选可成立的情境 | 将反转作为检查方法之一，随后说明依据和取舍 |
| [problem-framing-canvas](https://github.com/deanpeters/Product-Manager-Skills/blob/main/skills/problem-framing-canvas/SKILL.md) | 问题定义、背景和假设 | 使用较完整的产品发现画布 | 从短对话进入，按当前选择决定需要哪些维度 |

## 本项目想保留什么

用户可以从不完整的想法开始，不必先写好详细提示词。少量补问帮助双方形成可纠正的理解，AI 也要检查自己的解释，避免只顺着用户的预设展开。

比较视角要说清行动会怎样改变：原路线何时值得保留，另一条路线有什么收益，AI 在什么条件下偏向哪一条。后续验证、比较、推演或制作成果，都要沿用已确认的背景。

本项目选择把这些做法放在一起。少问、检查 AI 和及时停止已有相近方法，不能各自当作原创能力。

## 还需要积累什么

流程和措辞容易复制，实际失败案例、可复核的评估记录、维护和安装体验更值得积累。强模型本身可能已能做好这些事，只有在相同输入和配置下比较，才能判断 skill 增加了什么。

目前的 [8 次 Codex 采集](../evals/runs/2026-10-11-codex-rc4-first-batch/REPORT.md) 只覆盖两个单轮交付场景，基线已能完成任务，尚未证明探索性决策的收益。自动触发、误触发、连续讨论和真实用户选择仍需观察。正文短也未必减少后台推理，成本要同时看用量、时延、阅读负担和回合数。

项目继续用于早期项目、设计与决策讨论。专业领域的结论仍需相应方法和可靠证据。
