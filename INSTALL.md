# 安装

下载 [rc.9 Skill ZIP](https://github.com/EversiusJade/cognitive-perspective-check/releases/download/v0.2.0-rc.9/cognitive-perspective-check.zip)，解压后把整个 `cognitive-perspective-check` 文件夹复制到技能目录。不用运行安装脚本。

## 放到哪里

`~` 是用户目录，Windows 通常为 `C:\Users\你的用户名`。

| 客户端 | 技能目录 |
|---|---|
| Codex / Copilot 共用 | 个人 `~/.agents/skills/` 或项目 `.agents/skills/` |
| GitHub Copilot | 个人 `~/.copilot/skills/` 或项目 `.github/skills/` |
| Claude Code | 个人 `~/.claude/skills/` 或项目 `.claude/skills/` |
| Cursor | 个人 `~/.cursor/skills/` 或项目 `.cursor/skills/`；也可使用其支持的 `.agents/skills/` |

一个客户端选一个位置。文件应落在 `skills/cognitive-perspective-check/SKILL.md`，别重复套同名文件夹。目录来源、云端上传和各客户端的实测情况见 [兼容说明](docs/client-compatibility.md)。

## 第一次用

新建聊天，必要时重启客户端。Codex 可输入 `$cognitive-perspective-check`，也可直接点名：

> 使用 cognitive-perspective-check。我们想给小店做个 App 提高收入，但还不清楚瓶颈。请比较可能改变方案的视角，给出简短建议。

另开新聊天，不点名再试一次，观察是否自然触发。普通问答和已定任务应直接完成；只让它写公告，就不该多出比较表或继续菜单。

## 更新或卸载

先把旧文件夹备份到技能扫描目录之外，再整体替换。通过 skills CLI 安装的，沿用它的更新方式。

卸载时删除这个技能文件夹，必要时重启客户端。

## 找不到时

检查目录、大小写、是否多套一层文件夹，以及客户端是否支持该位置。能找到但不自然触发，就先点名，并记下客户端、模型和原始请求。

当前版本使用手动复制或客户端安装工具。历史 Windows 安装检查和 8 次 Codex 采集属于旧版；这次没有新增客户端行为实验。公开附件与校验文件见 [Release](https://github.com/EversiusJade/cognitive-perspective-check/releases/tag/v0.2.0-rc.9)。
