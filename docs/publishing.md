# 发布记录

当前候选版本为 [v0.2.0-rc.5](https://github.com/EversiusJade/cognitive-perspective-check/releases/tag/v0.2.0-rc.5)。本版修复文档格式并重新构建附件；此前候选版本保留为历史记录。

仓库工作流从触发提交构建 Windows 安装 ZIP、纯 Skill ZIP 与 SHA256 校验文件，再发布对应版本。已发布版本的附件保留，因此修改正文后需要发布新版本才能让当前下载入口包含修订。

打包程序为 `scripts/package_release.py`。它从核心文件读取版本，使用固定 ZIP 顺序和时间戳；构建产物不写回核心目录。

当前文档与下载入口以 rc.5 为准，实际模型采集仍对应 rc.4。方法与结果见 [首批报告](../evals/runs/2026-10-11-codex-rc4-first-batch/REPORT.md)，格式修订范围见 [版本说明](releases/v0.2.0-rc.5.md)。
