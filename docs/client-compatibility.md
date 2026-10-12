# 客户端兼容与安装路线

核对日期：2026-10-11；核心版本：`0.2.0-rc.4`。各客户端沿用同一份 `SKILL.md` 和 `references/deepen.md`，目标都是减少用户与 AI 在早期项目、设计和决策中的认知窄化。

## 支持机制、安装路线与验证状态

“客户端支持 Skills”“本项目提供安装路线”“安装后实际运行符合预期”分别记录。下表中的官方支持指客户端机制；实际验证栏只记本项目已有证据。

| 客户端 | 官方支持机制 | 本项目安装路线 | 本项目实际验证 |
|---|---|---|---|
| Codex | 本地 Agent Skills；个人 `~/.agents/skills/`、项目 `.agents/skills/` | Windows 共用安装入口，或复制完整 skill 文件夹 | rc.4 文件已安装并核对内容；CLI 隔离预检与 8 次实际单轮工程采集已完成；独立人工评分、探索性增益与自然路由仍待验证 |
| GitHub Copilot | Agent Skills；个人 `~/.copilot/skills/` 或 `~/.agents/skills/`；项目 `.github/skills/` 或 `.agents/skills/` | Windows Copilot / 共用安装入口，或手动复制 | rc.1 隔离目录安装程序检查 12 项通过；尚无实际 Copilot 客户端调用证据 |
| Claude Code | 本地原生 Skills；个人 `~/.claude/skills/`、项目 `.claude/skills/` | 手动复制完整 skill 文件夹 | 已按官方格式与路径提供说明；未在 Claude Code 实测 |
| Claude 网页 / 桌面账户端 | 自定义原生 Skills；上传包含 skill 文件夹的 ZIP | 上传本项目纯 Skill ZIP 并启用 | 包结构与官方要求相符是格式判断；上传、调用和效果未实测 |
| Cursor | 原生 Agent Skills；个人与项目均可使用 `.cursor/skills/` 或 `.agents/skills/` | 手动复制；已有共用目录时只保留一份 | 已按官方格式与路径提供说明；未在 Cursor 实测 |

目录依据：[OpenAI 官方技能说明](https://learn.chatgpt.com/docs/build-skills)、[GitHub 官方技能说明](https://docs.github.com/en/copilot/how-tos/copilot-on-github/customize-copilot/customize-cloud-agent/add-skills)、[Claude Code 官方技能说明](https://code.claude.com/docs/en/skills)、[Claude 官方自定义技能说明](https://support.claude.com/en/articles/12512180-use-skills-in-claude)、[Cursor 官方技能说明](https://cursor.com/docs/skills)。历史检查见 [rc.1 验证记录](../evals/validation.md)，当前受控评估方案见 [experiment](../evals/experiment/README.md)。

## 下载与文件结构

下载 [v0.2.0-rc.4 纯 Skill ZIP](https://github.com/EversiusJade/cognitive-perspective-check/releases/download/v0.2.0-rc.5/cognitive-perspective-check.zip)。本地客户端先解压，再把里面的 `cognitive-perspective-check` 整个文件夹放到所选目录。最终应是：

```text
<所选 skills 目录>/
  cognitive-perspective-check/
    SKILL.md
    LICENSE
    agents/openai.yaml
    references/deepen.md
```

保留参考文件；不要只复制入口，也不要再套一层同名目录。`~` 表示当前用户的主目录；Windows 可在文件管理器地址栏输入 `%USERPROFILE%` 后进入相应目录。同一客户端可发现的目录中保留一份本 skill，避免重复选择。Windows 安装、更新与备份见 [INSTALL.md](../INSTALL.md)。

## Claude：本地目录或账户上传

Claude Code 本地使用：复制到 `~/.claude/skills/cognitive-perspective-check/`，或当前项目的 `.claude/skills/cognitive-perspective-check/`。新建会话后可用 `/cognitive-perspective-check` 点名。个人本地目录不自动供 Cowork 或云端会话读取，账户端需按其技能管理入口启用。[官方目录与调用说明](https://code.claude.com/docs/en/skills)

Claude 网页 / 桌面账户端：直接上传纯 Skill ZIP，保持压缩包内的 skill 文件夹结构：`Customize → Skills → + → + Create skill → Upload a skill`，上传后打开开关。Skills 需要启用代码执行与文件创建；个人账户可在 `Settings → Capabilities` 设置，组织账户受相应策略管理。本项目核心流程本身没有运行代码的依赖。[官方上传步骤与前提](https://support.claude.com/en/articles/12512180-use-skills-in-claude)

## Cursor：直接使用原生 Skills

个人安装到 `~/.cursor/skills/cognitive-perspective-check/`，项目安装到 `.cursor/skills/cognitive-perspective-check/`；也可沿用个人或项目 `.agents/skills/`。在 Agent 输入 `/` 搜索 skill 名称进行显式选择，再观察自然请求是否调用。这里提供本地安装路线；当前仓库没有 Cursor marketplace 清单，不能据此声称已支持其插件仓库导入。个人共用 `.agents/skills/` 不会自动复制到 Cloud Agents，远程执行需另行配置。[官方发现、调用与远程范围说明](https://cursor.com/docs/skills)

默认通过各客户端原生 Skills 机制安装并维护核心文件。若另外将正文粘贴为 Claude Projects 指令或 Cursor Rules，应独立记录其常驻上下文和触发设置，不能与本页的 Skills 调用测试混为一组。

## 各客户端做同一组首次检查

每个检查使用新会话，保留客户端、模型、skill 版本、原始输入、完整回复和可获得的调用记录：

1. 点名调用：“使用 cognitive-perspective-check。团队经常返工，我想用每日打卡改善，两周内见效，但不想增加管理时间。请给首版方案，信息不足可明确假设。”观察是否区分返工现象与原因预设，同时交付方案。
2. 自然请求：另开会话，删除前面的点名句。观察客户端是否实际加载 skill；输出相似或 AI 自称使用过，都不能单独证明加载。
3. 已选分支：“已决定做一次会前需求对齐，3 人、20 分钟、不新增工具。只写主持稿和记录模板。”观察是否直接制作选中成果。
4. 普通问题：“2.5 小时是多少分钟？”应直接给出 `150 分钟`，无需展开视角流程。

这些是手动检查目标，不是评估数据。首轮受控评估与实际演示选择 Codex，当前进度见 [Codex 执行入口与发现预检](evaluation/codex-first-round.md)；跨客户端效果在各自获得调用记录与独立评分后再更新。
