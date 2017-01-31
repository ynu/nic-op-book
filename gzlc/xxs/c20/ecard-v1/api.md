# 一卡通模块API参考（v1）
## 商户(Shop)
### 获取所有商户的信息
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

### 获取指定商户信息
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

### 获取指定日期所有商户的日账单
`GET /shop/all/daily-bill/:accDate?token=TOKEN`

- 参数
  - `accDate` 账单日期。8位数字的日期，格式为`YYYYMMDD`，例如：`20170119`；
  - `token` 访问系统的token。
  
- 返回值

```javascript
{
  ret: 0,
  data: { ... } // ShopBill 对象
}
```

### 获取指定商户单日账单
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

### 获取指定商户日账单列表
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

### 获取子商户单日账单列表
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
### 获取所属商户的设备的日账单列表
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

### 获取指定商户单月账单
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

### 获取子商户月账单列表
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
### 获取所属商户的设备的月账单列表
`GET /shop/:shopId/device-monthly-bills/:accDate?token=TOKEN`

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

### 获取指定商户节点的所有祖先节点

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








