# FC平台接口参考（v1）

- [站点(site)](#1)
	- [查询所有站点信息](#1-1)
	
- [集群(cluster)](#2)
	- [查询集群列表](#2-1)
	- [查询集群内计算资源统计信息](#2-2)
	- [查询集群详情](#2-3)

- [主机(host)](#3)
	- [查询主机列表](#3-1)
	- [查询指定主机](#3-2)
	- [查询主机列表统计信息](#3-3)
	- [查询指定主机计算资源使用情况](#3-4)

- [虚拟机(vm)](#4)
	- [分页查询虚拟机信息](#4-1)
	- [查询虚拟机详情](#4-2)
	- [查询指定站点支持创建虚拟机操作系统的版本](#4-3)
	- [查询虚拟机统计信息](#4-4)
	- [查询指定虚拟机的快照列表](#4-5)
	- [查询指定的虚拟机快照信息](#4-6)

- [告警](#5)
	- [查询活动告警](#5-1)
	- [查询历史告警](#5-2)
	- [查询事件列表功能](#5-3)
	- [查询所有阈值项信息](#5-4)

- [存储](#6)
	- [分页查询站点/主机/集群下所有数据存储](#6-1)
	- [分页查询集群/主机下可模板部署的所有数据存储](#6-2)
	- [查询指定数据存储](#6-3)

- [网络](#7)

- [卷](#8)
	- [分页查询卷列表](#8-1)
	- [查询指定卷](#8-2)
	- [分页根据DataStore查询所有卷](#8-3)

## <span id="#1" /> 站点

### <span id="#1-1" /> 查询所有站点信息

`GET /site?token=TOKEN`

- 参数
  - `token` 访问系统的token。
  
- 返回值

```javascript
{
	 result: [{
	     urn: "urn:sites:3F7B07E2",
	     uri: "/service/sites/3F7B07E2",
	     name: "site",
	     ip: "202.203.209.74",
	     isDC: false,
	     isSelf: true,
	     status: "normal"
	 }],
	 errorCode: "00000000",
	 errorDes: null
}
```

## <span id="#2" /> 集群

### <span id="#2-1" /> 查询集群列表

`GET /site/:siteUri/cluster?tag=TAG&name=NAME&token=TOKEN`

- 参数
	- `siteUri` 站点URI；
  	- `token` 访问系统的token。
  
- 返回值

```javascript
{
	 result: [{
	     urn: "urn:sites:3F7B07E2:clusters:79",
	     uri: "/service/sites/3F7B07E2/clusters/79",
	     name: "ManagementCluster",
	     parentObjUrn: null,
	     parentObjName: null,
	     description: "管理和测试集群",
	     cpuResource: {
	         totalSizeMHz: 180000,
	         allocatedSizeMHz: 20000,
	         allocatedVcpus: null
	     },
	     memResource: {
	         totalSizeMB: 725862,
	         allocatedSizeMB: 149471
	     },
	     tag: "domain/default",
	     params: null
	 }],
	 errorCode: "00000000",
	 errorDes: null
}	 
```

### <span id="#2-2" /> 查询集群内计算资源统计信息

`GET /site/:siteUri/computerResource/:clusterUri?token=TOKEN`

- 参数
	- `siteUri` 站点URI；
	- `clusterUri` 集群URI；
  	- `token` 访问系统的token。
  
- 返回值

```javascript
{
	 result: {
	     totalSizeMHz: 180000,
	     allocatedSizeMHz: 20000,
	     totalSizeMB: 725862,
	     allocatedSizeMB: 149471,
	     allocatedVcpus: 184
	 },
	 errorCode: "00000000",
	 errorDes: null
}	 
```

### <span id="#2-3" /> 查询集群详情

`GET /site/:siteUri/cluster/:clusterUri?tag=TAG&name=NAME&token=TOKEN`

- 参数
	- `siteUri` 站点URI；
	- `clusterUri` 集群URI；
  	- `token` 访问系统的token。
  
- 返回值

```javascript
{
	 result: {
	 urn: "urn:sites:3F7B07E2:clusters:79",
	      uri: "/service/sites/3F7B07E2/clusters/79",
	      name: "ManagementCluster",
	      parentObjUrn: null,
	      description: "管理和测试集群",
	      tag: "domain/default",
	      isMemOvercommit: true,
	      isEnableHa: true,
	      haResSetting: {
	         isControlPolicy: false,
	         controlPolicy: null,
	         cpuReservation: 0,
	         memoryReservation: 0,
	         hostsFaultQuantity: 1,
	         isCustomisedSlot: false,
	         slotcpuinmhz: 153600,
	         slotmeminmb: 1048576,
	         failoverHosts: [],
	         isAutoMigrateAllVms: false,
	         isHaHostAutonomy: false,
	         hbDataStorePolicy: 0,
	         hbDataStorePreferred: [],
	         hbDataStoreNumber: 0,
	         isolateArbitrateAddress: ""
	     },
	      isEnableDrs: false,
	      drsSetting: {
	         drsLevel: 3,
	         drsFragmentLimen: [{
	             fragmentTime: 0,
	             limen: 5
	         }, {
	             fragmentTime: 1,
	             limen: 5
	         }],
	         drsCycle: {
	             cycleType: 1,
	             cycleSpec: null
	         },
	         drsRules: [],
	         powerLevel: 0,
	         powerLimen: 3,
	         powerFragmentLimen: [{
	             fragmentTime: 0,
	             limen: 5
	         }, {
	             fragmentTime: 1,
	             limen: 5
	         }],
	         dpmCycle: {
	             cycleType: 1,
	             cycleSpec: null
	         },
	         factor: 3,
	         drsThreshold: {
	             cpu: 0,
	             memory: 0
	         },
	         dpmThresholds: [{
	             limen: 1,
	             underloadThreshold: 0,
	             overloadThreshold: 63
	         }, {
	             limen: 3,
	             underloadThreshold: 23,
	             overloadThreshold: 72
	         }],
	         electricStrategy: 1
	     },
	      drsExtensionConfig: [],
	      statistics: "/service/sites/3F7B07E2/clusters/79/statistics",
	      resStrategy: "loadBalance",
	      isEnableImc: false,
	      imcSetting: null,
	      maxCpuQuantity: 36,
	      enableVmDrs: false,
	      drsVmConfig: [],
	      enableGuestNuma: false,
	      enableHostNumaDRS: false,
	      enableIOTailor: true,
	      params: {
	         enableVmIORingAdaptation: "false",
	         hanaOptimizedStrategy: "false",
	         enableIORingAdaptation: "false"
	     },
	      dsFaultStrategy: 0,
	      parentObjName: null
	 },
	 errorCode: "00000000",
	 errorDes: null
}	 
```

## <span id="#3" /> 主机

## <span id="#4" /> 虚拟机

## <span id="#5" /> 告警

### <span id="#5-1" /> 查询活动告警

`GET /site/:siteUri/alarm/activeAlarm?token=TOKEN`

- 参数
	- `siteUri` 站点URI；
  	- `token` 访问系统的token。
  
- 返回值

```javascript
	 {
	 result: {
	     total: 35,
	     list: [{
	         iSerialNo: 55829,
	         svAlarmID: "15.1000102",
	         objectType: "否",
	         objectUrn: "urn:sites:3F7B07E2:vms:i-000001D0",
	         urnByName: "LOC-MongoDB1",
	         svAlarmName: "虚拟机内存占用率超过阈值",
	         iAlarmCategory: "原始告警",
	         iAlarmLevel: "次要",
	         iClearType: "-",
	         dtOccurTime: "1487701980000",
	         dtUpdateTime: "1487815200000",
	         dtClearTime: "-",
	         svClearAlarmUserName: "-",
	         svAdditionalInfo: "当前阈值\u003d80.0%,虚拟机内存占用率\u003d79.89%",
	         svAlarmCause: "-",
	         svEventType: "设备事件",
	         iAutoClear: "是",
	         iAffectOpFlag: "影响",
	         dtArrivedTime: "1487701998157",
	         svLocationInfo: "-",
	         svMoc: "vms",
	         iDisplay: "未屏蔽",
	         iParse: "0",
	         iSyncNo: "139796"
	 	}]
	 },
	 errorCode: "00000000",
	 errorDes: null
}
```


## <span id="#6" /> 存储

## <span id="#7" /> 网络

