# 对照实验设计方案（v0.2.0 行为效果验证）

> 目的：验证 cognitive-perspective-check 的**相对增益**，而非规则符合性。
> 现有 validation.md 已证明"规则被遵守"；本方案回答"比没有 skill 时好多少、值不值"。
> 版本绑定：本方案针对 0.2.0-rc.4，实验时需记录实际 skill 版本 SHA。

## 1. 研究问题

| 编号 | 问题 | 对应 README 声明 |
|---|---|---|
| RQ1 | 有 skill 的回答，在"视角实质性差异、条件建议、假设分离"上是否优于无 skill 基线？ | "减少认知窄化" |
| RQ2 | skill 的成本约束（提问 ≤3、视角 2–3、首轮一屏）在真实对话中是否被遵守？ | "范围与成本" |
| RQ3 | 不点名时，skill 的自然触发率与误触发率是多少？ | "隐式调用" |
| RQ4 | 增益是否覆盖额外 token 成本？ | "有限成本" |

## 2. 实验设计

### 2.1 条件矩阵（被试内设计，场景内配对比较）

| 条件 | skill 状态 | 提示词 | 测量内容 |
|---|---|---|---|
| C0 基线 | 不安装 | 原始场景 prompt | RQ1 的对照组 |
| C1 自然 | 已安装，不点名 | 原始场景 prompt | RQ3 触发率/误触发率 + RQ1 |
| C2 点名 | 已安装，点名调用 | "使用 cognitive-perspective-check……" + 场景 prompt | RQ1/RQ2 的效果上限 |

- **场景**：从 evals.json 的 12 个中选 8 个，覆盖四类：
  - 模糊目标类：`solution-first-vague-context`、`messy-context-reconstruction`、`rough-need-time-constraint`
  - 预设偏差类：`user-causal-claim-as-hypothesis`、`assistant-self-anchoring`
  - 用户控制类：`user-selects-deeper-path`、`chosen-pilot-simulation`
  - 不应触发类（负样本）：`simple-task-no-calibration`、`plain-chat-no-calibration`
- **模型**：至少 2 个（如 Copilot 一个模型 + Codex 一个模型），避免单模型结论。
- **重复**：每 cell 跑 3 次取分布（temperature 不可控时必须重复采样）。
- **规模**：8 场景 × 2 模型 × 3 条件 × 3 次 = 144 runs。可先跑 4 场景 × 1 模型 × 3 条件 × 3 次 = 36 runs 的 pilot，确认流程可行后补全。

### 2.2 运行规范

1. 固定提示词快照，存 `evals/experiment/inputs.json`（从 evals.json 抽取，不得临场改写）。
2. 每个 run 记录元数据：模型、客户端、时间、skill 版本 SHA、条件标签。
3. 原始回答原样保存到 `evals/experiment/runs/<condition>/<scenario>_<model>_<n>.md`，评分后不得修改原文。
4. C1 条件必须新开对话，避免前一轮点名造成残留触发。

## 3. 评分量表（量化，先建后跑）

每条回答按以下维度打分（存 `evals/experiment/rubric.json`）：

| 维度 | 取值 | 判定标准（锚点） |
|---|---|---|
| n_questions | 整数 | 向用户提出的问题数；>3 记违规 |
| n_perspectives | 整数 | 实际对照的视角数；不在 2–3 记违规 |
| substantive_diff | 0/1 | 替代视角是否改变第一步或成功标准（只换措辞不换行动 = 0） |
| conditional_advice | 0/1 | 建议是否标注成立条件与"什么信息会改变建议" |
| assumption_split | 0/1 | 是否区分事实 / 推断 / 价值偏好 |
| user_choice | 0/1 | 是否把下一步选择权交给用户，而非直接展开 |
| deliverable_intact | 0/1 | 仅交付物类场景：原始请求是否当轮满足 |
| invented_facts | 0/1 违规 | 是否编造数据（如虚构转化率、注册率） |
| length_chars | 整数 | 首轮输出字数 |
| tokens | 整数 | 客户端可查则记录（RQ4 用） |

负样本场景（simple-task / plain-chat）单独判定：**出现流程特征即为误触发**，计入误触发率。

### 3.1 评审方式

- **双人独立评分**：作者 + 1 名独立评审；先共同校准 4 条样例，再独立评完全部。
- **匿名化**：评分前将条件标签（C0/C1/C2）替换为随机编号，评审不知道哪条有 skill。
- **一致性**：报告两人一致率；分歧条目第三方仲裁或讨论定稿。
- **不建议用 AI 当唯一评委**：评委若为大模型，与 skill 同为提示词工程，存在循环论证；如用作辅助标注，需在结果中披露。

## 4. 预注册判定标准（跑之前写死，防事后搬球门柱）

| 假设 | 判定标准 | 不满足时动作 |
|---|---|---|
| H1 视角增益 | C2 的 substantive_diff=1 比例比 C0 高 ≥30 个百分点（或相对 ≥2 倍） | 修改 SKILL.md 视角段或下调 README 声明 |
| H2 成本合规 | C2 的 n_questions ≤3 且 n_perspectives ∈ [2,3] 合规率 ≥80% | 收紧 SKILL.md 数字约束 |
| H3 自然触发 | C1 在正样本场景中行为标记触发率 ≥50%，负样本误触发率 ≤20% | 改 openai.yaml 描述与触发词，或接受"需点名"并改写 README |
| H4 成本可接受 | C2 平均 tokens ≤ C0 的 1.5 倍 | 在 README 成本段如实标注实测倍数 |

行为标记触发判定（客户端不报告触发状态时）：一条回答同时满足 conditional_advice=1 且 user_choice=1 记为"已触发"。此定义需双人标注并报告一致性。

## 5. 自然调用率的补充测量

C1 的触发判定是代理指标，需配合：

1. **行为标记法**（如上）——主指标；
2. **显式声明**：若模型自述"我将使用 cognitive-perspective-check"，单独计数（声明但未按流程执行不算触发）；
3. 报告中区分三种结果：正确触发 / 未触发（按无 skill 行为回答）/ 误触发。

## 6. 结果呈现

- 数据表：`evals/experiment/results.csv`（每行一个 run 的维度得分）。
- 报告文档：`evals/experiment/REPORT.md`，包含：
  - 每场景 × 条件的得分矩阵（表格，与 validation.md 风格一致）；
  - 判定标准逐条对照（H1–H4 达成/未达成）；
  - 典型成功/失败回答各引 2 条原文；
  - 与 rc.1 验证记录的关系说明（本实验测增益，rc.1 记录测合规，互不替代）。
- README 的"验证边界"段按实验结果更新：达成 H1 则可写"在小规模对照中观察到视角差异增益"；未达成则维持现有保守表述。

## 7. 已知局限（写入报告）

- 场景由作者设计，存在方向性偏差；场景集公开，模型训练数据可能见过。
- 结果绑定特定模型版本与客户端，换模型需重跑。
- 行为标记是触发状态的代理指标，真实触发取决于客户端实现。
- 36–144 runs 属小规模探索，结论限于"方向性证据"，不构成统计显著性证明。

## 8. 执行清单

- [ ] 从 evals.json 抽取 8 场景 → inputs.json（含 2 个负样本）
- [ ] 编写 rubric.json 与评分锚点示例
- [ ] 找 1 名独立评审，完成 4 条样例校准
- [ ] pilot：4 场景 × 1 模型 × 3 条件 × 3 次
- [ ] 评审 + 一致率统计
- [ ] 对照预注册标准，决定是否补全到 144 runs
- [ ] 更新 validation.md 与 README 验证边界段
- [ ] 把 rc.4 已发现的"推演偏乐观"转成 evals.json 可判定期望，防回归
