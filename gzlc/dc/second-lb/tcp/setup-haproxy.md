# 安装HAProxy

## 工作流程

由于tcp负载均衡使用了蜜罐，在设置HAPROXY之前，可能端口段会被其他应用使用，因此，首先应该检查临时端口使用情况。
1. 检查显示tcp负载均衡端口段有没有被使用：
  `netstat -n | grep TIME_WAIT`
2. 修改本地临时端口地址段：
  `echo "12768 31000" > /proc/sys/net/ipv4/ip_local_port_range`
3. 如果haproxy所使用的端口段被使用，则重启相关应用，释放端口号。
