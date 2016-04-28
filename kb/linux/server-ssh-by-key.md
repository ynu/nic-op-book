# 让服务器只允许使用Key进行SSH登录

1. 生成客户端的密钥对。
  `ssh-keygen -t rsa -f /path/to/keys/my_key`
  执行之后，将会在`/path/to/keys`目录下生成公钥和密钥文件：`my_key`和`my_key.pub`。生成过程中会提示输入密码，为了服务器安全，建议输入一个密码，这样的话，就算密钥被人窃取，没有密钥的密码同样还是登陆不了服务器。

2. 将客户端的公钥拷贝到服务器端。
  `ssh-copy-id -i /path/to/keys/my_key.pub user@myserver`
  执行过程中会要求输入服务器端用户的密码。出现`Number of key(s) added: 1`时即表示添加成功。

3. 测试密钥登陆是否正常。
  `ssh -i /path/to/keys/my_key user@myserver`
  如果密钥有密码，此时会提示输入密钥的密码，如果没有密码的话，直接就会进入到服务器中。

4. 禁止客户端使用密码验证的方式SSH登陆服务器。
  1. 打开ssh的配置文件：`sudo vi /etc/ssh/sshd_config`
  2. 将`#PasswordAuthentication yes`（大概在50行左右）修改为`PasswordAuthentication no`
  3. 重启ssh服务器： `sudo service ssh restart`

5. 检测设置是否成功
  退出服务器，然后重新登陆：`ssh user@myserver`，此时提示`Permission denied (publickey).`则表示设置成功。
