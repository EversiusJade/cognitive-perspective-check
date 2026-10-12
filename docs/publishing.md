# 发布记录

当前候选版为 [v0.2.0-rc.6](https://github.com/EversiusJade/cognitive-perspective-check/releases/tag/v0.2.0-rc.6)。公开附件为统一的 Skill ZIP 和 SHA256 校验文件。

工作流从触发提交构建附件，再发布对应版本。已经发布的旧附件保留，后续修改使用新版本。打包程序是 `scripts/package_release.py`。

rc.6 删除安装脚本并修订 Issue #1 的任务边界。回归场景已经编写，尚未运行。已有模型记录见 [rc.4 首批报告](../evals/runs/2026-10-11-codex-rc4-first-batch/REPORT.md)，本版改动见 [版本说明](releases/v0.2.0-rc.6.md)。
