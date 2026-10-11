# 认知视角检查器 · Cognitive Perspective Check

[English overview](#english-overview) · [项目与研究目的](docs/research-purpose.md) · [下载与安装](#安装与首次使用)

**面向早期项目、设计与决策，以减少用户和 AI 的认知窄化为目标：理解关键背景，检查双方预设，对照少量有实际差别的视角，形成有依据的选择。**

项目或决策在早期往往较抽象，背景、规则和内部关系也未完整表达。用户可能过早锁定一种原因或方案，AI 也可能把自己的初步理解当成结论。本 skill 将理解、分析、视角比较和条件建议连接为一次有限流程，帮助双方看见当前判断遗漏了什么，以及不同理解会怎样改变行动。

理解背景是判断的基础。skill 只补问会改变判断的关键内容，不要求完整需求文档，也不推断用户未表达的“真实动机”。用户保留目标、约束和最终选择权。

## 设计重点

- **少量关键补问。** 从抽象描述中提取背景、规则与内部逻辑，只追问会改变判断的信息，降低用户整理完整 prompt 的负担。
- **视角必须影响选择。** 比较能够改变行动、成功标准或取舍的视角，同时呈现原路线的合理利益，避免换几个方案却沿用同一预设。
- **建议有依据，也可修正。** 同时检查用户和 AI 的假设，区分事实、推断和价值偏好；说明建议偏向、成立条件与改变建议的依据。
- **深入由用户决定。** 首轮给出有限但可用的判断，随后只验证、比较或推演所选分支，让用户控制分析方向和阅读成本。

> 当前版本：`0.2.0-rc.4`，为入口精简与使用边界修订候选版。[本轮使用走查](docs/reviews/v0.2.0-rc.4-use-review.md) 记录静态修订依据，未新增模型行为实验。[已有验证记录](evals/validation.md) 仅对应 `0.2.0-rc.1`，不能证明本版效果。

## 安装与首次使用

候选版 `v0.2.0-rc.4` 下载入口：

- [Windows 便捷安装包](https://github.com/EversiusJade/cognitive-perspective-check/releases/download/v0.2.0-rc.4/cognitive-perspective-check-v0.2.0-rc.4-windows.zip)
- [纯 Skill 包：手动安装](https://github.com/EversiusJade/cognitive-perspective-check/releases/download/v0.2.0-rc.4/cognitive-perspective-check.zip)
- [版本说明与校验文件](https://github.com/EversiusJade/cognitive-perspective-check/releases/tag/v0.2.0-rc.4)

也可下载 [完整仓库源码 ZIP](https://github.com/EversiusJade/cognitive-perspective-check/archive/refs/heads/main.zip)。完整解压后，打开包含 `README.md` 和安装入口的文件夹。

**Windows / GitHub Copilot：**下载完整安装包并解压，双击 `install-copilot.cmd`。脚本将 skill 复制到当前用户的 `.copilot/skills`，无需管理员权限、Python、Node 或额外账号。之后新建一轮聊天，输入：

> 使用 cognitive-perspective-check。我们想给小店做一个 App 提高收入，但还没有确定瓶颈。请先理解关键背景，比较可能改变行动的视角，并给出简短的条件建议。

**Codex 与 Copilot 共用：**双击 `install-shared.cmd`，安装到当前用户的 `.agents/skills`。同名 skill 安装到一个客户端读取的多个位置会产生重复，选一种位置即可。

也可以直接复制 `skills/cognitive-perspective-check` 整个文件夹。macOS、Linux、项目级安装、更新和排查见 [安装说明](INSTALL.md)。客户端需支持 Agent Skills；目录和行为依据 [GitHub 官方说明](https://docs.github.com/en/copilot/how-tos/copilot-on-github/customize-copilot/customize-cloud-agent/add-skills) 与 [OpenAI 官方说明](https://learn.chatgpt.com/docs/build-skills)。

配置允许 Codex 隐式调用；文件发现与实际选择仍取决于客户端的支持、配置和模型。首次检查请明确点名，再尝试不点名的自然表达。安装成功只证明文件就位，自动调用仍需在实际客户端观察。

**可选：通过 skills CLI 安装。** 已有 Node.js / npm 时，可运行以下命令，并按提示选择目标客户端和一种安装位置：

```sh
npx skills add EversiusJade/cognitive-perspective-check --skill cognitive-perspective-check
```

该命令依据 [官方 CLI 文档](https://github.com/vercel-labs/skills/blob/main/README.md) 提供，本轮未执行安装验证。CLI 的匿名安装遥测是 [skills.sh 目录](https://www.skills.sh/docs/faq) 的发现入口；用户可选择退出遥测。公开仓库或下载 ZIP 本身不等于已收录，本项目当前不声称已进入该目录。

## 一次连续的判断流程

1. **理解关键背景与内部逻辑。** 从已有信息识别目标、规则、约束和影响决策的关系；信息不足时，用少量简明问题补齐会改变方向的内容。
2. **识别核心问题并分析。** 明确当前需要判断什么，检查用户的预设与 AI 的初步理解，区分观察、解释和价值选择。
3. **对照少量有实际差别的视角。** 通常保留当前视角与一个替代视角，说明各自的证据、收益、代价，以及第一步或成功标准会怎样改变。
4. **解释有条件的后果。** 必要时用有限的假设或情景说明：关键条件成立或不成立，会怎样影响选择。推演用于理解后果和找出待查事实；情景合理不等于现实中会发生。
5. **形成选择与条件建议。** 根据现有证据比较选项；AI 说明自己在什么优先级和假设下偏向哪条路线，以及什么信息会改变这项建议。
6. **由用户选择继续的范围。** 用户可以验证关键假设、比较路线、推演一个试点、纠正理解或停止。默认只深入一个分支；用户明确要求组合或更广覆盖时，遵守已选范围和预算。

第一轮交付称为 **A：有限判断与选择**；用户选择后的继续工作称为 **B：所选分支的深入**。A 应提供可用判断，不停留在提问。简短的条件后果可直接支持 A；完整情景推演只在任务需要或用户选择时展开。A/B 是文档中的流程标记，实际回答按用户所需格式呈现。

## 用户实际得到什么

- **第一次讨论：**可以修正的工作理解，真正改变行动的少量视角，关键论据的来源或未知，以及成立条件明确的建议。依据不足时不硬排最佳路线，而是说明什么信息能帮助选择。
- **已要求具体成果：**尽可能当轮给出可用的方案、文案或计划，将必要的视角检查融入成果。用户选择继续后，直接制作所选范围内的成果；交接摘要仅用于确实需要转交时。
- **所选深入：**验证分支交付观察与判断更新，或可执行的检查和结果分支；路线比较交付影响选择的取舍；推演交付条件后果、失败信号与待查事实。

比较始终服务用户已明确的目标与约束。改变目标或优先级要作为提议说明，不能由 AI 暗中替换。少量视角是按当前背景选择的有限覆盖，不代表穷尽；只有可能改变建议的遗漏才需提醒。新背景使旧视角失效时，修正或替换相关部分。交付成果前按目标、约束和格式做一次简短检查，并区分提出的动作与已经完成的工作。

流程完成看用户能否理解取舍、作出下一步选择或使用成果，不看列了多少问题和视角。

例如，“给小店做 App 提高收入”已经给出目标与一种手段。若关键瓶颈未知，skill 可以先补问最影响选择的信息，或明确假设后比较拉新与复购两种理解。两者可能改变投入方向，也可能保留 App 的价值。AI 应说明证据和适用条件，由用户选择后续验证或试点。

详细研究目的见 [research-purpose.md](docs/research-purpose.md)；完整对话与边界演示见 [examples.md](docs/examples.md)。演示用于说明预期行为，不是效果验证。

## 范围与成本

- 适用于早期项目构思、设计方向和未定决策；背景清楚时，仍可检查会实质改变判断的视角差异。
- 通常不提问或只问一个；初始对齐累计最多三个关键问题，不按每轮重新计算，也不把长问卷算作一问。达到限额仍缺信息时，收窄结论并说明限制。
- 默认通常比较两个视角，总计最多三个；维度随问题选择，不套用通用清单，也不制造对立。
- 第一轮进行一次有限检查，优先保持一短屏可读；之后默认只深入用户选中的一个 B 分支。明确要求更广分析时，依照已授权范围和预算展开。
- 明确的事实问题和已确定的执行任务直接完成；存在实质不匹配时才作简短提醒。
- 不因运行本流程而自动搜索、组织多代理讨论或反复自我辩论；关键事实或用户选定任务需要时再使用工具。

这些是行为和阅读成本约束。skill 无法独立限制模型后台推理 token，也不能保证节省比例；实际预算由宿主和模型设置控制。

## 研究目的与验证边界

本项目研究的是：**关键背景理解 → 核心问题分析 → 少量视角与条件后果 → 证据和取舍比较 → 用户选择深入** 这一连续流程，能否在有限成本内帮助用户和 AI 减少过早收窄判断。提问、批判性思考和多视角分析已有大量相关实践，项目价值需要通过真实使用及对照验证。

[设计取舍](docs/design-decisions.md) 记录采用、拒绝和保留的方案；[对照说明](docs/comparison.md) 列出与相关项目的重叠和边界。差异化在于保留目标、有限视角比较与用户选定成果的连续组合；少问、检查 AI 和及时停止各自已有相近方法。[验证记录](evals/validation.md) 保留 `0.2.0-rc.1` 历史结果；本版尚未证明自然调用率、相对增益、token 节省或长期用户效果。

[诊断实验方案与运行模板](evals/experiment/README.md) 已准备，包含四条件对照、48 槽位 pilot 与后续诊断扩展；实验尚未运行，目前没有本方案的相对增益、真实加载率或成本结果。

## English overview

**Cognitive Perspective Check** is an Agent Skill for critical thinking and decision support in early project planning and design. It aims to reduce premature cognitive narrowing by understanding pivotal context, checking both user and AI assumptions, and comparing a few alternative perspectives that materially change the decision. It uses few consequential clarification questions, presents evidence and tradeoffs, and offers a conditional recommendation with explicit assumptions. The user chooses whether to validate a premise, compare options, or explore a bounded scenario. Context understanding supports the whole process; it does not stop at requirements clarification.

## 仓库内容

```text
skills/cognitive-perspective-check/
  SKILL.md                 核心入口
  agents/openai.yaml       Codex 展示与隐式调用元数据
  references/deepen.md     仅深入用户选中分支时读取
install.ps1                Windows 本地安装程序
install-copilot.cmd         Copilot 安装入口
install-shared.cmd          共用目录安装入口
INSTALL.md                 手动安装、更新、卸载和排查
docs/                      研究目的、演示、设计取舍、对照
evals/                     行为场景与历史验证记录
  experiment/              四条件诊断方案、输入、量表与运行模板（尚未运行）
tests/                     不依赖 Pester 的安装检查
LICENSE                    MIT
```

## 反馈

通过 [使用反馈模板](https://github.com/EversiusJade/cognitive-perspective-check/issues/new?template=usage-feedback.md) 提交实际案例，或直接打开 [GitHub Issues](https://github.com/EversiusJade/cognitive-perspective-check/issues)。最少提供原问题、AI 回答及哪里有帮助或阻碍，其余内容可留空。

方便时可补充相关上下文、客户端/模型、版本、是否明确调用和希望改变的行为。特别欢迎报告理解偏差、反复确认、擅自改目标、视角没有实际差别、把推演当作证据，以及用户选择后仍展开其他分支。不要提交敏感信息。

## 许可

[MIT](LICENSE)。版权声明使用项目贡献者名称，发布者可以补充自己的署名。
