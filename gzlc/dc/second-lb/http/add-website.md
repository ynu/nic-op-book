# 新增网站负载均衡配置
本文描述当新增一个web站点时，如何对其配置负载均衡。

## 工作流程

1. 打开 [Consul KEY/VALUE 控制台](http://consul.ynu.eud.cn)，具体操作可参考: [如何使用Consul控制它]()
2. 在`/nginx`下新建一个目录，名称不能含有中文或特殊符号。例如，我们建立一个名为`new-website`的目录
3. 在刚建好的目录下新建一个名为`domian`的键，其值为网站最终对外发布的域名。
4. 在此目录下还可以添加其他的键值对，具体见“高级功能”
5. 在步骤2中建好的目录下建立一个名为`servers`的目录，用于存放网站真实服务器的地址。
6. 在`servers`下建立键值对，键名可任意取，值为网站提供服务的地址和端口号。
7. 在浏览器中通过域名访问，检查是否成功。

## 高级功能

### Location Options
在站点目录下，可以通过location_options键为location节点添加其他的options。

### Server Options
在站点目录下，可以通过server_options键为server节点添加其他的options
