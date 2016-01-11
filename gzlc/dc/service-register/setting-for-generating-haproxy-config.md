# 使用consul-template自动生成haproxy配置文件

## 概述
为了便于管理和维护，数据中心对所有对外提供服务的非公共端口使用反向代理进行隐藏，以此提高系统安全性。因此，我们需要使用haproxy来提供反向代理服务。同时，为了降低运维难度，数据中心使用consul-template从consul中提取数据，并自动生成haproxy的配置文件。

## 前提条件
- 已 [按预定脚本安装 consul-template]()
- 已安装haproxy

## 工作流程

1.  下载模板文件：`curl https://raw.githubusercontent.com/ynu/consul/master/templates/haproxy-tcp.ct > /data/consul-template/haproxy-tcp.ct`
2. 修改consul-template配置文件
`vi config.hcl`

    - 将其中`template`节的内容修改如下：
    ```
    template {
        source = "/data/consul-template/haproxy-tcp.ct"
        destination = "/etc/haproxy/haproxy.cfg"
        command = "haproxy -c -f /etc/haproxy/haproxy.cfg && service haproxy reload"
    }
    ```

    - 修改配置文件中`token`的值
3. 检查生成的配置是否正确： `consul-template -config=config.hcl -dry`
4. 重启`supervisor`中的`consul-template`服务
```
nginx-1$ sudo supervisorctl restart consul-template
consul-template: stopped
consul-template: started
```
无错误提示即表示启动正常。
