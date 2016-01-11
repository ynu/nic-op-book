# tcp负载均衡

## 概述
数据中心使用haproxy作为tcp负载均衡软件，为数据中心的虚拟机、服务器等提供ssh、rdp等服务等负载均衡和接入服务。

## 工作流程

### 日常工作

- [新增tcp负载均衡设置](add-tcp-lb.md)

### 服务器设置

- [安装并配置haproxy](setup-haproxy.md)
- [配置consul-template为haproxy自动生成脚本](../../service-register/setting-for-generating-haproxy-config.md)
- [使用consul监控haproxy服务](../../service-register/setting-for-checking-haproxy.md)
