# 云南大学开放API平台

## 概述
云南大学开放API平台将学校的一些数据以RESTful的方式开放出来供第三方程序开发者使用。

## URL Schema
所有API都使用以下URL Schema：
`http://api.ynu.edu.cn/<version>/<moudel>/[<sub_moudel/]<interface>[?<params>]`

- `moudel` 为方便组织，所有公共API都被分组在特定的模块里；
- `sub_moudel` 子模块；
- `version` 为避免今后api更改带来麻烦，每个模块的API都设定版本号；
- `interface` 每个模块包括很多接口，每个接口都提供不同的功能；
- ``

例如，调用`standard`模块的`zzjg`接口：
`http://api.ynu.edu.cn/standard/v1/zzjg`

### 特别注意
- API默认使用`GET` 方法调用；
- 所有API均提供跨域调用（CORS）。

## 模块列表

| 模块名称 | 描述 | 版本 |
| --- | --- | --- |
| standard | 公共代码标准 | [v1](./standard-v1.md) |
| ecard | 一卡通系统 | v1 |
| elearning | 网络教学平台 | v1 |
| email | 电子邮件 | v1 |
| library | 图书馆 | v1 |



