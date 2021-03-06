# 在负载均衡（TSG-LB）中添加网站的反向代理
## 前提条件
1. 登录到负载均衡系统

## 操作流程
### 1. 添加实服务组
1. 进入`服务器负载均衡` -> `实服务组`，点击 `+` 按钮；
2. 填写 `实服务组名称`，命名格式为 `xxx服务组` 或 `xxx集群`，如`portal服务组`，`consul服务器集群`;
3. 点击 `确定`。

### 2. 添加实服务器
1. 进入`服务器负载均衡` -> `实服务器`，点击 `+` 按钮；
2. 填写 `实服务器名称`，格式为：`xxx-y`，xxx为应用系统或服务名称，y为顺序编号，例如：`portal-0`, `consul-web-1`；
3. 填写 `实服务器IP地址` 、 `端口`、 选择之前添加的 `实服务组`；
4. 选中 `高级配置`，添加健康监测方法：
	1. 填写 `模板名称`，格式为 `sfwq-http-method`，其中 `sfwq` 为实服务器名称，`method` 为http方法，一般为 `get`。
	2. 选择 `类型` 为 `HTTP`；
	3. 填写 `URL`、`预期接收状态码`，填写之前应当使用 `curl -v` 测试；
	4. 点击 `确定`。
5. 选择刚刚添加的健康检测方法。
6. 点击 `确定`。
	
### 3. 添加流分类器
1. 进入`资源管理` -> `策略` -> `流分类器`，点击 `+` ；
2. 填写 `流分类器名称`，格式为 `xxx==host`，xxx为域名，例如：`portal.ynu.edu.cn==host`；
3. 选择 `类型` 为 `HTTP`；
4. 填写 `Match ID` 为 `1` ，`类型` 为 `HTTP Header`，`Header名称` 为 `host`，`匹配规则` 为网站域名，例如: `portal.ynu.edu.cn`。
5. 点击 `添加` ；
6. 点击 `确定`。

### 4. 添加动作
1. 进入`资源管理` -> `策略` -> `动作`，点击 `+` ；
2. 填写 `动作名称`，格式为 `到xxx`，xxx为实服务组名称，例如：`到portal服务组`；
3. 选择 `主用实服务组` 为之前创建的实服务组。
4. 点击 `确定`。

### 5. 添加负载均衡动作
1. 进入`资源管理` -> `策略` -> `动作`，选择 `根据host分流`；
2. 在 `负载均衡动作` 中选择 `流分流器`、`动作` 为之前创建的；
3. 点击 `添加`；
4. 点击 `确定`。

### 6. 修改DNS
1. 修改本地 `hosts` 文件测试；
2. 修改DNS记录。


