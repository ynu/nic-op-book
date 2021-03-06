# 由管理员帮用户绑定手机号码

一般情况下，用户可自行绑定手机号码，前提是用户还可以登录统一身份认证平台。当用户密码遗忘时，需要管理员帮助用户绑定手机号码，以便用户重置密码。

## 使用对象

- 流程主要操作者：统一身份认证系统运维岗管理员 （【B11b】）
- 配合者：运维服务人员

## 处理流程

1. 【B11b】收到运维服务人员发来的绑定手机号申请，并同时接收运维服务人员发过来的`一卡通号`、`身份证号`、`手机号码`、`姓名`、`学院`等，以上数据缺一不可。
2. 检查用户是否绑定过手机（登录imp，帐号详情中`电话号码`字段填写11位手机号码且`手机是否验证`字段为1表示用户已绑定过手机号码）；
3. 如果未绑定过手机号码，帮用户绑定手机号码（登录imp，帐号详情中`电话号码`字段填写11位手机号码且`手机是否验证`字段设为1），并告知运维服务人员处理结果，流程结束。
4. 如果绑定过手机号码，与用户取得联系，了解相关情况（主要需要了解的情况是：告知用户已绑定过的手机号码；询问用户是否了解该手机号码的相关情况；提醒用户注意帐号安全）。
5. 帮用户绑定手机号码（登录imp，帐号详情中`电话号码`字段填写11位手机号码且`手机是否验证`字段设为1），并告知运维服务人员处理结果，流程结束。
