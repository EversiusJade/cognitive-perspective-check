# 实验资料包

主文档：[experiment-design.md](experiment-design.md)。

本资料用于 rc.4 的诊断实验，尚未采集本方案的结果。

## 文件

- experiment-design.md：完整操作协议和结论边界。
- inputs.json：四条件的确切文本、八个场景（其中四个用于 pilot）、事实卡和各阶段要求。
- rubric.json：正向/风险锚点、适用性、主要比较和聚合方法。
- preregistration-template.json：运行前登记真实模型/客户端、隔离证据、预算和冻结哈希。
- run-record-template.json：记录每次尝试、完整对话、加载证据和可观察用量。
- ratings-template.csv：两位评审分别保留逐项评分及证据。
- calibration-examples.md：四个作者构造的校准例，不是模型结果。
- REPORT-template.md：采集完成后使用的报告模板。
- source-kimi.md：保留的原方案，不覆盖。
- CHANGELOG.md、manifest.json：本轮改动及文件与版本的对应关系。

完成登记和隔离后，再运行 48 槽位 pilot。未执行的字段保留为 null/unknown。

资料包没有自动模型运行器，未填造结果，也不要求修改用户的全局设置。
