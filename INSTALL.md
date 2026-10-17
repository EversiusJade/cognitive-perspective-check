# 安装

下载 [rc.8 Skill ZIP](https://github.com/EversiusJade/cognitive-perspective-check/releases/download/v0.2.0-rc.8/cognitive-perspective-check.zip) 并解压，将整个 `cognitive-perspective-check` 文件夹复制到客户端支持的技能目录。核心文件不需要执行脚本。

## 放到哪里

`~` 表示你的用户目录，Windows 中通常是 `C:\Users\你的用户名`。

| 客户端 | 可选位置 |
|---|---|
| Codex / Copilot 共用 | 个人 `~/.agents/skills/` 或项目 `.agents/skills/` |
| GitHub Copilot | 个人 `~/.copilot/skills/` 或项目 `.github/skills/` |
| Claude Code | 个人 `~/.claude/skills/` 或项目 `.claude/skills/` |
| Cursor | 个人 `~/.cursor/skills/` 或项目 `.cursor/skills/`；也可用其支持的 `.agents/skills/` |

同一个客户端选择一个位置，避免重复安装。最终文件应是 `skills/cognitive-perspective-check/SKILL.md`，不要重复套一层同名目录。各客户端的详细来源、云端上传和实测状态见 [兼容说明](docs/client-compatibility.md)。

## 第一次使用

新建一轮聊天；必要时重启客户端，让它重新发现技能。Codex 可以输入 `$cognitive-perspective-check`，也可自然语言点名：

> 使用 cognitive-perspective-check。我们想给小店做个 App 提高收入，但还不清楚瓶颈。请比较可能改变方案的视角，给出简短建议。

再用一个新聊天尝试不点名的请求，观察自然触发。普通事实问答和已确定的任务应该直接交付；例如要求写公告时，不应额外出现比较表和继续菜单。

## 更新和卸载

更新前，把旧文件夹复制到技能扫描目录之外备份，再用新版本替换整个文件夹。如果使用 skills CLI 安装，沿用它的更新方式。卸载时删除这一个技能文件夹，必要时重启客户端。

## 找不到技能时

检查目录、大小写、是否重复套文件夹，以及客户端是否支持这个位置。能找到但自然请求不触发时，先明确点名，并记录客户端、模型和原始请求。

rc.8 使用手动复制或客户端安装工具。历史 Windows 安装检查和 8 次 Codex 采集分别对应旧版本；本次没有新增客户端行为实验。公开版本及校验文件见 [Release](https://github.com/EversiusJade/cognitive-perspective-check/releases/tag/v0.2.0-rc.8)。
