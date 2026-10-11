# 实验资料包

主文档：[experiment-design.md](experiment-design.md)。

这是rc.4的诊断实验准备资料，尚未采集本方案的结果。

## 文件

- experiment-design.md：完整操作协议与结论边界。
- inputs.json：四条件确切文本、八个场景、四个pilot场景、事实卡和逐阶段要求。
- rubric.json：正向/风险锚点、适用性、主要比较与聚合方法。
- preregistration-template.json：开跑前登记真实模型/客户端、隔离证据、预算和冻结哈希。
- run-record-template.json：每次尝试、完整对话、加载证据和可观察用量记录。
- ratings-template.csv：两位评审各自保留逐项证据评分。
- calibration-examples.md：四个作者构造的校准例，不能当模型结果。
- REPORT-template.md：实际采集后的报告模板。
- source-kimi.md：原方案，不覆盖。
- CHANGELOG.md、manifest.json：本轮改动和文件版本关联。

先完成登记与隔离，再运行48槽位pilot。未执行的字段保持null/unknown。
本资料包不含自动模型运行器，也没有虚构结果；不要求为了实验而改用户全局设置。
