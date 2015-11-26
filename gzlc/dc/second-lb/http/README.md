# HTTP负载均衡
本文描述HTTP负载均衡的工作流程

## 概述
数据中心采用 **Nginx** 作为HTTP负载均衡。服务器的地址分配请参考： [数据中心内网IP地址分配规则](../../../../kb/dc-private-ip.md)

## 服务器软件配置
所有nginx服务器均采用相同的软件配置，包括：
- 安装 **nginx**
- 使用 **supervisor** 作为进程守护工具；
- 安装 **consul** 并作为客户端使用；
- 安装 **consul-template** 用于自动生成配置文件。

## 工作流程

- [服务器配置：自动生成nginx配置文件](server-setup-generate-conf.md)
