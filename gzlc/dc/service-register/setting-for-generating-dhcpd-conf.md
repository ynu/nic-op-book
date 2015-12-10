# 使用consul-template生成根据mac分配ip地址的dhcpd配置文件

## 概述
为了便于管理和维护，除了特殊用途服务器外，数据中心所有虚拟机均采用DHCP以MAC地址为依据分配IP地址。为了构建高可用的数据中心，避免单台DHCP服务器出现单点故障造成虚拟机服务不可用，数据中心将设置数台DHCP服务器同时提供服务。同时，为了能够使所有DHCP服务器的配置同步，我们需要通过服务发现来自动同步配置文件。

## 前提条件
- 已 [按预定脚本安装 consul-template]()

## 工作流程

1.  下载模板文件：`curl https://raw.githubusercontent.com/ynu/consul/master/templates/dhcpd.ct > /data/consul-template/dhcpd.ct`
2. 修改consul-template配置文件
`vi config.hcl`

    - 将其中`template`节的内容修改如下：
    ```
    template {
        source = "/data/consul-template/dhcpd.ct"
        destination = "/etc/dhcp/dhcpd.conf"
        command = "dhcpd -t -cf /etc/dhcp/dhcpd.conf && service isc-dhcp-server reload"
    }
    ```

    - 修改配置文件中`token`的值

3. 重启`supervisor`中的`consul-template`服务
```
nginx-1$ sudo supervisorctl restart consul-template
consul-template: stopped
consul-template: started
```
无错误提示即表示启动正常。
