# 一卡通模块API参考（v1）

- [商户(Shop)](#1)
	- 商户信息
		- [获取所有商户的信息](#1.1)
		- [获取指定商户信息](#1.2)
		- [获取指定商户节点的所有祖先节点](#1.3)
	- 日账单
		- [获取指定日期所有商户的日账单](#1.4)
		- [获取指定商户单日账单](#1.5)
		- [获取指定商户日账单列表](#1.6)
		- [获取子商户单日账单列表](#1.7)
		- [获取所属商户的设备的日账单列表](#1.8)
	- 月账单
		- [获取指定日期所有商户的月账单](#1.3.1)
		- [获取指定商户单月账单](#1.3.2)
		- [获取子商户单月账单列表](#1.3.3)
- [操作员(operator)](#2)
	- 日账单
		- [获取指定日期所有操作员的日账单](#2.1.1)
		- [获取指定操作员单日账单](#2.1.2)

## <span id="1" /> 商户(Shop)

### <span id="1.1" /> 获取所有商户的信息

`GET /shop/all?token=TOKEN`

- 参数
  - `token` 访问系统的token。
  
- 返回值

```javascript
{
  ret: 0,
  data: { ... } // Shop 对象
}
```

### <span id="1.2" /> 获取指定商户信息
`GET /shop/:shopId?token=TOKEN`

- 参数
  - `shopId` 指定的商户Id；
  - `token` 访问系统的token。
  
- 返回值

```javascript
{
  ret: 0,
  data: { ... } // Shop 对象
}
```

### <span id="1.3" /> 获取指定商户节点的所有祖先节点

`GET /shop/:shopId/ancestors?token=TOKEN`

- 参数
  - `shopId` 指定的商户Id；
  - `token` 访问系统的token。

- 返回值

```javascript
{
  ret: 0,
  data: [ ... ] // Shop 对象数组
}
```

### <span id="1.4" /> 获取指定日期所有商户的日账单
`GET /shop/all/daily-bill/:accDate?token=TOKEN`

- 参数
  - `accDate` 账单日期。8位数字的日期，格式为`YYYYMMDD`，例如：`20170119`；
  - `token` 访问系统的token。
  
- 返回值

```javascript
{
  ret: 0,
  data: [ ... ] // ShopBill 对象列表
}
```

### <span id="1.5" /> 获取指定商户单日账单
`GET /shop/:shopId/daily-bill/:accDate?token=TOKEN`

- 参数
  - `shopId` 指定的商户Id；
  - `accDate` 账单日期。8位数字的日期，格式为`YYYYMMDD`，例如：`20170119`；
  - `token` 访问系统的token。
  
- 返回值

```javascript
{
  ret: 0,
  data: { ... } // ShopBill 对象
}
```

### <span id="1.6" /> 获取指定商户日账单列表
`GET /shop/:shopId/daily-bill?token=TOKEN`

- 参数
  - `shopId` 指定的商户Id；
  - `token` 访问系统的token。
  
- 返回值

```javascript
{
  ret: 0,
  data: [ ... ] // ShopBill 对象数组
}
```

### <span id="1.7" /> 获取子商户单日账单列表
`GET /shop/:fShopId/sub-shop-daily-bills/:accDate?token=TOKEN`

- 参数
  - `fShopId` 指定的父商户Id；
  - `accDate` 账单日期。8位数字的日期，格式为`YYYYMMDD`，例如：`20170119`；
  - `token` 访问系统的token。
  
- 返回值

```javascript
{
  ret: 0,
  data: [ ... ] // ShopBill 对象数组
}
```
### <span id="1.8" /> 获取所属商户的设备的日账单列表
`GET /shop/:shopId/device-dayly-bills/:accDate?token=TOKEN`

- 参数
  - `shopId` 指定的商户Id；
  - `accDate` 账单日期。8位数字的日期，格式为`YYYYMMDD`，例如：`20170119`；
  - `token` 访问系统的token。
  
- 返回值

```javascript
{
  ret: 0,
  data: [ ... ] // DeviceBill 对象数组
}
```

### <span id="1.3.1" /> 获取指定日期所有商户的月账单

`GET /shop/all/monthly-bill/:accDate?token=TOKEN`

- 参数
  - `accDate` 账单日期。6位数字的日期，格式为`YYYYMM`，例如：`201701`；
  - `token` 访问系统的token。
  
- 返回值

```javascript
{
  ret: 0,
  data: [ ... ] // ShopBill 对象数组
}
```

### <span id="1.3.2" /> 获取指定商户单月账单
`GET /shop/:shopId/monthly-bill/:accDate?token=TOKEN`

- 参数
  - `shopId` 指定的商户Id；
  - `accDate` 账单日期。6位数字的日期，格式为`YYYYMM`，例如：`201701`；
  - `token` 访问系统的token。
  
- 返回值

```javascript
{
  ret: 0,
  data: { ... } // ShopBill 对象
}
```

### <span id="1.3.3" /> 获取子商户月账单列表
`GET /shop/:fShopId/sub-shop-monthly-bills/:accDate?token=TOKEN`

- 参数
  - `fShopId` 指定的父商户Id；
  - `accDate` 账单日期。8位数字的日期，格式为`YYYYMM`，例如：`201701`；
  - `token` 访问系统的token。

- 返回值

```javascript
{
  ret: 0,
  data: [ ... ] // ShopBill 对象数组
}
```

### <span id="1.3.4" /> 获取子商户单月账单列表

`GET /shop/:shopId/sub-shop-monthly-bills/:accDate?token=TOKEN`

- 参数
  - `shopId` 指定的商户Id；
  - `accDate` 账单日期。8位数字的日期，格式为`YYYYMM`，例如：`201701`；
  - `token` 访问系统的token。

- 返回值

```javascript
{
  ret: 0,
  data: [ ... ] // DeviceBill 对象数组
}
```

## <span id="2" /> 操作员（operator）

### <span id="2.1.1" />  获取指定日期所有操作员的日账单

`GET /operator/all/daily-bill/:accDate?token=TOKEN`

- 参数
  - `accDate` 账单日期。8位数字的日期，格式为`YYYYMMDD`，例如：`20170119`；
  - `token` 访问系统的token。
  
- 返回值

```javascript
{
  ret: 0,
  data: [ ... ] // OperatorBill 对象列表
}
```

### <span id="2.1.2" /> 获取指定操作员单日账单

`GET /operator/:operatorCode/daily-bill/:accDate?token=TOKEN`

- 参数
  - `operatorCode` 指定的操作员；
  - `accDate` 账单日期。8位数字的日期，格式为`YYYYMMDD`，例如：`20170119`；
  - `token` 访问系统的token。
  
- 返回值

```javascript
{
  ret: 0,
  data: { ... } // OperatorBill 对象
}
```



