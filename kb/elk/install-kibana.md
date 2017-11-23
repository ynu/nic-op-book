# 安装Kibana

## 安装X-Pack

1. 下载相同版本的x-pack
2. 安装插件：`bin/kibana-plugin install file:///path/to/x-path`
3. 重启kibana
4. 默认用户名和密码：elastic/changeme。进入用户界面后可管理用户和角色。

## 其他

### 后台运行

使用`supervisor`实现后台运行，配置文件如下：

```
# kibana.conf
[program:kibana]
command=/disk1/kibana-5.6.3/bin/kibana
user=wlzx
```