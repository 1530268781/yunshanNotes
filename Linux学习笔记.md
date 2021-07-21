### 第一章 Linux的目录结构

#### 1.1 基本介绍

- 在 Linux 世界里，<font color='orange'>一切皆文件</font>
- linux 的文件系统是采用级层式的<font color='orange'>树状目录结构</font>，在此结构中的最上层是根目录

“/”，然后在此目录下再创建其他的目录。

- 结构图：

  ![img](Linux%E5%AD%A6%E4%B9%A0%E7%AC%94%E8%AE%B0/d0c50-linux2bfile2bsystem2bhierarchy.jpg)

  ![image-20210720151643657](Linux%E5%AD%A6%E4%B9%A0%E7%AC%94%E8%AE%B0/image-20210720151643657.png)



#### 1.2 目录介绍

  - **/bin**：(usr/bin)<font color='red'>[重点]</font>
    bin 是 Binaries (二进制文件) 的缩写, 这个目录存放着最<font color='orange'>经常使用的命令</font>。

  - **/boot：**
    这里存放的是启动 Linux 时使用的一些核心文件，包括一些<font color='orange'>链接文件</font>以及[镜像文件](https://zhidao.baidu.com/question/383464901.html)。

  - **/dev ：**
    dev 是 Device(设备) 的缩写, 该目录下存放的是 Linux 的外部设备，在 Linux 中访问设备的方式和访问文件的方式是相同的(一切皆是文件)。

  - **/etc：**<font color='red'>[重点]</font>
    etc 是 Etcetera(等等) 的缩写,这个目录用来存放所有的<font color='orange'>系统管理</font>所需要的配置文件和子目录。

  - **/home**：<font color='red'>[重点]</font>
    用户的主目录，在 Linux 中，每个用户都有一个自己的目录，一般该目录名是以用户的账号命名的，如上图中的 alice、bob 和 eve。

  - **/lib**：
    lib 是 Library(库) 的缩写这个目录里存放着系统最基本的<font color='orange'>动态连接共享库</font>，其作用类似于 Windows 里的 DLL 文件。几乎所有的应用程序都需要用到这些共享库

  - **/lost+found**：
    这个目录一般情况下是空的，当系统非法关机后，这里就存放了一些文件。

  - **/mnt**：<font color='red'>[重点]</font>
    系统提供该目录是为了让用户<font color='orange'>临时挂载别的文件系统</font>的，我们可以将光驱挂载在 /mnt/ 上，然后进入该目录就可以查看光驱里的内容了。

  - **/opt**：<font color='red'>[重点]</font>
    opt 是 optional(可选) 的缩写，这是给主机<font color='orange'>额外安装软件</font>所摆放的目录。比如你安装一个ORACLE数据库则就可以放到这个目录下。默认是空的。

  - **/proc**：
    proc 是 Processes(进程) 的缩写，/proc 是一种伪文件系统（也即虚拟文件系统），存储的是<font color='orange'>当前内核运行状态</font>的一系列特殊文件，这个目录是一个虚拟的目录，它是系统内存的映射，我们可以通过直接访问这个目录来获取系统信息。
    这个目录的内容不在硬盘上而是在内存里，我们也可以直接修改里面的某些文件，比如可以通过下面的命令来屏蔽主机的ping命令，使别人无法ping你的机器：
    
    ```shell
     echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all  
    ```
    
  - **/root**：<font color='red'>[重点]</font>
    该目录为系统管理员，也称作超级权限者的用户主目录

  - **/run**：
    是一个临时文件系统，<font color='orange'>存储系统启动以来的信息</font>。当系统重启时，这个目录下的文件应该被删掉或清除。如果你的系统上有 /var/run 目录，应该让它指向 run。

  - **/sbin**：
    s 就是 Super User 的意思，是 Superuser Binaries (超级用户的二进制文件) 的缩写，这里存放的是系统管理员使用的<font color='orange'>系统管理程序</font>。

  - **/srv**：
    该目录存放一些服务启动之后需要提取的数据。

  - **/sys**：

    这是 Linux2.6 内核的一个很大的变化。该目录下安装了 2.6 内核中新出现的一个文件系统 sysfs 。

    sysfs 文件系统集成了下面3种文件系统的信息：针对进程信息的 proc 文件系统、针对设备的 devfs 文件系统以及针对伪终端的 devpts 文件系统。

    该文件系统是内核设备树的一个直观反映。

    当一个内核对象被创建的时候，对应的文件和目录也在内核对象子系统中被创建。

  - **/tmp**：
    tmp 是 temporary(临时) 的缩写这个目录是用来存放一些临时文件的。

  - **/usr**：
    usr 是 unix shared resources(共享资源) 的缩写，这是一个非常重要的目录，<font color='orange'>用户的很多应用程序和文件</font>都放在这个目录下，类似于 windows 下的 program files 目录。

    - **/usr/bin：**
      系统用户使用的应用程序。
      
    - **/usr/sbin：**
      超级用户使用的比较高级的管理程序和系统守护程序。
      
    - **/usr/src：**
      内核源代码默认的放置目录。
      
    - **/usr/local：**<font color='red'>[重点]</font>

      这是另一个给主机额外安装软件所安装的目录。一般是通过编译源码方式安装的程序。

  - **/var**：<font color='red'>[重点]</font>
    var 是 variable(变量) 的缩写，这个目录中存放着在不断扩充着的东西，我们习惯将那些经常被修改的目录放在这个目录下。包括各种日志文件。

  - **/media**：<font color='red'>[重点]</font>
    linux 系统会自动识别一些设备，例如U盘、光驱等等，当识别后，Linux 会把识别的设备挂载到这个目录下。

  - **/selinux**：
     这个目录是 Redhat/CentOS 所特有的目录，Selinux 是一个安全机制，类似于 windows 的防火墙，但是这套机制比较复杂，这个目录就是存放selinux相关的文件的。



#### 1.3 总结

1. Linux有且只有一个根目录 /
2. Linux的各个目录的内容是规划好的，不要乱放文件
3. Linux以文件形式管理我们的设备，一切皆文件
4. 几个特殊目录的标识：
   - 根目录：/ 
   - 当前目录：. or ./
   - 上一级目录：.. or ../
   - 家目录：~ or ~/



### 第二章 Linux常用命令

#### 2.0 通配符与命令格式

##### (1)通配符

- *：匹配0或多个任意字符
- ？：匹配单个任意字符
- [ ]：匹配一组字符中的单个，如[1-5] [a-f]

##### (2)命令格式

​	命令格式 ：命令 [-选项] [参数] 

​	例 ： ls -la /etc 

​	说明：1）个别命令使用不遵循此格式

​		       2）当有多个选项时，可以写在一起

​		       3）简化选项与完整选项-a 等于 --all



#### 2.1 文件处理命令ls

##### (1) <font color='red'>ls</font>

- 命令英文原意：<font color='orange'>l</font>i<font color='orange'>s</font>t 

- 命令所在路径：/bin/ls 

- 执行权限：所有用户

- 功能描述：显示目录文件

- 语法：ls 选项[-ald] [文件或目录] 
  - <font color='orange'>-a </font>（--all）显示所有文件，包括隐藏文件
  - <font color='orange'>-l</font> (--list) 详细信息显示（权限，所有者等）
  - -m (--format=commas) 用逗号分隔的列表显示
  - -d 查看目录属性
  - -1（--format=single-column）用单独一列的方式查看结果
  - -r (--reverse) 以反序来显示
  - -X (--sort==extension) 根据文件扩展名进行字母顺序排序
  - <font color='orange'>-t</font> (--sort==time) 根据日期和时间排序
  - -<font color='orange'>S</font> (--sort==size) 根据文件大小排序
  - <font color='orange'>-h</font> (--human-readable) 用 K M G 显示文件大小
  - -R （--recursive）递归遍历目录，显示该目录及其子目录的内容
  - -F (--classify) 显示文件的类型，*代表可执行文件，/代表目录
  - --color 用不同颜色显示文件类型，绿：可执行文件，蓝：文件夹，黑：普通

	```shell
	#举例：
	ls -al		#显示所有文件详细信息
	ls -alh		#显示所有文件详细信息（包括文件大小）
	ls -alhS	#按文件大小排序显示所有文件详细信息
	```
	
	tip: 显示详细信息第一列字符 -rwxr-xr-x含义，分为四个字段- rwx r-x r-x
	
	- 第一个字段：- 表示二进制文件，d 表示目录，l 表示软链接文件
	- 第二个字段：u所有者权限。r、w、x分别表示读、写、执行，- 表示无对应权限
	- 第三个字段：g所属组权限
	- 第四个字段：o其他人权限



#### 2.2 目录处理命令

##### （1）<font color='red'>mkdir</font>

- 命令英文原意：<font color='orange'>m</font>a<font color='orange'>k</font>e <font color='orange'>dir</font>ectories 

- 命令所在路径：/bin/mkdir 

- 执行权限：所有用户

- 语法：mkdir -p  [目录名]

- 功能描述：创建新目录    -p 递归创建( -p 可以递归创建 在没有一级目录的情况下新创建二级目录)

- tip：创建目录 在/tmp/目录下创建临时文件 只能创建/tmp/......二级目录

- 范例： 

  ```shell
  $ mkdir -p /tmp/Japan/boduo    #(不存在Japan目录，所以要用-p递归创建)
  $ mkdir /tmp/Japan/longze /tmp/Japan/cangjing
  ```


##### （2）<font color='red'>rmdir</font>

- 命令英文原意：<font color='orange'>r</font>emove e<font color='orange'>m</font>pty <font color='orange'>dir</font>ectories 

- 命令所在路径：/bin/rmdir 

- 执行权限：所有用户

- 语法：rmdir [目录名] 

- 功能描述： 删除空目录，只能删除没有文件的空目录 （不经常使用）

- 范例： 

  ```shell
  $ rmdir /tmp/Japan/boduo
  ```


##### （3）<font color='red'>cd</font>

- 命令英文原意：<font color='orange'>c</font>hange <font color='orange'>d</font>irectory 

- 命令所在路径：shell 内置

- 命令执行权限：所有用户

- 语法：cd [目录] 

- 功能描述：切换目录

- 范例： 

  ```shell
  $ cd /tmp/Japan/boduo #切换到指定目录
  $ cd .. #回到上一级目录
  $cd / #回到根目录
  ```


##### （4）<font color='red'>pwd </font>

- 命令英文原意： <font color='orange'>p</font>rint <font color='orange'>w</font>orking <font color='orange'>d</font>irectory 
- 命令所在路径：/bin/pwd 
- 执行权限：所有用户
- 语法：pwd 
- 功能描述：显示当前目录
- 范例：$ pwd 

##### （5）<font color='red'>cp</font>

- 命令英文原意：<font color='orange'>c</font>o<font color='orange'>p</font>y 

- 命令所在路径：/bin/cp 

- 执行权限：所有用户

- 语法：cp -rp [原文件或目录] [目标目录] 
  - -r 复制目录
  - -p 保留文件属性，比如保留创建时间，日志文件的复制需要用到

- 功能描述：复制文件或目录

- 范例：

  ```shell
  $ cp -r /tmp/Japan/cangjing /root 
  #将目录/tmp/Japan/cangjing 复制到目录/root 下
  
  $ cp -rp /tmp/Japan/boduo /tmp/Japan/longze /root 
  #将/tmp/Japan 目录下的 boduo 和 longze 目录复制到/root 下，保持目录属性
  ```

##### （6）<font color='red'>rm</font>

- 命令英文原意：<font color='orange'>r</font>e<font color='orange'>m</font>ove 


- 命令所在路径：/bin/rm 


- 执行权限：所有用户


- 语法：rm -rf [文件或目录] 
  - -r 删除目录，一般是rm -rf 连着用
  - -f 强制执行，不在询问

- 功能描述：删除文件


- 范例：

  ```shell
  $ rm /tmp/yum.log 
  #删除文件/tmp/yum.log 
  
  $ rm -rf /tmp/Japan/longze 
  #删除目录/tmp/Japan/longze
  ```



#### 2.3 文件处理命令

##### (1) <font color='red'>touch</font>

- 命令所在路径：/bin/touch 

- 执行权限：所有用户

- 语法：touch [文件名] 或 touch[绝对路径+文件名]

- 功能描述：创建空文件

- 范例： $ touch Japanlovestory.list

##### (2) <font color='red'>cat</font>

- 命令所在路径：/bin/cat 

- 执行权限：所有用户

- 语法：cat [文件名] 

- 功能描述：显示文件内容 
  -  -n 显示行号
  - -A 显示隐藏字符

- 范例： 
  - $ cat /etc/issue 
  - $ cat -n /etc/services

##### (3) <font color='red'>more</font>

- 命令所在路径：/bin/more 

- 执行权限：所有用户

- 语法：more [文件名] 
  -  (空格) 或 f 翻页 
  -  (Enter) 换行 
  -  q 或 Q 退出

- 功能描述：分页显示文件内容,合长的文件内容

- 范例： $ more /etc/services

##### (4) <font color='red'>less</font>

- 命令所在路径：/usr/bin/less 执行权限：所有用户

- 语法：less [文件名] 

- 功能描述：分页显示文件内容（可向上翻页）

- 范例： $ less /etc/services

- **tips: 按下 / 后可以搜索,会反显高亮 按 q 退出（more 也可以）**

##### (5) <font color='red'>head</font>

- 命令所在路径：/usr/bin/head 

- 执行权限：所有用户

- 语法：head [文件名] 

- 功能描述：显示文件前面几行 
  - -n 指定行数

- 范例： $ head -n 20 /etc/services

##### (6) <font color='red'>tail</font>

- 命令所在路径：/usr/bin/tail 

- 执行权限：所有用户

- 语法：tail [文件名] 

- 功能描述：显示文件后面几行 
  -  -n 指定行数 
  -  -f 动态显示文件末尾内容

- 范例： $ tail -n 18 /etc/services
