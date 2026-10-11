# 安装、更新与首次验证

本说明适用于 **认知视角检查器 · Cognitive Perspective Check**，稳定安装标识为 `cognitive-perspective-check`。当前候选版本为 `0.2.0-rc.4`。

下载入口：[Windows 便捷安装包](https://github.com/EversiusJade/cognitive-perspective-check/releases/download/v0.2.0-rc.4/cognitive-perspective-check-v0.2.0-rc.4-windows.zip)、[纯 Skill 包](https://github.com/EversiusJade/cognitive-perspective-check/releases/download/v0.2.0-rc.4/cognitive-perspective-check.zip)、[版本说明与校验文件](https://github.com/EversiusJade/cognitive-perspective-check/releases/tag/v0.2.0-rc.4)。

## Windows：解压后双击

完整安装包的根目录有两个入口，按用途选一个：

| 入口 | 安装位置 | 用途 |
|---|---|---|
| `install-copilot.cmd` | `%USERPROFILE%\.copilot\skills\cognitive-perspective-check` | GitHub Copilot |
| `install-shared.cmd` | `%USERPROFILE%\.agents\skills\cognitive-perspective-check` | 当前官方说明中的 Copilot / Codex 共用目录 |

双击前应已完整解压 ZIP。入口只启动本地 `install.ps1` 并显示安装结果；无需下载依赖或输入 GitHub 凭证。第一次安装会显示目标路径。整个文件夹内容一致时再次运行显示 `Already installed`；文件集或内容不同会保留已有安装，提示显式更新。

入口对这个 PowerShell 进程使用 `-ExecutionPolicy Bypass`，不修改系统或用户的持久执行策略。组织策略若仍阻止脚本，可用下方手动复制方式。

需要先查看位置而不安装时，在包根目录的 PowerShell 运行：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\install.ps1 -Target Copilot -WhatIf
```

纯 skill ZIP 的用户，解压后将 `cognitive-perspective-check` 整个文件夹复制到上表的 `skills` 文件夹。最终结构应是 `skills/cognitive-perspective-check/SKILL.md`，不要再套一层同名文件夹。

## macOS / Linux：手动复制

在解压的完整包根目录运行。以下命令拒绝覆盖已有同名 skill：

```sh
mkdir -p "$HOME/.copilot/skills"
test ! -e "$HOME/.copilot/skills/cognitive-perspective-check" && cp -R ./skills/cognitive-perspective-check "$HOME/.copilot/skills/"
```

Codex 或共用目录将 `.copilot/skills` 换成 `.agents/skills`。这些命令尚未在 macOS/Linux 客户端实机验证；也可直接用文件管理器复制。核心 skill 为 Markdown，无平台运行依赖。

## 项目级安装

复制完整 skill 文件夹到项目的 `.agents/skills/`，当前官方说明中 Copilot、Codex 均支持此路径。Copilot 还支持项目 `.github/skills/`。个人目录和项目目录选一种，避免重复发现。

目录依据：[GitHub 官方技能说明](https://docs.github.com/en/copilot/how-tos/copilot-on-github/customize-copilot/customize-cloud-agent/add-skills)、[OpenAI 官方技能说明](https://learn.chatgpt.com/docs/build-skills)。核对日期：2026-10-11。

## Claude 与 Cursor：原生 Skills

核心文件可沿用同一份 `skills/cognitive-perspective-check/`：

- **Claude Code：**复制完整文件夹到个人 `~/.claude/skills/` 或项目 `.claude/skills/`，最终为 `cognitive-perspective-check/SKILL.md`。
- **Claude 网页 / 桌面：**在可用的 Skills 设置中上传 [纯 Skill ZIP](https://github.com/EversiusJade/cognitive-perspective-check/releases/download/v0.2.0-rc.4/cognitive-perspective-check.zip) 并启用；按客户端要求启用代码执行与文件创建。
- **Cursor：**复制到项目 `.cursor/skills/` 或 `.agents/skills/`；个人目录可用 `~/.cursor/skills/` 或 `~/.agents/skills/`，选一个位置。

这些路线依据官方原生机制提供，尚未在本项目中逐客户端实测；本地目录不会自动同步到云端。完整步骤、官方来源、首次检查及验证状态见 [客户端兼容指南](docs/client-compatibility.md)。

## 首次验证：先点名，再看自然触发

新建一轮聊天。必要时重启客户端使它重新发现本地技能。

先输入：

> 使用 cognitive-perspective-check。我们想做一个 App 帮小店提高收入，但还没有确定瓶颈。请先理解关键背景，比较可能改变行动的视角，并给出简短的条件建议。

Codex 可用 `$cognitive-perspective-check` 点名；其他客户端使用自身的技能选择方式，或先用自然语言点名。

你应观察到：AI 从已有信息理解目标、约束和关键关系，只在答案会改变判断时补问；检查收入目标与 App 手段之间的预设；少量视角说明证据、取舍和行动差异；给出有依据的条件偏向，并让你选择是否深入一个分支。条件后果或推演应标明假设，不能当成现实预测。

然后换一个新聊天，不点名重复类似需求，检查自然触发。最后试 `2.5 小时是多少分钟？`，应该直接答 `150 分钟`。这些是手动检查目标，不代表已经在你的客户端验证成功。

若找不到：检查路径和大小写、是否重复套目录、客户端是否支持个人技能、是否需要重启。若能找到但自然请求不触发：先明确调用，并记录客户端、模型、原始请求和调用状态。

## 更新、保留本地修改与卸载

内容不同的同名 skill 默认不覆盖。建议沿用原安装渠道更新：纯 skill ZIP 额外附带手动安装 README，切换到安装器时即使版本相同，也可能被判为文件集不同。这是完整内容检查，不代表核心版本一定不同；保留保护规则，确认后显式备份更新。通过其他工具安装到链接目录的用户应沿用该工具更新，本安装器拒绝链接路径。

确定要更新时，在新包根目录运行：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\install.ps1 -Target Copilot -ReplaceExisting
```

共用目录将 `Copilot` 换成 `Shared`。旧目录会移到对应 `.copilot/skill-backups/` 或 `.agents/skill-backups/`，安装结果会显示确切备份路径。备份在 `skills` 扫描目录外，避免重复发现。本地修改不会并入新版本，可从备份手动恢复。

卸载：在文件管理器中只删除本次安装路径下的 `cognitive-perspective-check` 文件夹，必要时重启客户端。恢复旧版：保留当前版后，把备份的 skill 文件夹放回原安装位置。其他 skill 和配置不需要修改。

## GitHub 发布后的在线安装

公开仓库：[EversiusJade/cognitive-perspective-check](https://github.com/EversiusJade/cognitive-perspective-check)。当前候选版本的发布入口为 [v0.2.0-rc.4 Release](https://github.com/EversiusJade/cognitive-perspective-check/releases/tag/v0.2.0-rc.4)。也可下载 [源码 ZIP](https://github.com/EversiusJade/cognitive-perspective-check/archive/refs/heads/main.zip)，完整解压后进入包含 `README.md` 和安装入口的文件夹，按本文的双击或手动复制步骤安装。下载 ZIP 和手动复制不依赖 GitHub CLI；在线技能安装命令需另行在目标工具验证。

`0.2.0-rc.4` 沿用原安装程序，本轮仅进行内容与分发静态审查。[已有安装和行为验证记录](https://github.com/EversiusJade/cognitive-perspective-check/blob/v0.2.0-rc.1/evals/validation.md) 对应已发布的 `0.2.0-rc.1`，不代表本版已在实际客户端验证自然调用或效果。

## 维护者检查

以下命令仅用于完整仓库源码；便捷安装 ZIP 和纯 skill ZIP 不包含 `tests/`。普通使用者无需运行此步骤。

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\tests\install.tests.ps1 -TestRoot .\work\install-check
```

检查只使用指定的临时目录，不安装进用户的真实技能目录。它验证文件安装行为；模型行为需要另用 `evals/evals.json` 和实际客户端检查。
