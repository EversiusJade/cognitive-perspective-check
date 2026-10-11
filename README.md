# 问题框架校准器 · Cognitive Perspective Check

**把模糊、带预设的早期需求，变成用户能理解、能选择、能开始验证的问题。**

AI 先提炼你想解决的事，只补问会改变方向的少数信息，再解释不同问题框架会怎样改变方案，给出有条件的建议。你决定是否继续、验证哪个假设或推演哪条路径。

适合早期项目构思、需求讨论、方案和设计方向选择。重点是还没决定该怎么做、但问题表达已经偏向某一种解法的阶段。

> 当前版本：`0.2.0-rc.1`。这是可安装的候选版本。格式、安装和小样本行为验证的具体结果见 [验证记录](evals/validation.md)。尚无长期真实用户数据，也不保证每个客户端都会自动调用。

## 安装与首次使用

下载候选版 `v0.2.0-rc.1`：

- [Windows 便捷安装包](https://github.com/EversiusJade/cognitive-perspective-check/releases/download/v0.2.0-rc.1/cognitive-perspective-check-v0.2.0-rc.1-windows.zip)
- [纯 Skill 包：手动安装](https://github.com/EversiusJade/cognitive-perspective-check/releases/download/v0.2.0-rc.1/cognitive-perspective-check.zip)
- [版本说明与校验文件](https://github.com/EversiusJade/cognitive-perspective-check/releases/tag/v0.2.0-rc.1)

也可下载 [完整仓库源码 ZIP](https://github.com/EversiusJade/cognitive-perspective-check/archive/refs/heads/main.zip)。完整解压后，打开包含 `README.md` 和安装入口的文件夹。

**Windows / GitHub Copilot：**下载完整安装包并解压，双击 `install-copilot.cmd`。脚本将 skill 复制到当前用户的 `.copilot/skills`，无需管理员权限、Python、Node 或额外账号。之后新建一轮聊天，输入：

> 使用 cognitive-perspective-check。我们想给小店做一个 App 提高收入，但现在还没想清楚该怎么做。先帮我校准问题，简短一点。

**Codex 与 Copilot 共用：**双击 `install-shared.cmd`，安装到当前用户的 `.agents/skills`。同名 skill 安装到一个客户端读取的多个位置会产生重复，选一种位置即可。

也可以直接复制 `skills/cognitive-perspective-check` 整个文件夹。macOS、Linux、项目级安装、更新和排查见 [安装说明](INSTALL.md)。客户端需支持 Agent Skills；目录和行为依据 [GitHub 官方说明](https://docs.github.com/en/copilot/how-tos/copilot-on-github/customize-copilot/customize-cloud-agent/add-skills) 与 [OpenAI 官方说明](https://learn.chatgpt.com/docs/build-skills)。

自动发现已启用，但是否选择 skill 由客户端和模型决定。首次验证请明确点名，再尝试不点名的自然表达。安装成功只证明文件就位，不等于自动触发成功。

## 会怎样帮助你

例如你说：**“客户不回消息，肯定是销售话术不好，帮我改。”**

AI 应保留改善回应的目标，也保留改话术可能带来的价值，同时检查：问题是否也可能出在联系人、需求匹配或发送时机。只有当这些差别会改变行动时才展开；有原文且你要求直接改，它仍应交付改写。

采用“话术问题”的理解，先改表达；采用“需求不匹配”的理解，先验证联系人和需求。两条路的收益、代价和适用条件不同。AI 给出有条件的偏向，由你决定下一步。

更多演示及边界例子见 [examples.md](docs/examples.md)，演示不等于实验结果。

## 范围与成本

- 通常不提问或只问一个；初始对齐累计最多三个关键问题。
- 通常比较两个有实际后果的框架，总计最多三个；不凑固定分析维度。
- 第一轮只做一次校准，优先压到短屏可读；用户选择后才深入一个分支。
- 明确的事实问题和已确定的执行任务直接完成；只在实质不匹配时简短提醒。
- 同时检验用户预设和 AI 的初步理解；不虚构用户的“真实动机”。

这些是行为和阅读成本约束。skill 无法独立限制模型后台推理 token，也不能保证省多少 token；硬预算由宿主和模型设置控制。

## 差异化与验证

核心研究对象是 **“粗略需求 → 少量关键澄清 → 框架改变的实际后果 → 用户选择深入”** 这段短流程。提问、反驳和多视角本身已有大量相似实践。本项目的辨识度来自它们在这个具体阶段的组合和可观察行为；竞争力需要真实使用验证。

[设计取舍](docs/design-decisions.md) 记录采用、拒绝和保留的方案；[对照说明](docs/comparison.md) 列出与相关项目的重叠和边界。仓库提供行为场景和安装检查，允许据失败修改规则。

## 仓库内容

```text
skills/cognitive-perspective-check/
  SKILL.md                 核心入口
  agents/openai.yaml       Codex 展示和自动发现元数据
  references/deepen.md     仅深入用户选中分支时读取
install.ps1                Windows 本地安装程序
install-copilot.cmd         Copilot 安装入口
install-shared.cmd          共用目录安装入口
INSTALL.md                 手动安装、更新、卸载和排查
docs/                      演示、设计取舍、对照
evals/                     行为场景与验证记录
tests/                     不依赖 Pester 的安装检查
LICENSE                    MIT
```

## 反馈

通过 [GitHub Issues](https://github.com/EversiusJade/cognitive-perspective-check/issues) 提交反馈。

反馈请附原始需求、相关上下文、客户端/模型、是否明确调用、实际回答和你希望改变的行为。特别欢迎报告误触发、反复确认、替你改目标、替代方案没有实际差别，以及明确选择后仍展开其他分支。不要提交敏感信息。

## 许可

[MIT](LICENSE)。版权声明使用项目贡献者名称，发布者可以补充自己的署名。
