# 在Linux上安装logstash

## 前提
- 安装JRE（1.8以上）

## 安装步骤

1. 下载安装包

    `curl -L -O https://artifacts.elastic.co/downloads/logstash/logstash-5.6.3.tar.gz`
2. 解压

    `tar -xvf logstash/logstash-5.6.3.tar.gz`

3. 启动

    ```
    cd logstash/logstash-5.6.3.tar.gz/bin
    ./logstash
    ```

## 其他

### 后台运行
