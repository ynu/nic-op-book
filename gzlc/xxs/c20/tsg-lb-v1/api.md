# 负载均衡设备API参考（v1）

- [设备](#device)
	- [获取当前设备CPU使用信息](#device-cpu-usage)
	- [获取当前设备内存使用信息](#device-memory)
	- [获取当前设备风扇状态](#device-fan)
	- [获取当前设备电源信息](#device-power)
	- [获取当前设备环境信息](#device-environment)
- [网络接口](#interface)
	- [获取接口信息](#interface-get)
	- [获取各接口入流量统计](#interface-counters-inbound)
	- [获取各接口出流量统计](#interface-counters-outbound)
- [服务器负载均衡](#lb)
	- [获取虚服务列表](#lb-vs)
	- [获取实服务组列表](#lb-sf)
	- [获取实服务器列表](#lb-rs)
	- [获取负载均衡策略列表](#lb-policy)
	- [获取负载均衡流分类器列表](#lb-class)
	- [获取负载均衡动作列表](#lb-action)


## <span id="device" /> 设备

### <span id="device-cpu-usage" /> 获取当前设备CPU使用信息

`GET /device/cpu-usage?token=TOKEN`

- 参数
  - `token` 访问系统的token。
  
- 返回值

```javascript
{
  ret: 0,
  data: { ... } // 设备CPU信息
}
```

### <span id="device-memory" />  获取当前设备内存使用信息

`GET /device/memory?token=TOKEN`

- 参数
  - `token` 访问系统的token。
  
- 返回值

```javascript
{
  ret: 0,
  data: { ... } // 设备内存信息
}
```

### <span id="device-fan" />  获取当前设备风扇信息

`GET /device/fan?token=TOKEN`

- 参数
  - `token` 访问系统的token。
  
- 返回值

```javascript
{
  ret: 0,
  data: { ... } // 设备风扇信息
}
```

### <span id="device-power" />  获取当前设备电源信息

`GET /device/power?token=TOKEN`

- 参数
  - `token` 访问系统的token。
  
- 返回值

```javascript
{
  ret: 0,
  data: { ... } // 设备电源信息
}
```

### <span id="device-environment" />  获取当前设备环境信息

`GET /device/environment?token=TOKEN`

- 参数
  - `token` 访问系统的token。
  
- 返回值

```javascript
{
  ret: 0,
  data: { ... } // 设备环境信息
}
```

