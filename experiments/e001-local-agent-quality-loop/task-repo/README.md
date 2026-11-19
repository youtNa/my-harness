# OpenHands 试验任务

目标：修复 `slugify`，使其把连续空白转换为一个连字符，并移除首尾连字符。

验收条件：

1. `Hello   World` 返回 `hello-world`。
2. `  Hello World  ` 返回 `hello-world`。
3. 原有测试必须继续通过。
