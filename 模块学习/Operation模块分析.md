``operation
	api/operation.py
	driver/operation.py
	overlay/operation.py``



主要功能：

​		提供获取系统配置的api。包括配置下载、配置读取、配置对比、获取配置列表、获取VRF列表、获取设备bridge domain、获取物理设备mac地址、获取物理设备路由表、获取物理设备arp表、获取ping指定地址返回结果、获取tracert指定地址返回结果等11大功能。



代码思路：

- api/operation.py：提供api接口，接收api请求后，获取请求中的参数并交给overlay中的运维模块处理。

- overlay/operation.py：api核心（功能）函数的实现，根据request中的参数进行具体的处理，最后返回response
- driver/operation.py：OperationHttpApi，OperationDriver【？疑问】

​		

细节：（待分析……）



函数调用关系图：

![](Operation%E6%A8%A1%E5%9D%97%E5%88%86%E6%9E%90/Operation%E6%A8%A1%E5%9D%97-%E5%87%BD%E6%95%B0%E8%B0%83%E7%94%A8%E5%85%B3%E7%B3%BB%E5%9B%BE.jpg)

