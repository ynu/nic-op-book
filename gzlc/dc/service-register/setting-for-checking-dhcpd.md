# 使用consul监控 DHCP服务
本文描述如何使用consul对dhcpd服务器进行健康检查

## 前提条件
- 服务器已安装consul，并运行了consul agent
- 已安装isc-dhcp-server软件

## 设置流程

1. 安装进程检查脚本
    1. 切换到`/data/consul/scripts`目录下，也可以是其他目录。
    2. 下载脚本文件： `curl https://raw.githubusercontent.com/ynu/consul/master/scripts/psc.sh > psc.sh`
    3. 设置文件属性为可执行： `chmod +x psc.sh`
    4. 测试脚本是否可用： `./psc.sh dhcpd`
2. 设置consul服务及检查定义
    1. 下载服务定义模板到consul配置文件目录：`curl https://raw.githubusercontent.com/ynu/consul/master/service-config/dhcp.json > /data/consul/config/dhcp.json`
    2. 修改`dhcp.json`文件中的信息，包括`address`等。
3. 重新加载consul配置: `consul reload`
