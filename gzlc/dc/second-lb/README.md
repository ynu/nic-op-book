# 二级负载均衡
本文描述数据中心二级负载均衡的工作流程

## 概述
二级中心采用软件构建两种二级负载均衡：
- **Nginx** 用于构建HTTP负载均衡
- **HAProxy** 用于构建tcp负载均衡

## 工作流程
- [HTTP负载均衡](http/README.md)
- [tcp负载均衡](tcp/README.md)