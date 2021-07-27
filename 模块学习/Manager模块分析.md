``对Manager模块代码阅读的一些笔记``

~~Manager模块的作用：管理系统日志，包括数据库中系统日志数据的清理、添加、获取，与产品环境web页面的交互等~~



阅读工程源码思路：

​	熟悉工程代码的时候，可以先找一个[API](https://baike.baidu.com/item/Web%20API/4102287?fr=aladdin)，先通过[curl](https://baike.baidu.com/item/curl/10098606?fr=aladdin)或者[postman](https://www.jianshu.com/p/97ba64888894)把API调用成功，然后去工程里从main入口开始，了解这个API的一个完整的执行过程，先把这个API中间用到的函数了解清楚，其他无关的可以先忽略，不然容易被很多无关代码分散注意力。工程里的代码会有很多，可以先把骨架脉络摸清，后面再去填充一些细节的东西，这样效率可能会高些。



manager模块的功能：

​	manager模块是web服务器程序的一部分，其主要功能是为web客户端（或者其他模块）提供读取日志信息的API。如web客户端要查询系统日志，（会先调用network-orchestration里的API,NO里（syslog.py）是调用manager的API，NO只是透传了manager返回的数据）会调用这个API，及向web服务器发送一个get请求（带参数，如 [http://127.0.0.1:22110/v1/syslog/1559060880/1559282480/?page_index=1&page_size=5&query=%20](http://127.0.0.1:22110/v1/syslog/1559060880/1559282480/\?page_index=1\&page_size=5\&query= )）；当web服务器接收到这个get请求时，会交给manager模块进行处理（根据参数从数据库中获取客户端想要的系统日志信息），然后将这些数据返回给web客户端显示到界面。

​	而manager模块只读不写，系统日志是通过其他模块写到数据库中的。manager还提供了清理系统日志等功能。



其他：

​	manager是一个比较简单的工程，里面只对应一个进程，看工程代码的时候，建议先找到server文件（就是程序入口，含有main函数的文件，每个工程里命名可能不同，manager里对应的manager.py），可以知道主要代码逻辑是怎么组织的。

​	以func_session_executor为例，他其实是一个装饰器的具体实现，主要作用是在装饰器所修饰的函数前后想做些额外的操作，然后可能很多函数都得有这个逻辑，就可以写个装饰器。不过manager里面其实并没有用到。



分析图：

![](Manager%E6%A8%A1%E5%9D%97%E5%88%86%E6%9E%90/Manager%E6%A8%A1%E5%9D%97-%E5%87%BD%E6%95%B0%E8%B0%83%E7%94%A8%E5%85%B3%E7%B3%BB%E5%9B%BE.jpg)

文字说明：

manager模块主要功能是提供获取系统日志的API，以及清理系统日志等。

- manager.py

从manager.py文件的main函数开始分析，先进行了logger初始化；

其次的signal.signal()函数【有问题】；

然后调用了“系统日志清理者”launch_syslog_cleanup_worker()；

最后启动了WSGI（web服务器网关接口）服务。



- logger.py

init( )【有问题】



- data.py

与数据库进行交互，从数据库获取系统日志数据，封装成一个系统日志类Syslog，实例交给syslog_work.py来处理【细节不太理解】



- syslog_work.py

包含两个核心函数，一个是用来获取系统日志的API函数get_syslog( )，大概是根据传入的参数获取到一个系统日志类实例，然后将这个实例携带的数据封装成一个response响应，返回给客户端。【这部分的细节的再看看】



- syslog_app.py

响应请求，运行API函数并返回信息。



