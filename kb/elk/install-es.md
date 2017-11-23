# 在Linux上安装ElasticSearch

## 前提
- 安装JRE（1.8以上）

## 安装步骤

1. 下载安装包

    `curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.3.tar.gz`
2. 解压

    `tar -xvf elasticsearch-5.6.3.tar.gz`

3. 启动

    ```
    cd elasticsearch-5.6.3.tar.gz/bin
    ./elasticsearch
    ```

## 其他

### 后台运行

使用`supervisor`实现后台运行，配置文件如下：

```
# elasticsearch.conf
[program:elasticsearch]
command=/disk1/elasticsearch-5.6.3/bin/elasticsearch
user=wlzx
```