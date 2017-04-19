# 云南大学开放API平台

## 概述
云南大学开放API平台将学校的一些数据以RESTful的方式开放出来供第三方程序开发者使用。

## URL Schema
所有API都使用以下URL Schema：
`https://api.ynu.edu.cn/<moudel>/<version>/[<sub_moudel/]<interface>[?<params>]`

- `moudel` 为方便组织，所有公共API都被分组在特定的模块里；
- `sub_moudel` 子模块；
- `version` 为避免今后api更改带来麻烦，每个模块的API都设定版本号；
- `interface` 每个模块包括很多接口，每个接口都提供不同的功能；

例如，调用`standard`模块的`zzjg`接口：
`https://api.ynu.edu.cn/standard/v1/zzjg`

### 特别注意
- API默认使用`GET` 方法调用；
- 所有API均提供跨域调用（CORS）。

## 返回值说明
所有请求的返回值包括两种类型：

- 操作成功返回：

```javascript
{
  ret: 0,   // 操作成功时，返回码为0
  data: ... // 操作返回的数据
}
```

- 操作失败返回：

```javascript
{
  ret: 401, // 操作失败时，返回码为非0值
  msg: ""   // 错误提示
}
```

## 模块列表

| 模块名称 | 描述 | 版本 |
| --- | --- | --- |
| standard | 公共代码标准 | [v1](./standard-v1.md) |
| ecard | 一卡通系统 | [v1](./ecard-v1/README.md) |
| tsg-lb | 图书馆机房负载均衡系统 | [v1](./tsg-lb-v1/README.md) |
| fc | FusionCompute虚拟化平台 | [v1](./fc-v1/README.md) |
| elearning | 网络教学平台 | v1 |
| email | 电子邮件 | v1 |
| library | 图书馆 | v1 |


## 资源
### 网站favicon

![favicon](http://www.ynu.edu.cn/favicon.ico)

### 统一身份认证登录按钮

![32](media/48.png)(48)


![32](media/32.png)(32)

![24](media/24.png)(24)

![18](media/18.png)(18)






