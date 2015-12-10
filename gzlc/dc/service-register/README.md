# 服务注册与发现
本文档描述数据中心服务注册与发现相关的工作流程

## 概述
为了能够实现数据中心整体架构的自动配置及部署，我们采用服务注册与发现系统共享数据中心各个服务的配置。
目前，我们使用 **consul** 作为服务注册与发现系统软件。**consul**服务器IP地址分配参见：[数据中心内网IP地址分配规则](./../../../../kb/dc-private-ip.md)

## 工作流程

### 服务器设置

- [安装Consul](setup-consul.md)
- [使用consul监控 DHCP服务](setting-for-checking-dhcpd.md)
- [使用consul-template生成根据mac分配ip地址的dhcpd配置文件](setting-for-generating-dhcpd-conf.md)
- [安装并配置etcd服务器](setup-etcd-server.md)

### 运维

- [使用consul注册web服务](register-web-service-in-consul.md)
- [使用consul为虚拟机分配IP地址](register-dhcp-host.md)