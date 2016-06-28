# 设置consul及consul-template，用于自动生成nginx配置文件

此文档描述如何使用consul及consul-template自动为nginx服务器生成配置文件，并在配置文件生成之后自动进行脚本检查及服务重载。

##  前提
1. 已安装consul及consul-template
2. 服务器上已正确安装nginx
## 操作步骤

1. 将nginx服务器设置为consul agent，对服务器进行监控。
2. 更改`/var/log/nginx`目录的权限，使其可以被读写。
3. 更改`/data/nginx/nginx.pid`的权限，使其可以被读写。
4. 设置consul-template，用于生成配置文件
