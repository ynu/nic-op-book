# 配置RabbitMQ服务器
本文描述如何安装并配置RabbitMQ服务器，并开启Web管理界面。

## 前提条件
1. 已安装Ubuntu

## 工作流程

### 安装rabbitmq服务器
1. 修改主机名
在rabbitmq中主机名非常重要，rabbitmq服务器使用主机名作为队列数据库的名称，同时，在创建rabbitmq集群时也会用到主机名。
    1. 修改永久主机名： `sudo echo RabbitMQ-0 > /etc/hostname`
    2. 修改临时主机名： `sudo hostname RabbitMQ-0`

2. 安装rabbitmq-server
    1. 添加源
    `echo "deb http://www.rabbitmq.com/debian/ testing main" > /etc/apt/sources.list.d/rabbitmq.list`

    2. 下载public key文件
    `wget https://www.rabbitmq.com/rabbitmq-signing-key-public.asc`

    3. 添加key
    `sudo apt-key add rabbitmq-signing-key-public.asc`

    4. 安装
    `sudo apt-get install rabbitmq-server -y`

### 使用Web UI
RabbitMQ 通过rabbitmq-management  Plugin 提供Web UI。

1. 启用Plugin `rabbitmq-plugins enable rabbitmq_management `
WebUI地址：`http://server-name:15672/`
默认用户名和密码都是“guest”，但是只能通过localhost进入。若想通过其他地址进入，需要创建新的用户

2. 添加用户
`rabbitmqctl add_user username password`

3. 修改用户角色
`rabbitmqctl set_user_tags username administrator`
可用的角色包括：*management*, *policymaker*, *monitoring*, *administrator*

4. 为用户设置权限 `rabbitmqctl set_permissions -p / username ".*" ".*" ".*"` 
此处为用户授予全部权限。

5. 删除guest用户 `rabbitmqctl delete_user guest`
6. 重启服务 `service rabbitmq-server restart`