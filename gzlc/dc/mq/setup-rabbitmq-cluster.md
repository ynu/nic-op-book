# 配置RabbmitMQ服务器集群
本文描述如何创建RabbitMQ服务器集群

## 概述
为了提高消息队列的性能和可用性，我们可以为rabbitmq创建服务器集群（cluster）。

## 工作流程
1. 组建集群之前，待加入集群的服务器应当各自先启动rabbitmq服务。
`sudo service rabbitmq-server start`

2. 找出其中一台主机(这里是rabbitmq-01)的Erlang cookie
```
rabbitmq-01:~$ sudo cat /var/lib/rabbitmq/.erlang.cookie
ITCWRVSIDPHRSLGXBHCFc
```

3. 将cookie复制到其他主机上
```
# 停止rabbitmq服务
rabbitmq-02:~$ rabbitmqctl stop_app   
# 重置rabbitmq为初始状态       
rabbitmq-02:~$ rabbitmqctl reset
# 复制cookie            
rabbitmq-02:~$ sudo scp rabbitmq-01:/var/lib/rabbitmq/.erlang.cookie  /var/lib/rabbitmq/.erlang.cookie          
```

4. 创建集群
```
rabbitmq-02:~$ rabbitmqctl join_cluster rabbit@rabbitmq-01
Clustering node rabbit@rabbitmq-02 with [rabbit@rabbitmq-01] ...done.
rabbitmq-02:~$ rabbitmqctl start_app
Starting node rabbit@rabbitmq-02 ...done.
```
需要特别注意的是：
    - rabbitmq-02的`/etc/hosts`文件中必须有rabbitmq-01的地址配置
    - 每个rabbitmq服务器的默认应用名称都是rabbit
    - 集群主机名区分大小写，如果主机名是Rabbit-01，则`join_cluster`的参数应当写rabbit@Rabbit-01
    - 其他主机也使用同样的步骤加入集群

5. 查看集群状态
```
rabbit1$ rabbitmqctl cluster_status
Cluster status of node rabbit@rabbit1 ... [{nodes,[{disc,[rabbit@rabbit1,rabbit@rabbit2]}]}, {running_nodes,[rabbit@rabbit2,rabbit@rabbit1]}] ...done.
rabbit2$ rabbitmqctl cluster_status
Cluster status of node rabbit@rabbit2 ... [{nodes,[{disc,[rabbit@rabbit1,rabbit@rabbit2]}]}, {running_nodes,[rabbit@rabbit1,rabbit@rabbit2]}] ...done.
```

## 其他
rabbitmq创建集群之后，vitrual hosts、exchanges、users、permissions会自动镜像到集群中的各个节点中，客户端连接到任何 一个节点上都能看见全部队列，但队列数据只存在单个节点上，具体可参考 [Distributed RabbitMQ brokers](http://www.rabbitmq.com/distributed.html)。若希望实现队列数据的高可用，需要[配置高可用集群]()