＃ 在reverse-proxy.ynu.edu.cn中为网站设置反向代理

本文档描述如何在代理服务器中新增一个配置文件，将一个网站设置使用反向代理访问。

## 前提条件

1. 使用ssh登录到reverse-proxy.ynu.edu.cn服务器上

## 工作流程

1. 切换到配置文件所在文件夹： `cd /etc/nginx/sites-enabled`
2. 从现有配置文件（例如git.conf文件）创建一个新的配置文件，并将文件名按规定格式命名：`sudo cp git.conf www.example.conf`。文件名称须满足以下要求：
	- 文件以`.conf`结尾；
	- 文件名应该包含需要被代理的域名，其中`.ynu.edu.cn`可省略。例如，为www.example.ynu.edu.cn做反向代理时，可以使用`www.example.conf`作为文件名。
3. 打开刚刚新建的文件：`sudo vi www.example.conf`。修改内容为：
	```
	server {
        server_name www.example.ynu.edu.cn;
        location / {
                proxy_pass http://real-server.example.com:8888;
        }
	}

	```


4. 重新加载nginx的配置文件： `sudo nginx -s reload`