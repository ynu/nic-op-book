# 服务器配置：自动生成nginx配置文件
本文描述如何配置服务器，使服务器用 **consul-template** 通过 **consul** 为 **nginx** 自动生成配置文件

## 前提条件

- 已[使用预设脚本安装了 **consul-template**]()

## 工作流程

1. 设置模板文件
`curl https://raw.githubusercontent.com/ynu/consul/master/templates/nginx.ct > nginx.ct`

2. 修改consul-template配置文件
`vi config.hcl`

    - 将其中`template`节的内容修改如下：
    ```
    template {
        source = "/data/consul-template/nginx.ct"
        destination = "/etc/nginx/sites-enabled/from-consul-template.conf"
        command= "nginx -s reload"
    }
    ```

    - 修改配置文件中`token`的值

5. 重启`supervisor`中的`consul-template`服务
```
nginx-1$ sudo supervisorctl restart consul-template
consul-template: stopped
consul-template: started
```
无错误提示即表示启动正常。

## 其他说明
- 如果未使用预设的脚本，而是手动安装 **consul-template**，则在进行以上操作会略有不同；