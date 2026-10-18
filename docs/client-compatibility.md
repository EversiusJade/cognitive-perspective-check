# 客户端与安装

文档更新：2026-10-17；当前核心版本：`0.2.0-rc.9`。各客户端使用同一份 `SKILL.md` 和 `references/deepen.md`，用于减少用户与 AI 在早期项目、设计和决策中的认知窄化。下表注明了各项验证对应的版本。

## 支持情况

客户端支持 Skills，不代表本项目已在该客户端运行过。下表列出官方机制、安装方法和本项目实际检查到的范围。

| 客户端 | 官方机制 | 安装方法 | 本项目的验证记录 |
|---|---|---|---|
| Codex | 本地 Agent Skills；个人 `~/.agents/skills/`、项目 `.agents/skills/` | 复制完整 skill 文件夹 | 已安装并核对 rc.4 文件，完成 CLI 隔离预检和 8 次实际单轮工程采集；独立人工评分、探索性增益与自然路由仍待验证 |
| GitHub Copilot | Agent Skills；个人 `~/.copilot/skills/` 或 `~/.agents/skills/`；项目 `.github/skills/` 或 `.agents/skills/` | 复制完整 skill 文件夹 | 历史 rc.1 的安装程序检查 12 项通过；尚无实际 Copilot 客户端调用证据 |
| Claude Code | 本地原生 Skills；个人 `~/.claude/skills/`、项目 `.claude/skills/` | 手动复制完整 skill 文件夹 | 安装说明采用官方格式与路径；未在 Claude Code 实测 |
| Claude 网页 / 桌面账户端 | 自定义原生 Skills；上传包含 skill 文件夹的 ZIP | 上传本项目纯 Skill ZIP 并启用 | 包结构符合官方要求只代表格式判断；上传、调用和效果未实测 |
| Cursor | 原生 Agent Skills；个人与项目均可使用 `.cursor/skills/` 或 `.agents/skills/` | 手动复制；已有共用目录时只保留一份 | 安装说明采用官方格式与路径；未在 Cursor 实测 |

目录依据：[OpenAI 官方技能说明](https://learn.chatgpt.com/docs/build-skills)、[GitHub 官方技能说明](https://docs.github.com/en/copilot/how-tos/copilot-on-github/customize-copilot/customize-cloud-agent/add-skills)、[Claude Code 官方技能说明](https://code.claude.com/docs/en/skills)、[Claude 官方自定义技能说明](https://support.claude.com/en/articles/12512180-use-skills-in-claude)、[Cursor 官方技能说明](https://cursor.com/docs/skills)。历史检查见 [rc.1 验证记录](../evals/validation.md)，当前受控评估方案见 [experiment](../evals/experiment/README.md)。

## 下载与文件结构

下载 [rc.9 Skill ZIP](https://github.com/EversiusJade/cognitive-perspective-check/releases/download/v0.2.0-rc.9/cognitive-perspective-check.zip)。本地客户端先解压，再把 `cognitive-perspective-check` 整个文件夹放到所选目录：

```text
<所选 skills 目录>/
  cognitive-perspective-check/
    SKILL.md
    LICENSE
    agents/openai.yaml
    references/deepen.md
```

复制时保留参考文件，不要只复制入口，或再套一层同名目录。`~` 表示当前用户的主目录；Windows 可在文件管理器地址栏输入 `%USERPROFILE%`，再进入相应目录。同一客户端能找到的目录中只保留一份本 skill，避免重复选择。Windows 安装、更新与备份见 [INSTALL.md](../INSTALL.md)。

## Claude：本地目录或账户上传

Claude Code：复制到 `~/.claude/skills/cognitive-perspective-check/`，或当前项目的 `.claude/skills/cognitive-perspective-check/`，新建会话后用 `/cognitive-perspective-check` 点名。Cowork 或云端会话不会自动读取个人本地目录，需在账户端的技能管理入口启用。[官方目录与调用说明](https://code.claude.com/docs/en/skills)

Claude 网页 / 桌面账户端：在 `Customize → Skills → + → + Create skill → Upload a skill` 上传纯 Skill ZIP，保留压缩包内的 skill 文件夹结构，上传后打开开关。Skills 要求启用代码执行与文件创建；个人账户可在 `Settings → Capabilities` 设置，组织账户受相应策略管理。本项目核心流程本身不依赖运行代码。[官方上传步骤与前提](https://support.claude.com/en/articles/12512180-use-skills-in-claude)

## Cursor：直接使用原生 Skills

个人安装到 `~/.cursor/skills/cognitive-perspective-check/`，项目安装到 `.cursor/skills/cognitive-perspective-check/`；也可沿用个人或项目 `.agents/skills/`。在 Agent 输入 `/` 搜索并选择 skill，再观察自然请求是否调用。当前仓库没有 Cursor marketplace 清单，本页只提供本地安装方法，不表示支持插件仓库导入。个人共用 `.agents/skills/` 不会自动复制到 Cloud Agents，远程执行需另行配置。[官方发现、调用与远程范围说明](https://cursor.com/docs/skills)

默认通过各客户端原生 Skills 机制安装和维护核心文件。若把正文另存为 Claude Projects 指令或 Cursor Rules，需单独记录其常驻上下文和触发设置，测试结果也要与 Skills 调用分开。

## 安装后的首次检查

各客户端使用同一组检查。每项另开新会话，保留客户端、模型、skill 版本、原始输入、完整回复和能获取的调用记录：

1. 点名调用：“使用 cognitive-perspective-check。团队经常返工，我想用每日打卡改善，两周内见效，但不想增加管理时间。请给首版方案，信息不足可明确假设。”观察是否区分返工现象与原因预设，同时交付方案。
2. 自然请求：另开会话，删除前面的点名句。观察客户端是否实际加载 skill；输出相似或 AI 自称使用过，都不能单独证明加载。
3. 已选分支：“已决定做一次会前需求对齐，3 人、20 分钟、不新增工具。只写主持稿和记录模板。”观察是否直接制作选中成果。
4. 普通问题：“2.5 小时是多少分钟？”应直接给出 `150 分钟`，无需展开视角流程。

以上是手动检查的目标，不是评估数据。首轮受控评估和实际演示使用 Codex，进度见 [Codex 执行入口与发现预检](evaluation/codex-first-round.md)。各客户端获得调用记录与独立评分后，再更新效果判断。
