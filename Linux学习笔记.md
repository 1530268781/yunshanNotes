## 第三章 Linux的目录结构

#### 3.1 基本介绍

- 在 Linux 世界里，<font color='orange'>一切皆文件</font>
- linux 的文件系统是采用级层式的<font color='orange'>树状目录结构</font>，在此结构中的最上层是根目录

“/”，然后在此目录下再创建其他的目录。

- 结构图：

  ![img](Linux%E5%AD%A6%E4%B9%A0%E7%AC%94%E8%AE%B0/d0c50-linux2bfile2bsystem2bhierarchy.jpg)

  ![image-20210720151643657](Linux%E5%AD%A6%E4%B9%A0%E7%AC%94%E8%AE%B0/image-20210720151643657.png)



#### 3.2 目录介绍

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



#### 3.3 总结

1. Linux有且只有一个根目录 /
2. Linux的各个目录的内容是规划好的，不要乱放文件
3. Linux以文件形式管理我们的设备，一切皆文件
4. 几个特殊目录的标识：
   - 根目录：/ 
   - 当前目录：. or ./
   - 上一级目录：.. or ../
   - 家目录：~ or ~/



## 第四章 Linux常用命令

### 4.1 文件处理命令

#### 4.1.0 通配符与命令格式

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



#### 4.1.1 文件处理命令ls

##### (1) <font color='red'>ls</font>

- 命令英文原意：<font color='orange'>l</font>i<font color='orange'>s</font>t 

- 命令所在路径：/bin/ls 

- 执行权限：所有用户

- 功能描述：显示目录文件

- 语法：<font color='orange'>ls 选项[-ald] [文件或目录] </font>

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



#### 4.1.2 目录处理命令

##### （1）<font color='red'>mkdir</font>

- 命令英文原意：<font color='orange'>m</font>a<font color='orange'>k</font>e <font color='orange'>dir</font>ectories 

- 命令所在路径：/bin/mkdir 

- 执行权限：所有用户

- 语法：<font color='orange'>mkdir -p  [目录名]</font>

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

- 语法：<font color='orange'>rmdir [目录名] </font>font>

- 功能描述： 删除空目录，只能删除没有文件的空目录 （不经常使用）

- 范例： 

  ```shell
  $ rmdir /tmp/Japan/boduo
  ```


##### （3）<font color='red'>cd</font>

- 命令英文原意：<font color='orange'>c</font>hange <font color='orange'>d</font>irectory 

- 命令所在路径：shell 内置

- 命令执行权限：所有用户

- 语法：<font color='orange'>cd [目录] </font>

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
- 语法：<font color='orange'>pwd </font>
- 功能描述：显示当前目录
- 范例：$ pwd 

##### （5）<font color='red'>cp</font>

- 命令英文原意：<font color='orange'>c</font>o<font color='orange'>p</font>y 

- 命令所在路径：/bin/cp 

- 执行权限：所有用户

- 语法：<font color='orange'>cp -rp [原文件或目录] [目标目录] </font>

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


- 语法：<font color='orange'>rm -rf [文件或目录] </font>font>
  - -r 删除目录，一般是rm -rf 连着用
  - -f 强制执行，不在询问

- 功能描述：删除文件或目录（-r）


- 范例：

  ```shell
  $ rm /tmp/yum.log 
  #删除文件/tmp/yum.log 
  
  $ rm -rf /tmp/Japan/longze 
  #删除目录/tmp/Japan/longze
  ```



#### 4.1.3 文件处理命令

##### (1) <font color='red'>touch</font>

- 命令所在路径：/bin/touch 

- 执行权限：所有用户

- 语法：<font color='orange'>touch [文件名] 或 touch[绝对路径+文件名]</font>

- 功能描述：创建空文件

- 范例： $ touch Japanlovestory.list

##### (2) <font color='red'>cat</font>

- 命令所在路径：/bin/cat 

- 执行权限：所有用户

- 语法：<font color='orange'>cat [文件名] </font>

- 功能描述：显示文件内容 
  -  -n 显示行号
  -  -A 显示隐藏字符

- 范例： 
  - $ cat /etc/issue 
  - $ cat -n /etc/services

##### (3) <font color='red'>more</font>

- 命令所在路径：/bin/more 

- 执行权限：所有用户

- 语法：<font color='orange'>more [文件名] </font>
  -  (空格) 或 f 翻页 
  -  (Enter) 换行 
  -  q 或 Q 退出

- 功能描述：分页显示文件内容,合长的文件内容

- 范例： $ more /etc/services

##### (4) <font color='red'>less</font>

- 命令所在路径：/usr/bin/less 执行权限：所有用户

- 语法：<font color='orange'>less [文件名] </font>

- 功能描述：分页显示文件内容（可向上翻页）

- 范例： $ less /etc/services

- **tips: 按下 / 后可以搜索,会反显高亮 按 q 退出（more 也可以）**

##### (5) <font color='red'>head</font>

- 命令所在路径：/usr/bin/head 

- 执行权限：所有用户

- 语法：<font color='orange'>head [文件名] </font>

- 功能描述：显示文件前面几行 
  - -n 指定行数

- 范例： $ head -n 20 /etc/services

##### (6) <font color='red'>tail</font>

- 命令所在路径：/usr/bin/tail 

- 执行权限：所有用户

- 语法：<font color='orange'>tail [文件名] </font>

- 功能描述：显示文件后面几行 
  -  -n 指定行数 
  -  -f 动态显示文件末尾内容

- 范例： $ tail -n 18 /etc/services



#### 4.1.4 文件链接命令

##### （5）<font color='red'>ln</font>

- 命令英文原意：link 

- 命令所在路径：/bin/ln 

- 执行权限：所有用户

- 语法：<font color='orange'>ln -s [原文件] [目标文件] </font>
  - -s 创建软链接

- 功能描述：生成链接文件

- 范例： 

  ```shell
  $ ln -s /etc/issue /tmp/issue.soft 
  
  #创建文件/etc/issue 的软链接/tmp/issue.soft 
  
  $ ln /etc/issue /tmp/issue.hard 
  
  #创建文件/etc/issue 的硬链接/tmp/issue.hard
  ```

- 软链接

  - 软链接的作用和Windows中的快捷方式是差不多的。他只不过是指向源文件安装路径的符号链接，所以大小也很小
  - 而且它的文件类型是lrwxrwxrwx 看似三种用户都可以拥有所有权限。其实，真正拥有的权限是源文件所决定的权限 ，所以这种显示也是软链接的一大特征之一。

- 硬链接

  - 硬链接就是把源文件拷贝到目标位置，而他与cp -p 最大的一点区别就是他可以同步更新，源文件有变化硬链接文件也会同时发生变化，但是如果源文件丢失或者被删除，硬链接也并不会消失
  - 可以通过i节点来区分，源文件和硬链接文件的<font color='orange'>i节点是一样的</font>，所以他们会同步更新
  - 但是他不能跨分区放置硬链接比如：/分区 硬链接 不能放到/boot 分区 
  - 而且不能对目录使用



### 4.2 权限管理命令

#### 4.2.1 权限管理命令 <font color='red'>chmod</font>

##### （1）chmod 

- 命令英文原意：<font color='orange'>ch</font>ange the permissions <font color='orange'>mod</font>e of a file 

- 命令所在路径：/bin/chmod 

- 执行权限：所有用户

- 语法：<font color='orange'>chmod [{ugoa}{+-=}{rwx}] [文件或目录] </font>

  -  -R 递归修改

  - u ：所有者    g ：所属组
    o ：其他人    a ：所有用户

    ```shell
    chmod g+x,o+r /tmp/testfile
    #就是把testfile文件的所属组增加执行权限，其他人增加读权限
    chmod a=rwx /tmp/testfile
    #就是testfile文件的所有用户增加读写执行权限
    ```

- 功能描述：改变文件或目录

- 权限权限的数字表示 ：chmod [rwx的和,rwx的和,rwx的和]] [文件或者目录]
  - r ---- 4  w ---- 2  x ---- 1

    例如：rwxrw-r- - 它的权限位数字表示就是 764
    具体算法：
    **r+w+x=4+2+1=7
    r+w=4+2+0=6
    r=4+0+0=4**

- chmod -R [rwx的和,rwx的和,rwx的和] [文件或目录]
  **这条命令与mkdir -p递归创建目录一样 这个命令把一个目录下的所有子目录的操作权限全部修改为同样的**



##### （2）创建用户命令

- useradd [用户名] 	创建普通用户
- passwd [用户名]      用户密码
- su - [用户名]             切换普通用户



##### （3）权限对文件和目录的含义

| 代表字符 | 权限 | 对文件的含义 | 对目录的含义 |
| -------- | ---- | ------------ | ------------ |
|r	|读权限	|可以查看文件内容 |可以cat/more/head/tail/less	|
|w	|写权限	|可以修改文件内容 可以vim	|可以在目录中创建，删除文件，可以touch/mkdir/rmdir/rm|
|x	|执行权限	|可以执行文件 可以script(脚本) command(命令)	|可以进入目录 可以cd|



#### 4.2.2 其他权限管理命令

##### （1）<font color='red'>chown</font>

- 命令英文原意：<font color='orange'>ch</font>ange file <font color='orange'>own</font>ership


- 命令所在路径：/bin/chown 


- 执行权限：所有用户


- 语法：<font color='orange'>chown [用户] [文件或目录] </font>


- 功能描述：改变文件或目录的所有者 范例：$ chown shenchao fengjie 


- 改变文件 fengjie 的所有者为 shenchao



##### （2）<font color='red'>chgrp </font>

- 命令英文原意：change file group ownership 


- 命令所在路径：/bin/chgrp


- 执行权限：所有用户


- 语法：<font color='orange'>chgrp [用户组] [文件或目录] </font>


- 功能描述：改变文件或目录的所属组


- 范例：$ chgrp lampbrother fengjie 


 改变文件 fengjie 的所属组为 lampbrother



##### （3）<font color='red'>umask</font>

- 命令英文原意：the user file-creation mask 


- 命令所在路径：Shell 内置命令


- 执行权限：所有用户


- 语法：<font color='orange'>umask [-S] </font>


- -S 以 rwx 形式显示新建文件缺省权限

- 功能描述：显示、设置文件的缺省权限


- 范例： $ umask -S

tips: 新建文件是默认没有 x 权限（比如：防止木马病毒攻击）



### 4.3 文件搜索命令

#### 4.3.1 文件搜索命令<font color='red'>find</font>

##### （0）find [搜索范围] [匹配条件] 

##### （1）按关键字 -name | -iname

- <font color='orange'>find [搜索范围] -name [关键字]</font> 在特定路径下搜索文件名作为关键字的文件或者目录

- find [搜索范围] -name [关键字]* 这样为带有关键字开头的任何文件都可以被搜索出来

- find [搜索范围] -name * [关键字] * 这样为带有关键字的任何文件都可以被搜索出来

- find [搜索范围] -name [关键字]??? 这样搜索的是关键字后带三个字符的 几个问号为几个字符

- find [搜索范围] -iname [关键字] 不区分大小写搜索

- ```shell
  $ find /etc -name init 
  #在目录/etc 中查找文件 init 
  #-iname 不区分大小写 
  $ find /etc -name *init*
  #在目录/etc 中查找文件名包含 init 
  $ find /etc -name init??？
  #在目录/etc 中查找文件名 init 开头并有 3 个字符的 
  $ find /etc -name init*
  #在目录/etc 中查找文件名 init 开头的 
  #tips:* 匹配任意字符，?匹配单个字符
  ```

  

##### （2）按文件大小 -size

- <font color='orange'>find [搜索范围] -size [数据块] </font>

- 数据块前面加+表示查找大于这个大小的文件，-表示查找小于这个大小的文件，不加表示查找等于这个大小的文件(一般不常用)

- 1个数据块=512字节=0.5KB （1KB=2个数据块）
  size后接的数据只能为数据块需要换算，比如需要查找大于100MB的文件
  100MB=102400KB=204800个数据块
  find /etc -size +204800
  数据块为Linux存储文件最小单位

- ```shell
  $ find / -size +204800 
  #在根目录下查找大于 100MB 的文件
  ```

  

##### （3）按所有者 -user

- find [搜索范围] -user [所有者名]

##### （4）按所属组 -group

- find [搜索范围] -group [所属组名] 

##### （5）按时间 -amin|-cmin|-mmin

- 按访问的时间：find [搜索范围] -amin [时间]	a:access

- 按修改属性的时间：find [搜索范围] -cmin [时间]	c:change

- 按修改内容的时间find [搜索范围] -mmin [时间]	m:modify
- +：超过多长时间     -：多长时间以内

##### （6）其他

- find [搜索范围] -size [数据块] -a -size [数据块]
  -a：两个条件同时满足
  -o：两个条件满足任意一个即可

  ```shell
  find /etc -size +163840 -a -size -204800
  #在/etc下查找大于80MB小于100MB的文件
  ```

- find [搜索范围] -name [关键字] -a -type f
  在特定路径下搜索文件名作为关键字的文件
  -type 根据不同类型查找
  f：文件
  d：目录
  l：软链接

- -exec：查找到文件之后并且对其进行各种操作 {} \ ;不能丢

  find [搜索范围] -name [关键字] -exec ls -l {} \ ;
  查找到文件之后并且对其进行查看ls操作。

- -ok：用于询问确认 一般在删除操作的时候使用，比如：
  find -user yangyang -ok rm {} \ ;
  删除yangyang用户的文件 他会挨个询问你是不是确定删除

- find [搜索范围] -inum [i节点值] 根据i节点查询
  find /etc -inum 12345 -exec rm {} \ ;
  删除这个i节点文件 非常方便
  也可以用来查询一个文件的硬链接
  find /etc inum 12345 -exec ls -l {} \ ;
  因为硬链接和文件肯定在同一个分区，并且i节点一样



#### 4.3.2 其他文件搜索命令

##### （1）<font color='red'>locate</font>

- 命令名称：locate
  - 命令所在路径：/usr/bin/locate 
  - 执行权限：所有用户
  - 语法：<font color='orange'>locate 文件名</font>
  - 参数：-i 不区分大小写
  - 功能描述：在**文件资料库**中查找文件，速度更快。
  - 范例：$ locate inittab
  - tips:
    - 新建文件 locate 不到，可以 updatedb,更新文件资料库后查找
    - /tmp 临时文件不在文件资料库内

##### （2）<font color='red'>which</font>

- 命令名称：which

- 命令所在路径：/usr/bin/which

- 执行权限：所有用户

- 语法：<font color='orange'>which 命令</font>

- 功能描述：搜索命令所在目录及别名信息

- 范例：$ which ls

##### （3）<font color='red'>whereis</font>

- 命令名称：whereis

- 命令所在路径：/usr/bin/whereis 

- 执行权限：所有用户

- 语法：<font color='orange'>whereis [命令名称] </font>

- 功能描述：搜索命令所在目录及帮助文档路径

- 范例：$ whereis ls

##### （4）<font color='red'>grep</font>

- 命令名称：grep

- 命令所在路径：/bin/grep 

- 执行权限：所有用户

- 语法：<font color='orange'>grep -iv [指定字串] [文件] </font>

- 功能描述：在文件中搜寻字串匹配的行并输出 
  - -i 不区分大小写
  - -v 排除指定字串

-  范例：
  -  grep mysql /root/install.log
  -  \# grep -v ^# /etc/inittab 去除以#开头的所有行信息,^表示以 XXX 开头



### 4.4 帮助命令

##### （1）<font color='red'>man</font>

- 命令英文原意：manual 

- 命令所在路径：/usr/bin/man 

- 执行权限：所有用户

- 语法：<font color='orange'>man [命令或配置文件] </font>
  -  (空格) 或 f 翻页 
  -  (Enter) 换行 
  -  q 或 Q 退出

- 功能描述：获得帮助信息

- 范例： 

  - $ man ls 

    查看 ls 命令的帮助信息 

  - $ man services 

    查看配置文件 services 的帮助信息

  - 1 命令的帮助   5 配置文件的帮助

  - man 5 passwd -> 查看配置文件的帮助



##### （2）<font color='red'>whatis</font>

- 语法：<font color='orange'>whatis 命令</font>

- 功能描述：获得命令的简单介绍信息

- 范例：whatis ls

  ```shell
  [zlx@zlx-vmwarevirtualplatform 桌面]$ whatis ls
  ls (1)               - list directory contents
  ls (1p)              - list directory contents
  ```

  

##### （3）<font color='red'>apropos</font>

- 语法：<font color='orange'>apropos 配置文件名称</font>
- whatis 类似于精确查找
- apropos 模糊查找关键字 [功能等于 man -k ] [可以 tab 快速补全]



##### （3）<font color='red'>help</font>

- 命令所在路径：Shell 内置命令

- 执行权限：所有用户

- 功能描述：获得 Shell 内置命令的帮助信息

- 范例： 

  - $ help umask 

    查看 umask 命令的帮助信息

  ```shell
  [zlx@zlx-vmwarevirtualplatform 桌面]$ help umask
  umask: umask [-p] [-S] [模式]
      显示或设定文件模式掩码。
      
      设定用户文件创建掩码为 MODE 模式。如果省略了 MODE，则
      打印当前掩码的值。
      
      如果 MODE 模式以数字开头，则被当作八进制数解析；否则是一个
      chmod(1) 可接收的符号模式串。
      
      选项：
        -p	如果省略 MODE 模式，以可重用为输入的格式输入
        -S	以符号形式输出，否则以八进制数格式输出
      
      退出状态：
      返回成功，除非使用了无效的 MODE 模式或者选项。
  ```

  





















## 第十章 Shell基础

### 10.1 Shell概述

#### 10.1.1 Shell是什么

- Shell是一个<font color='orange'>命令行解释器</font>，它为用户提供了一个向Linux内核发送请求以便运行程序的界面系统级程序，用户可以用Shell来 启动、挂起、停止甚至是编写一些程序。

  <img src="Linux%E5%AD%A6%E4%B9%A0%E7%AC%94%E8%AE%B0/image-20210721142803916.png" alt="image-20210721142803916" style="zoom:50%;" />

- Shell还是一个功能相当强大的<font color='orange'>编程语言</font>， 易编写，易调试，灵活性较强。Shell是解释执行的<font color='orange'>脚本语言</font>，在Shell中可以直接调用Linux系统命令。



### 











#### 10.1.2 Shell的分类

- <font color='orange'>Bourne Shell</font>:从1979起Unix就开始使用 Bourne Shell，Bourne Shell的主文件名为 sh。

- <font color='orange'>C Shell</font>: C Shell主要在BSD版的Unix系 统中使用，其语法和C语言相类似而得名

  Shell的两种主要语法类型有Bourne和C， 这两种语法彼此不兼容。

  Bourne家族主要 包括sh、ksh、Bash、psh、zsh;

  C家族主 要包括:csh、tcsh

  Bash: Bash与sh兼容，现在使用的Linux 就是使用Bash作为<font color='orange'>用户的基本Shell</font>。



#### 10.1.3 Linux支持的Shell

  /etc/shells
  会显示：/bin/sh、/bin/bash、/sbin/nologin、/bin/tcsh、/bin/csh
  都是Linux支持的Shell

  ```shell
  [zlx@zlx-vmwarevirtualplatform ~]$ cat /etc/shells
  # Pathnames of valid login shells.
  # See shells(5) for details.
  
  /bin/sh
  /bin/bash
  /bin/zsh
  /usr/bin/zsh
  /usr/bin/git-shell
  ```

  

#### 10.1.4 为什么要学习Shell

- 现代的互联网架构底层系统几乎都是基于 Linux 操作系统构建的，Linux的核心价值在于提供了<font color='orange'>强大的系统内核功能</font>进行文件管理和信息交互管理。

- 而 Shell 则是软件研发人员高效控制和<font color='orange'>使用 Linux 的工具和桥梁</font>。Shell 本身是 C 语言编写的系统软件，通常也叫命令行工具。它具有一个基础的界面，用户在这个界面通过 Shell 脚本语言（Shell Script）来访问 Linux 操作系统内核服务。

- 在科幻电影里，我们经常看到在暗色调的屏幕上 Shell 脚本代码在快速滚动，这简直成为了 Geek／Hacker 的一个形象标签。实际工作中，Shell 也备受开发、运维、测试人员甚至运营人员的青睐，几乎是 IT 技术人员的必备技能。

- 而在软件测试领域，Shell 脚本编程作为自动化测试技术的基石，是测试开发工程师必须熟练掌握的技能。



#### 10.1.5 Shell脚本语言有哪些优势

- Shell 脚本语言的优势在于能够以<font color='orange'>轻量级、最快捷的速度</font>处理 Linux 操作系统偏底层的业务。比如<font color='orange'>软件的自动化安装、更新版本、监控报警、日志分析等</font>。虽然其他高级编程语言如 PHP、Python、Ruby 等语言也能做到，但是效率和开发成本上会大打折扣，所谓“杀鸡用牛刀”，有点得不偿失。



### 10.2 Shell脚本的执行方式

#### 10.2.1 <font color='red'>echo </font>输出命令

- #echo [选项] [输出内容] 

- <font color='orange'>-e</font>: 支持反斜线控制的转义字符

| 控制字符 |                             作用                             |
| :------: | :----------------------------------------------------------: |
|    \     |                          输出\本身                           |
|    \a    |                          输出警告音                          |
|    \b    |                   退格键，也就是向左删除键                   |
|    \c    |             取消输出行末的换行符。和“-n”选项一致             |
|    \e    |                           ESCAPE键                           |
|    \f    |                            换页符                            |
|    \n    |                            换行符                            |
|    \r    |                            回车键                            |
|    \t    |                     制表符，也就是Tab键                      |
|    \v    |                          垂直制表符                          |
|  \0nnn   | 按照八进制ASCII码表输出字符。其中0为数字零，nnn是三位八进制数 |
|   \xhh   |    按照十六进制ASCII码表输出字符。其中hh是两位十六进制数     |

- 例子

  ```shell
  #\b退格删除左侧字符$ echo -e 'ab\bc'ac#\t制表符 \n换行符$ echo -e 'a\tb\tc\nd\te\tf'a	b	cd	e	f#\x按照十六进制ASCII码表输出字符$ echo -e '\x61\t\x62\t\x63'a	b	c$ echo -e '\e[1;31m abcd \e[0m' abcd #因为\e[1; 表示开启颜色区别 \e[0m 表示结束颜色区别 31m表示红色 还有其他：#30m=黑色，31m=红色，32m=绿色，33m=黄色，34m=蓝色，35m=洋红，36m=青色，#37m=白色
  ```



#### 10.2.2 第一个脚本

```shell
$ cd ~
$ ls公共  模板  视频  图片  文档  下载  音乐  桌面
$ cd 文档
$ mkdir 脚本练习
$ cd 脚本练习
$ vim hello.sh
$ sh hello.shWelcome to linux world!hhh
```


```sh
#!/bin/bash#This is my first program#Author:zlxecho -e 'Welcome to linux world!\nhhh'
```

注意：在这一段脚本中，#!/bin/Bash这一句是个例外，他并不是注释，是标识，说明以下语句是Shell脚本，解释器是/bin/bash



#### 10.2.3 执行脚本

- 赋予执行权限，直接运行

  - chmod 755 hello.sh
  - ./hello.sh

- 通过Bash调用执行脚本

  - bash hello.sh
  - 或 sh hello.sh  (不需要执行权限就可以执行)

  ```shell
  [zlx@zlx-vmwarevirtualplatform 脚本练习]$ ./hello.shbash: ./hello.sh: 权限不够[zlx@zlx-vmwarevirtualplatform 脚本练习]$ chmod 755 hello.sh[zlx@zlx-vmwarevirtualplatform 脚本练习]$ ./hello.shWelcome to linux world!hh[zlx@zlx-vmwarevirtualplatform 脚本练习]$ sh hello.shWelcome to linux world!hh
  ```



### 10.3 Bash的基本功能

#### 10.3.1 历史命令<font color='red'>history</font>与命令补全

- **历史命令**

  - history [选项] [历史命令保存文件] 

  - 选项： 

    - -c： 清空历史命令 

    - -w： 把缓存中的历史命令写入历史命令保存文件 <font color='orange'>~/.bash_history </font>

      历史命令默认会保存 1000 条,可以在环境变量配置文件/etc/profile 中进行修改

  - 历史命令的调用

    - 使用<font color='orange'>上、下箭头</font>调用以前的历史命令

    - 使用“<font color='orange'>!n</font>”重复执行第 n 条历史命令

    - 使用“<font color='orange'>!!</font>”重复执行上一条命令

    - 使用“<font color='orange'>!字串</font>”重复执行最后一条以该字串开头的命令 

      ```shell
      [zlx@zlx-vmwarevirtualplatform ~]$ ls公共  模板  视频  图片  文档  下载  音乐  桌面[zlx@zlx-vmwarevirtualplatform ~]$ !!ls公共  模板  视频  图片  文档  下载  音乐  桌面[zlx@zlx-vmwarevirtualplatform ~]$ !lls公共  模板  视频  图片  文档  下载  音乐  桌面
      ```



- **命令与文件补全**
  -  在 Bash 中，命令与文件补全是非常方便与常用的功能，我们只要在输入命令或文件时，按“Tab”键就会自动进行补全



#### 10.3.2 命令别名<font color='red'>alias</font>与常用快捷键

- **命令别名**

  - alias 别名='原命令' 		#设定命令别名 
  - alias        #查询命令别名 

- **命令执行时顺序**

  - 1 第一顺位执行用<font color='orange'>绝对路径或相对路径</font>执行的命令。
  - 2 第二顺位执行<font color='orange'>别名</font>。
  - 3 第三顺位执行 <font color='orange'>Bash</font>font> 的内部命令。
  - 4 第四顺位执行按照<font color='orange'>$PATH 环境变量定义的目录查找顺序</font>找到的第一个命令。

  ```shell
  [zlx@zlx-vmwarevirtualplatform ~]$ alias vi='vim'[zlx@zlx-vmwarevirtualplatform ~]$ aliasalias cp='cp -i'alias df='df -h'alias egrep='egrep --colour=auto'alias fgrep='fgrep --colour=auto'alias free='free -m'alias grep='grep --colour=auto'alias home='cd ~'alias ls='ls --color=auto'alias more='less'alias np='nano -w PKGBUILD'alias vi='vim'#再执行vi时不会调用PATH目录中命令，因为别名的优先级比PATH高#输出系统环境变量定义的目录[zlx@zlx-vmwarevirtualplatform ~]$ echo $PATH/home/zlx/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/var/lib/snapd/snap/bin#查询某条命令所在目录[zlx@zlx-vmwarevirtualplatform ~]$ whereis lsls: /usr/bin/ls /usr/share/man/man1/ls.1.gz /usr/share/man/man1p/ls.1p.gz[zlx@zlx-vmwarevirtualplatform ~]$ whereis vivi: /usr/bin/vi /usr/share/man/man1/vi.1.gz /usr/share/man/man1p/vi.1p.gz[zlx@zlx-vmwarevirtualplatform ~]$ whereis vimvim: /usr/bin/vim /usr/share/vim /usr/share/man/man1/vim.1.gz
  ```

- **让别名永久生效**

  - vim /root/.bashrc

- **删除别名**

  - unalias 别名

- **Bash 常用快捷键**

  |                   快捷键                   |                             作用                             |
  | :----------------------------------------: | :----------------------------------------------------------: |
  | <font color='cornflowerblue'>ctrl+a</font> | 把光标移动到命令行开头。如果我们输入的命令过长，想要把光标移 动到命令行开头时使用。 |
  | <font color='cornflowerblue'>ctrl+e</font> |                   把光标移动到命令行结尾。                   |
  | <font color='cornflowerblue'>ctrl+c</font> |                     强制终止当前的命令。                     |
  | <font color='cornflowerblue'>ctrl+l</font> |                   清屏，相当于clear命令。                    |
  | <font color='cornflowerblue'>ctrl+u</font> | 删除或<font color='red'>剪切</font>光标之<font color='red'>前</font>的命令。我输入了一行很长的命令，不用使用退 格键一个一个字符的删除，使用这个快捷键会更加方便 |
  |                   ctrl+k                   |     删除或剪切光标之<font color='red'>后</font>的内容。      |
  | <font color='cornflowerblue'>ctrl+y</font> |   <font color='red'>粘贴</font> ctrl+U或ctrl+K剪切的内容。   |
  | <font color='cornflowerblue'>ctrl+r</font> | 在历史命令中搜索，按下ctrl+R之后，就会出现搜索界面，只要输入 搜索内容，就会从历史命令中搜索。 |
  | <font color='cornflowerblue'>ctrl+d</font> |                        退出当前终端。                        |
  |                   ctrl+z                   | 暂停，并放入后台。这个快捷键牵扯工作管理的内容，我们在系统管 理章节详细介绍。 |
  |                   ctrl+s                   |                        暂停屏幕输出。                        |
  |                   ctrl+q                   |                        恢复屏幕输出。                        |



#### 10.3.3 输入输出重定向

- **标准输入输出**

  ![image-20210722132956166](Linux%E5%AD%A6%E4%B9%A0%E7%AC%94%E8%AE%B0/image-20210722132956166.png)

  

- **<font color='red'>输出重定向>></font>**

  就是改变输出方向，比如由屏幕输出到文件，非常有用

  | 类型               | 符号             | 作用                                                         |
  | ------------------ | ---------------- | ------------------------------------------------------------ |
  | 标准输出重定向     | 命令 > 文件      | 以<font color='red'>覆盖</font>的方式，把命令的正确输出输出到指定的文件或设备当中。 |
  | 标准输出重定向     | 命令 >> 文件     | 以<font color='red'>追加</font>的方式，把命令的正确输出输出到指定的文 件或设备当中。 |
  | 标准错误输出重定向 | 错误命令 2>文件  | 以覆盖的方式，把命令的错误输出输出到指定的文件或设备当中。   |
  | 标准错误输出重定向 | 错误命令 2>>文件 | 以追加的方式，把命令的错误输出输出到指定的文件或设备当中。   |

  tip:在输入报错文件中 2和>>必选<font color='red'>连着写</font>,标准错误输出不常用

  | 类型                       | 符号                   | 作用                                                        |
  | -------------------------- | ---------------------- | ----------------------------------------------------------- |
  | 正确输出和错误输出同时保存 | 命令 > 文件 2>&1       | 以覆盖的方式，把正确输出和错误输出都保存到同 一个文件当中。 |
  | 正确输出和错误输出同时保存 | 命令 >> 文件 2>&1      | 以追加的方式，把正确输出和错误输出都保存到同 一个文件当中。 |
  | 正确输出和错误输出同时保存 | 命令 &> 文件           | 以覆盖的方式，把正确输出和错误输出都保存到同一个文件当中    |
  | 正确输出和错误输出同时保存 | 命令 &>> 文件          | 以追加的方式，把正确输出和错误输出都保存到同一个文件当中。  |
  | 正确输出和错误输出同时保存 | 命令 >> 文件1 2>>文件2 | 把正确的输出追加到文件1中，把错误的输出追加到文件2中。      |

  tip:命令 >> 文件 2>&1 ，命令 &>>文件 两种保存都一样，只不过是格式不同
  有一个用法：
  命令 &>/dev/unll 不管命令是否正确，直接丢人这个文件夹，不保存任何数据，在写shell脚本时有用

  ```shell
  [zlx@zlx-vmwarevirtualplatform ~]$ ls >> ./文档/cdx
  [zlx@zlx-vmwarevirtualplatform ~]$ cat ./文档/cdx
  公共
  模板
  视频
  图片
  文档
  下载
  音乐
  桌面
  [zlx@zlx-vmwarevirtualplatform ~]$ lst
  bash: lst：未找到命令
  [zlx@zlx-vmwarevirtualplatform ~]$ lst 2>> ./文档/cdx
  [zlx@zlx-vmwarevirtualplatform ~]$ cat ./文档/cdx
  公共
  模板
  视频
  图片
  文档
  下载
  音乐
  桌面
  bash: lst：未找到命令
  
  [zlx@zlx-vmwarevirtualplatform ~]$ ls &>> ./文档/cdx1
  [zlx@zlx-vmwarevirtualplatform ~]$ lst &>> ./文档/cdx1
  [zlx@zlx-vmwarevirtualplatform ~]$ cat ./文档/cdx1
  公共
  模板
  视频
  图片
  文档
  下载
  音乐
  桌面
  bash: lst：未找到命令
  ```

  

- **<font color='red'>输入重定向WC</font>**

  不通过键盘输入，通过文件输入，在实际中用的不多，用在给源码包打补丁
  - wc [选项] [文件名] :统计某个文件输入的行数、单词数、字节数

  - 选项

    - -c 统计字节数
    - -w 统计单词数
    - -l 统计行数

  - 用法：
    命令 <font color='red'>< 文件</font> ：把文件作为命令的输入
    命令<font color='red'> << 标识符 内容  标识符</font>：把标识符之间内容作为命令的输入

    ```shell
    #统计行数、单词数、字符数
    [zlx@zlx-vmwarevirtualplatform ~]$ wc
    jdign ing
    jgidn ingd 
    jiiji
    jis9e      3       6      33
    #统计输入文件
    [zlx@zlx-vmwarevirtualplatform ~]$ wc < ./文档/cdx
     9 10 84
    #统计输入文件行数
    [zlx@zlx-vmwarevirtualplatform ~]$ wc -l < ./文档/cdx
    9
    #以quit为标识符，统计内容
    [zlx@zlx-vmwarevirtualplatform ~]$ wc << quit
    > jdig
    > jidigj jidg
    > jig
    > quit
          3       4      21
    ```

    



#### 10.3.4 多命令顺序执行与管道符

- **多命令顺序执行**

|  多命令执行符 | 格式  | 作用  |
|:--:|:---:|:---:|
| ；  |命令1 ; 命令2	|多个命令顺序执行，命令之间没有任何逻辑联系，就算第一条报错，第二条也会执行|
|&&	|命令1 && 命令2	|逻辑与当命令1正确执行，则命令2才会执行 当命令1执行不正确，则命令2不会执行|
| \|\|	|命令1 \|\| 命令2	|逻辑或当命令1 执行不正确，则命令2才会执行 当命令1正确执行，则命令2不会执行|

- 例子： [root@localhost ~]# ls ; date ; cd /user ; pwd


- 磁盘文件复制：

  - dd if=输入文件 of=输出文件 bs=字节数 count=个数 
  - 选项：
    - if=输入文件  指定源文件或源设备 
    - of=输出文件  指定目标文件或目标设备 
    - bs=字节数  指定一次输入/输出多少字节，即把这些字节看做一个数据块
    - count=个数  指定输入/输出多少个数据块 
  - 例子：

  ```shell
  date ; dd if=/dev/zero of=/root/testfile bs=1k count=100000 ; date
  ```

  [root@localhost ~]# ls anaconda-ks.cfg && echo yes 

[root@localhost ~]# ls /root/test || echo "no 

[root@localhost ~]# 命令 && echo yes || echo no



- **管道符**
  - 命令格式：命令 1 | 命令 2 
  - 命令 1 的正确输出作为命令 2 的操作对象
  - 例子：

  ```shell
  [root@localhost ~]# ll -a /etc/ | more 
  
  [root@localhost ~]# netstat -an | grep "ESTABLISHED"
  ```

  
  - [root@localhost ~]# grep [选项] "搜索内容" 文件名
  - 选项： 
    - -i： 忽略大小写 
    - -n： 输出行号 
    - -v： 反向查找 
    - --color=auto 搜索出的关键字用颜色显示



#### 10.3.5 通配符与其他特殊符号

- 通配符

  ![image-20210802142430007](Linux%E5%AD%A6%E4%B9%A0%E7%AC%94%E8%AE%B0/image-20210802142430007.png)

- Bash中其他特殊符号

  ![image-20210802142441259](Linux%E5%AD%A6%E4%B9%A0%E7%AC%94%E8%AE%B0/image-20210802142441259.png)



### 10.4 Bash的变量

#### 10.4.1 用户自定义的变量

##### （1）什么是变量：

​		变量是计算机内存的单元，其中存放的值可以改变。当Shell脚本需要保存一些信息 时，如一个文件名或是一个数字，就把它 存放在一个变量中。每个变量有一个名字 ，所以很容易引用它。使用变量可以保存 有用信息，使系统获知用户相关设置，变量也可以用于保存暂时信息。

##### （2）变量设置规则：

- 变量名称可以由字母、数字和下划线组成 ，但是不能以数字开头。如果变量名是 “2name”则是错误的。

- 在Bash中，变量的默认类型都是字符串型 ，如果要进行数值运算，则必需指定变量类型为数值型。

- 默认变量类型全都是字符串型，和其他语言不太一样

- 变量用等号连接值，等号左右两侧不能有空格。变量的值如果有空格，需要使用单引号或双引号包括。

- 在变量的值中，可以使用“\”转义符。

- 如果需要增加变量的值，那么可以进行变量值的叠加。不过变量需要用双引号包含 “$变量名”或用${变量名}包含。

- 如果是把命令的结果作为变量值赋予变量 ，则需要使用反引号或$()包含命令。
  环境变量名建议大写，便于区分。

  

##### （3）变量的分类：

- 用户自定义变量（本地变量）

- 环境变量:这种变量中主要保存的是和系统操作环境相关的数据。

- 位置参数变量:这种变量主要是用来向脚本当 中传递参数或数据的，变量名不能自定义，变量作用是固定的。

- 预定义变量:是Bash中已经定义好的变量，变量名不能自定义，变量作用也是固定的。

  

##### （4）用户自定义变量

- ​    变量定义
  ​    例子：
  ​    name=“yang yang”

- 变量叠加
    aa=123
    aa="$aa"456
   aa=${aa}789

- 变量调用
  <font color='red'>echo </font>$变量名

- 变量查看
  <font color='red'>set    </font>查看当前系统全部变量

- 变量删除
  <font color='red'>unset </font>变量名

- ```shell
  [zlx@zlx-vmwarevirtualplatform 桌面]$ name='zlx'
  [zlx@zlx-vmwarevirtualplatform 桌面]$ name="$name"666
  [zlx@zlx-vmwarevirtualplatform 桌面]$ name=${name}777
  [zlx@zlx-vmwarevirtualplatform 桌面]$ echo name
  name
  [zlx@zlx-vmwarevirtualplatform 桌面]$ echo $name
  zlx666777
  [zlx@zlx-vmwarevirtualplatform 桌面]$ unset name
  
  ```



#### 10.4.2 环境变量 PATH PS1

##### （1）环境变量：

​	用户自定义变量只在当前的Shell中生效， 而环境变量会在当前Shell和这个Shell的所 有子Shell当中生效。如果把环境变量写入相应的配置文件，那么这个环境变量就会在所有的Shell中生效

​	<font color='red'>pstree</font>:以树结构显示进程

```shell
[zlx@zlx-vmwarevirtualplatform 桌面]$ pstree
systemd─┬─ModemManager───2*[{ModemManager}]
        ├─NetworkManager───2*[{NetworkManager}]
        ├─accounts-daemon───2*[{accounts-daemon}]
        ├─avahi-daemon───avahi-daemon
        ├─blueman-tray───2*[{blueman-tray}]
        ├─bluetoothd
		……
```



##### （2）设置环境变量：

- <font color='orange'>申明变量</font>：export 变量名=变量值 

- <font color='orange'>查询变量</font>：env

- <font color='orange'>变量调用</font>：echo $变量名 

- <font color='orange'>删除变量</font>：unset 变量名

- pstree 树形显示进程数
  没有这条命令可以执行以下命令下载：
  yum -y install psmisc
  yum provides /命令 查看没有的命令的安装包 配合yum -y install使用



##### （3）系统常见环境变量

- <font color='red'>PATH</font>:系统查找命令的路径
  这便是输入命令之前不用输入绝对路径的根本原因，系统会提前在PATH环境变量里的所有路径中查询一遍有没有你输入的命令，找到之后直接执行；

- 如果你想直接执行shell脚本，不加绝对路径，直接写入PATH环境变量，使用叠加
  例子：

  ```shell
  echo $PATH
  #PATH变量叠加
  PATH="$PATH":/root/sh 
  #此后，/root/sh路径里面的执行文件都可以在任意目录下直接执行，不过是临时生效
  ```

- <font color='red'>PS1</font>：定义<font color='orange'>系统提示符</font>的变量 用来改[root@localhost ~]# 这个显示

  - \d:显示日期，格式为“星期 月 日”

  - \h:显示简写主机名。如默认主机名“localhost”

  - \t:显示24小时制时间，格式为“HH:MM:SS”

  - \T:显示12小时制时间，格式为“HH:MM:SS”

  - \A:显示24小时制时间，格式为“HH:MM”

  - \u:显示当前用户名

  - \w:显示当前所在目录的完整名称

  - \W:显示当前所在目录的最后一个目录

  - #:执行的第几个命令

  - $:提示符。如果是root用户会显示提示符为“#”，如果是普通用户 会显示提示符为“$”

    ```shell
    [zlx@zlx-vmwarevirtualplatform 桌面]$ echo $PS1
    \[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\]
    [zlx@zlx-vmwarevirtualplatform 桌面]$ PS1='[\u@\t\w]\$'
    [zlx@00:16:25~/桌面]$PS1='[\u@\@ \h \# \W]\$'
    [zlx@12:16 上午 zlx-vmwarevirtualplatform 4 桌面]$PS1='[\u@\h \W]$'
    [zlx@zlx-vmwarevirtualplatform 桌面]$
    ```



#### 10.4.3 位置参数变量 $n $* $@ $#

- 位置参数变量

|变量|作用|
|:---:|-----|
|$n	|n为数字，$0代表命令本身，$1-9 代 表 第 一 到 第 九 个 参 数 ， 十 以 上 的 参 数 需 要 用 大 括 号 包 含 ，如{10}.|
|$*	|这个变量代表命令行中所有的参数，$*把所有的参数看成一个整体|
|$@	|这个变量也代表命令行中所有的参数，不过 $@把每个参数区分对待|
|$#	|这个变量代表命令行中所有参数的个数|

- <font color='red'>$n</font> 的例子

```shell
[zlx@zlx-vmwarevirtualplatform 脚本练习]$ cat sum.sh

#!/bin/bash
num1=$1
num2=$2
sum=$(($num1+$num2))
#变量sum的和是num1+num2
echo $sum
#打印变量sum的值

[zlx@zlx-vmwarevirtualplatform 脚本练习]$ bash sum.sh 2 3
5
```



- <font color='red'>S# S* S@</font> 的例子

```shell
[zlx@zlx-vmwarevirtualplatform 脚本练习]$ cat showParam.sh 

#!/bin/bash
echo "A total of $# parameters"
#使用$#代表所有参数的个数
echo "The parameters is:$*"
#使用$*代表所有参数
echo "The parameters is:$@"
#使用$@也代表所有参数

[zlx@zlx-vmwarevirtualplatform 脚本练习]$ bash showParam.sh 11 23 45 66
A total of 4 parameters
The parameters is:11 23 45 66
The parameters is:11 23 45 66
```



- S*和S@ 的区别

```shell
[zlx@zlx-vmwarevirtualplatform 脚本练习]$ cat diffParam.sh 
#!/bin/bash

#$*中所有的参数看成一个整体，所以这个for循环只会循环一次
for i in "$*" 
do
	echo "The parameter is:$i"
done
#$@中所有的参数都看成是独立的，所以”$@“中有几个参数，就会循环几次
x=1
for i in "$@"
do
	echo "The parameter$x is:$i"
	x=$(($x+1))
done

[zlx@zlx-vmwarevirtualplatform 脚本练习]$ bash diffParam.sh 12 34 56 
The parameter is:12 34 56
The parameter1 is:12
The parameter2 is:34
The parameter3 is:56
```



#### 10.4.4 预定义的变量 $? $$ $!

- 预定义变量


|变量	|作用|
|----|----|
|$?	|最后一次执行的命令的返回状态。如果这个变量的值为0，证明上一个命令正确执行;如果 这个变量的值为非0(具体是哪个数，由命令自己来决定)，则证明上一个命令执行不正确 了。|
|$$	|当前进程的进程号(PID)|
|$!	|后台运行的最后一个进程的进程号(PID)|

- 例子：

  ```shell
  [zlx@zlx-vmwarevirtualplatform 脚本练习]$ cat showPID.sh
  
  #!/bin/bash
  echo “The current process is $$”
  #输出当前进程的PID。
  #这个PID就是showPID.sh这个脚本执行时，生成的进程的PID
  find ./ -name hello.sh &
  #使用find命令在root目录下查找hello.sh文件
  #符号&的意思是把命令放入后台执行，工作管理在系统管理章节会详细介绍
  echo "The last one Daemon process is $!"
  
  [zlx@zlx-vmwarevirtualplatform 脚本练习]$ bash showPID.sh
  “The current process is 2798”
  The last one Daemon process is 2799
  
  [zlx@zlx-vmwarevirtualplatform 脚本练习]$ ./hello.sh
  
  [zlx@zlx-vmwarevirtualplatform 脚本练习]$ echo $?
  0
  ```

  

- 接受键盘输入
  read [选项] [变量名]
  - -p “提示信息”：在等待read输入时，输出提示信息
  - -t 秒数：read命令会一直等待用户输入，使用此选项可以指定等待时间
  - -n 字符数：read命令只接受指定的字符数，就会执行
  - -s: 隐藏输入的数据，适用于机密信息的输入

  ```shell
  [zlx@zlx-vmwarevirtualplatform 脚本练习]$ cat keyboard.sh 
  
  #!/bin/bash 
  #Author: shenchao （E-mail: shenchao@lampbrother.net）
  read -t 30 -p "Please input your name: " name 
  #提示“请输入姓名”并等待 30 秒，把用户的输入保存入变量 name 中
  echo "Name is $name " 
  read -s -t 30 -p "Please enter your age: " age 
  #年龄是隐私，所以我们用“-s”选项隐藏输入
  echo -e "\n" 
  echo "Age is $age " 
  read -n 1 -t 30 -p "Please select your gender[M/F]: " gender
  #使用“-n 1”选项只接收一个输入字符就会执行（都不用输入回车）
  echo -e "\n" 
  echo "Sex is $gender"
  
  [zlx@zlx-vmwarevirtualplatform 脚本练习]$ bash keyboard.sh 
  Please input your name: zlx
  Name is zlx 
  Please enter your age: 
  
  Age is 18 
  Please select your gender[M/F]: M
  
  Sex is M
  ```

  

### 10.5 Bash的运算符

#### 10.5.1 数值运算与运算符

##### （1）<font color='red'>declare </font>声明变量类型

- <font color='orange'>declare [+/-] [选项] 变量名</font>

- 选项： 
  - -： 给变量设定类型属性 
  -  +：取消变量的类型属性 
  - -i：将变量声明为整数型（integer） 
  - -x：将变量声明为环境变量 
  - -p：显示指定变量的被声明的类型



##### （2）数值运算

- 方法1：

  ```shell
  $ aa=11
  $ bb=22
  $ declare -i cc=$aa+$bb
  $ echo $cc
  33
  ```

  

- 方法2：<font color='orange'>expr </font>或 let 数值运算工具

  ```shell
  $ aa=11
  $ bb=10
  $ dd=$(expr $aa + $bb)
  # dd的值是aa和bb的和。注意“+”号左右两侧必须有空格。let和expr一样
  $ echo $dd
  21
  ```

  

- 方法3：<font color='orange'>$((运算式)) 或 $[运算式]</font>（<font color='red'>推荐</font>）

  ```shell
  $ aa=10
  $ bb=12
  $ ee=$(($aa+$bb))
  $ echo $ee
  22
  $ ff=$[$aa+$bb+$ee]
  $ echo $ff
  44
  ```



##### （3）运算符优先级

| 优先级 | 运算符 | 说明 |
| :----: | :----: | :--: |
|13	|-, +	|单目负、单目正|
|12	|!, ~	|逻辑非、按位取反或补码|
|11	|*,/, %	乘、除、取模||
|10	|+, -	|加、减|
|9	|<< , >>	|按位左移、按位右移|
|8	|< =, > =, < , >	|小于或等于、大于或等于、小于、大于|
|7	|== , !=	|等于、不等于|
|6	|&	|按位与|
|5	|^	|按位异或|
|4	|\|	|按位或|
|3	|&&	|逻辑与|
|2	|\|\|	|逻辑或|
|1	|=,+=,-=,*=,/=,%=,&=, ^=,赋值、运算且赋值 |=, <<=, >>=	|




#### 10.5.2 变量测试与内容替换

- 测试表

​		用来测试一个变量到底有没有设置
![image-20210803155541740](Linux%E5%AD%A6%E4%B9%A0%E7%AC%94%E8%AE%B0/image-20210803155541740.png)

- 例子：
  - 测试x=${y-新值} 测试y变量存不存在

    unset y 删除变量y
    x=${y-new} 进行测试
    echo $x
    显示new，y变量不存在
    因为变量y不存在，所以x=new

  - y="" 给变量y赋值为空
    x=${y-new} 进行测试
    echo $x
    显示空，y为空值

  - y=old 给变量y赋值
    x=${y-new} 进行测试
    echo $x
    显示old ，y变量存在且有值





### 10.6 环境变量配置文件

#### 10.6.1 环境变量配置文件简介

##### （1）<font color='red'>source</font>命令

-  命令格式：source 配置文件  或  . 配置文件 
- 功能描述：强制使配置文件在修改之后生效，不需要重启

##### （2）简介

- 环境变量配置文件中主要是定义<font color='orange'>对系统的操作环境生效的系统默认环境变量</font>，比如 PATH、HISTSIZE、PS1、HOSTNAME等 默认环境变量。

- 配置文件保持位置

  - /etc/profile 
  - /etc/profile.d/*.sh 

  - ~/.bash_profile 

  - ~/.bashrc 

  - /etc/bashrc



#### 10.6.2 环境变量配置文件作用

##### （1）主要的环境变量配置文件

- /etc/profile
- /etc/profile.d/\*.sh    指/etc/profile.d/下所有的.sh结尾的文件
- ~/.bash_profile
- ~/.bashrc
- /etc/bashrc
- tips:
  - /etc 目录下的对所有用户都生效
  - ~/.bash_profile 和 ~/.bashrc -> 每个用户自己的配置文件，只对用户生效。



##### （2）环境变量配置文件调用顺序流程图

![image-20210806105220081](Linux%E5%AD%A6%E4%B9%A0%E7%AC%94%E8%AE%B0/image-20210806105220081.png)

- 上图从左到右如果没有叠加。后面的命令会覆盖前面的命令。 这些是在登陆的时候挨个调用，所以在这里面设置环境变量，登陆之后就会自动设置好

- /etc/profile的作用：
  - 里面有USER变量、LOGNAME变量、MAIL变量、PATH变量HOSTNAME变量、HISTSIZE变量、umask等环境变量的配置；
  - 调用/etc/profile.d/*.sh 文件

- ~/.bash_profile的作用:
  - 调用了~/.bashrc文件。
  - 在PATH变量后面加入了“:$HOME/bin” 这个目录
- ~/.bashrc的作用:
  - 定义默认别名
  - 调用/etc/bashrc
- /etc/bashrc的作用:
  - PS1变量
  - umask
  - PATH变量
  - 调用/etc/profile.d/*.sh文件
    这一块就是进入界面以内，切换shell登陆方式，这种不需要密码，所以和前面的/etc/profile的作用不冲突

##### 

#### 10.6.3 其他配置文件和登录信息

- 注销时生效的环境变量配置文件

   ~/.bash_logout ：注销登录时写入

  

-  其他配置文件

    ~/bash_history：历史命令文件

  

- Shell 登录信息
  - 本地终端欢迎信息： /etc/issue

  | 转义符 |               作用               |
  | :----: | :------------------------------: |
  |   \d   |         显示当前系统日期         |
  |   \s   |         显示操作系统名称         |
  |   \l   | 显示登录的终端号，这个比较常用。 |
  |   \m   | 显示硬件体系结构，如i386、i686等 |
  |   \n   |            显示主机名            |
  |   \o   |             显示域名             |
  |   \r   |           显示内核版本           |
  |   \t   |         显示当前系统时间         |
  |   \u   |     显示当前登录用户的序列号     |

  - 远程终端欢迎信息： /etc/issue.net 
    - 转义符在/etc/issue.net 文件中不能使用
    - 是否显示此欢迎信息，由 ssh 的配置文件/etc/ssh/sshd_config 决定，加入“Banner/etc/issue.net”行才能显示（记得重启 SSH 服务） 
  - 登陆后欢迎信息：/etc/motd , 不管是本地登录，还是远程登录，都可以显示此欢迎信息



## 第十一章 Shell编程

### 11.1 基础正则表达式

#### 11.1.1 正则表达式与通配符

- 正则表达式用来在文件中<font color='orange'>匹配符合条件的字符串</font>，正则是<font color='red'>包含匹配</font>。<font color='orange'>grep、awk、sed </font>等命令可以支持正则表达式。

- 通配符用来<font color='orange'>匹配符合条件的文件名</font>，通配符是<font color='red'>完全匹配</font>。<font color='orange'>ls、find、cp </font>这些命令不支持正则表达式，所以只能使用 shell 自己的通配符来进行匹配了。



#### 11.1.2 基础正则表达式

##### （1）<font color='red'>元字符及其作用</font>

|元字符	|作用|
| :---: | ----- |
|* |匹配前一个字符0次或任意多次。|
|  .	|匹配除了换行符外任意一个字符。|
|  ^	|匹配行首。例如:^hello会匹配以hello开头的行。|
|  $	|匹配行尾。例如:hello&会匹配以hello结尾的行。|
|  []	|匹配中括号中指定的任意一个字符，只匹配一个字符。 例如:[aoeiu] 匹配任意一个元音字母，[0-9] 匹配任意一位 数字， [a-z] [0-9]匹配小写字和一位数字构成的两位字符。|
|  [^]	|匹配除中括号的字符以外的任意一个字符。例如:\[^0-9] 匹配 任意一位非数字字符，\[^a-z] 表示任意一位非小写字母。|
|  \	|转义符。用于取消特殊符号的含义。|
| \\{n\\}	|表示其前面的字符<font color='red'>恰好出现</font>n次。例如:[0-9]{4} 匹配4位数字，[1] [3-8] [0-9]{9} 匹配手机号码|
| \\{n,\\}	|表示其前面的字符<font color='red'>至少出现</font>n次。例如: [0-9]{2,} 表示两位及以上的数字。|
| \\{n,m\\}	|表示其前面的字符至少出现n次，最多出现m次。例如: [a- z]{6,8} 匹配6到8位的小写字母|

##### （2）举例【以下匹配均指<font color='red'>包含匹配</font>】

- “*”前一个字符匹配0次，或任意多次
  - grep “a*” test_rule.txt
    #匹配所有内容，包括空白行(匹配包含0个或任意多个a的行，包含0个a<=>所有内容)

  - grep “aa\*” test_rule.txt
    #匹配至少包含有一个a的行

  - grep “aaa\*” test_rule.txt
    #匹配最少包含两个连续a的字符串

    

- “.” 匹配除了换行符外任意一个字符
  - grep “s..d” test_rule.txt
    #“s..d”会匹配在s和d这两个字母之间有两个字符的单词
  - grep “s.\*d” test_rule.txt
    #匹配在s和d字母之间有任意(个数>=0)字符 (.\*等价于任意个数 .)
  - grep “.*” test_rule.txt
    #匹配所有内容，包括空白行（匹配包含0个或任意多个任意字符的行<=>所有内容）

  

- “^”匹配行首，“\$”匹配行尾

  - grep “^M” test_rule.txt
    #匹配以大写“M”开头的行
  - grep “n​\$” test_rule.txt
    #匹配以小写“n”结尾的行
  - grep -n “^$” test_rule.txt
    #会匹配空白行

  

- “[]” 匹配中括号中指定的任意一个字符，只匹配一个字符
  - grep “s[ao]id” test_rule.txt
    #匹配s和i字母中，要不是a、要不是o的行
  - grep “[0-9]” test_rule.txt
    #匹配任意一个数字
  - grep “^[a-z]” test_rule.txt
    #匹配用小写字母开头的行

  

- “[^]” 匹配除中括号的字符以外的任意一个字符

  - grep “\^[\^a-z]” test_rule.txt
    #匹配不以小写字母开头的行
  - grep “\^[\^a-z A-Z]” test_rule.txt
    #匹配不用字母开头的行

- “\” 转义符,用于取消特殊符号的含义

  - grep “\\.$” test_rule.txt
    #匹配使用“.”结尾的行

  

- “\\{n\\}”表示其前面的字符恰好出现n次

  - grep “a\\{3\\}” test_rule.txt
    #匹配a字母连续出现三次的字符串,即包含aaa的字符串
  - grep “[0-9]\\{3\\}” test_rule.txt
    #匹配包含连续的三个数字的字符串

  

- “\\{n,\\}”表示其前面的字符出现不小于n次

  - grep “^\[0-9]\\{3,\\}[a-z]” test_rule.txt

    #匹配最少用连续三个数字开头且后跟一个字符的行

    

- “\{n,m\}”匹配其前面的字符至少出现n次， 最多出现m次

  - grep “sa\\{1,3\\}i” test_rule.txt
    #匹配在字母s和字母i之间有最少一个a，最多三个a

```shell
[zlx@localhost test]$ cat test_rule.txt 
18286486521
18384681568
18414568468
1530268781@qq.com
1530268781@gmail.com
1530268781@163.com
@qq.com
a@163.com
153@.com
#匹配包含以181、182、183、184开头的电话号码的行
[zlx@localhost test]$ grep "18[1-4][0-9]\{8\}" test_rule.txt 
18286486521
18384681568
18414568468
#匹配包含qq邮箱xxx.qq.com的行
[zlx@localhost test]$ grep ".*@qq.com" test_rule.txt 	#错误，.*匹配所有内容包含“空”
1530268781@qq.com
@qq.com
[zlx@localhost test]$ grep "..*@qq.com" test_rule.txt #正确，..*匹配所有内容，且至少有一个字符
1530268781@qq.com
#匹配包含邮箱 xxx.@xxx.com的行
[zlx@localhost test]$ grep "..*@..*\.com" test_rule.txt 
1530268781@qq.com
1530268781@gmail.com
1530268781@163.com
a@163.com
#匹配只有电话号码的行（以电话号码开头和结尾）
[zlx@localhost test]$ grep "^18[1-4][1-9]\{8\}" test_rule.txt 	#错误
18286486521jidng
18384681568dg
18414568468
[zlx@localhost test]$ grep "^18[1-4][1-9]\{8\}$" test_rule.txt 
18414568468
```



### 11.2 字符截取命令

#### 11.2.1 <font color='red'>cut</font>命令

- 命令格式：<font color='red'>cut [选项] 文件名</font>
- 选项：
  - <font color='orange'>-f</font> 列号： 提取第几列 
  - <font color='orange'>-d</font> 分隔符： 按照指定分隔符分割列
- tips:
  - 一般在使用cut命令的时候和管道符“|”连着使用
  - grep为提取行，cut提取列，而且cut提取的表格中，只能用制表符隔开不能用空格

- 举例：

  - [root@localhost ~]# cut -f 2 student.txt 

    #提取第二列

  - [root@localhost ~]# cut -f 2,3 student.txt 

    #提取第二第三列

  - [root@localhost ~]# cut -d ":" -f 1,3 /etc/passwd

    #以：为分隔符提取第一第三列

- cut 命令的局限：

  [root@localhost ~]# df -h | cut -d " " -f 1,3

  #有空格时提取会出问题

  ```shell
  [zlx@localhost 桌面]$ cat student.txt 
  id	name	gender	mark
  1	Li		M		86
  2	Shen	M		90
  3	Gao		M		83
  [zlx@localhost 桌面]$ cut -f 2 student.txt
  name
  Li
  Shen
  Gao
  [zlx@localhost 桌面]$ cut -f 2,4 student.txt
  name	mark
  Li		86
  Shen	90
  Gao		83
  
  [zlx@localhost 桌面]$ cat student1.txt 
  id:name:gender:mark
  1:Shen:M:90
  2:Li:M:86
  3:Gao:M:83
  [zlx@localhost 桌面]$ cut -d ":" -f 1,3 student1.txt
  id:gender
  1:M
  2:M
  3:M
  ```

  



#### 11.2.2 <font color='red'>printf</font>命令

- 命令格式：<font color='red'>printf  '输出类型|输出格式'  输出内容</font>

- 输出类型： 
  - %ns ： 输出字符串。n 是数字指代输出几个字符 
  - %ni ： 输出整数。n 是数字指代输出几个数字 
  - %m.nf ： 输出浮点数。m 和 n 是数字，指代输出整数的位数和小数位数。如%8.2f 代表共输出 8 位数， 其中 2 位是小数，6 位是整数。

- 输出格式： 
  - \a : 输出警告声音 
  - \b : 输出退格键，也就是 Backspace 键 
  - \f : 清除屏幕 
  - \n : 换行 
  - \r : 回车，也就是 Enter 键 
  - \t : 水平输出退格键，也就是 Tab 键 
  - \v : 垂直输出退格键，也就是 Tab 键

- tips：

  - 因为每有几个%s代表每几个字符输出一次
  - 在与cat命令结合使用的时候，需要用<font color='orange'>$()把cat命令扩起来</font>，使用这种命令赋予变量的方式，才能正确输出文件内容，但是具体格式还得用%s\t 或者%s\n控制
  - 在awk命令的输出中支持print和printf命令,printf主要在awk命令编程中使用
    - print:print会在每个输出之后自动加入一 个换行符(Linux默认没有print命令)
    - printf:printf是标准格式输出命令，并不会自动加入换行符，如果需要换行，需要手工加入换行符

- 举例：

  ```shell
  [zlx@localhost 桌面]$ printf %s 1 2 3 4 5 6
  123456[zlx@localhost 桌面]$ printf %s %s %s 1 2 3 4 5 6
  %s%s123456[zlx@localhost 桌面]$ printf '%s %s %s' 1 2 3 4 5 6
  1 2 34 5 6[zlx@localhost 桌面]$ printf '%s%s%s' 1 2 3 4 5 6
  123456[zlx@localhost 桌面]$ printf '%s %s %s\n' 1 2 3 4 5 6
  1 2 3
  4 5 6
  ```

  ```shell
  #不调整格式输出
  [zlx@localhost 桌面]$ printf '%s' $(cat student.txt)
  idnamegendermark1LiM862ShenM903GaoM83
  #调整格式输出
  [zlx@localhost 桌面]$ printf '%s\t %s\t %s\t %s\t \n' $(cat student.txt)
  id	 name	 gender	 mark	 
  1	 Li	 	 M	 	86	 
  2	 Shen	 M	 	90	 
  3	 Gao	 M	 	83	
  ```

  

#### 11.2.3 awk命令

- 介绍：

  awk命令也叫awk编程，可以<font color='orange'>识别非制表符的空格</font>，用来解决cut命令解决不了的提取列工作，他是把需要提取的原文件一行一行扫描，扫描每一行中所需要点列，然后把它记录下来，在全部扫描完之后全部打印出来。

- 命令格式：<font color='red'> awk ‘条件1{动作 1} 条件2{动作 2}…’ 文件名</font>

- 条件(pattern)：一般使用关系表达式作为条件。如x>10

- 动作(action)：

  - 格式化输出
  - 流程控制语句

- 举例：

  ```shell
  [zlx@localhost 桌面]$ awk '{printf $2 "\t" $3 "\n"}' student.txt
  name	gender
  Li		M
  Shen	M
  Gao		M
  [zlx@localhost 桌面]$ 
  ```

  ```shell
  [zlx@localhost 桌面]$ df -h
  文件系统             容量  已用  可用 已用% 挂载点
  devtmpfs             872M     0  872M    0% /dev
  tmpfs                901M     0  901M    0% /dev/shm
  tmpfs                901M   18M  883M    2% /run
  tmpfs                901M     0  901M    0% /sys/fs/cgroup
  /dev/mapper/cl-root   17G  4.3G   13G   26% /
  /dev/sda1            976M  193M  716M   22% /boot
  tmpfs                181M  1.2M  179M    1% /run/user/42
  tmpfs                181M  4.6M  176M    3% /run/user/1000
  #查看第一列与第5列
  [zlx@localhost 桌面]$ df -h | awk '{printf $1 "\t" $5 "\n"}' 
  文件系统	已用%
  devtmpfs	0%
  tmpfs	0%
  tmpfs	2%
  tmpfs	0%
  /dev/mapper/cl-root	26%
  /dev/sda1	22%
  tmpfs	1%
  tmpfs	3%
  
  #查看cl-root文件系统的已用百分比（grep提取行，awk提取列）
  [zlx@localhost 桌面]$ df -h | grep cl-root | awk '{printf $5 "\n"}'
  26%
  
  #查看cl-root文件系统已用百分比数值（grep提取行，awk提取列，cut进一步提取列
  [zlx@localhost 桌面]$ df -h | grep cl-root | awk '{printf $5 "\n"}' | cut -d '%' -f 1
  26
  #查看cl-root文件系统已用百分比数值（grep提取行，awk提取列后进一步提取列
  [zlx@localhost 桌面]$ df -h | grep cl-root | awk '{printf $5 "\n"}' | awk -F "%" '{printf $1 "\n"}'
  26
  [zlx@localhost 桌面]$ 
  ```

- BEGION:

  #awk 'BEGIN{printf "This is a transcript \n" } {printf $2 "\t" $6 "\n"}' student.txt

- END: 

  #awk 'END{printf "The End \n" } {printf $2 "\t" $6 "\n"}' student.txt 

- FS:用来指定字段分隔符，写在BEGIN中

  \#cat /etc/passwd | grep "/bin/bash" | awk 'BEGIN {FS=":"} {printf $1 "\t" $3 "\n"}'



#### 10.2.4 <font color='red'>sed</font>命令

##### （1）sed命令

- sed 是一种几乎包括在所有 UNIX 平台（包括 Linux）的轻量级流编辑器。sed 主要是用来将数据进行<font color='orange'>选取、替换、删除、新增</font>的命令。

- 命令格式：<font color='red'>sed [选项] ‘[动作]’ 文件名</font>

- 选项：

  - -n： 一般 sed 命令会把所有数据都输出到屏幕 ， 如果加入此选择，则只会把经过 sed 命令处理的行输出到屏幕。

  - -e： 允许对输入数据应用多条 sed 命令编辑

  - -i： 用 sed 的修改结果直接修改读取数据的文件，而不是由屏幕输出

- 动作: 范围行+参数
  - a : 追加，在当前行后添加一行或多行。添加多行时，除最后一行外，每行末尾需要用“\”代表数据未完结。
  - c : 行替换，用c后面的字符串替换原数据行。替换多行时，除最后一行外，每行末尾需用“\”代表数据未完结。
  - i : 插入，在当期行前插入一行或多行。插入多行时，除最后 一行外，每行末尾需要用“\”代表数据未完结。
  - d : 删除，删除指定的行。
  - p : 打印，输出指定的行。
  - s : 字串替换，用一个字符串替换另外一个字符串。格式为“行范围s/旧字串/新字串/g”(和vim中的替换格式类似)。

##### （2）数据选取

- sed ‘2p’ student.txt 

  #打印第二行后打印全部数据。一般sed命令会把所有数据都输出到屏幕 ，只不过会先输出你想要的，这时候就需要-n配合

- sed -n '2p' student.txt

  #打印第二行

- sed -n '1,3p' student.txt

  #打印1-3行

```shell
[zlx@zlx-vmwarevirtualplatform 桌面]$ cat student.txt 
ID	Name	PHP	Linux	MySQL	Average
1	Liming	82	95		86		87.66
2 	Sc		74	96		87		85.66
3	Gao		99	83		93		91.66
[zlx@zlx-vmwarevirtualplatform 桌面]$ sed '2p' student.txt 
ID	Name	PHP	Linux	MySQL	Average
1	Liming	82	95		86		87.66
1	Liming	82	95		86		87.66
2 	Sc		74	96		87		85.66
3	Gao		99	83		93		91.66
[zlx@zlx-vmwarevirtualplatform 桌面]$ sed -n '2p' student.txt 
1	Liming	82	95	86	87.66
[zlx@zlx-vmwarevirtualplatform 桌面]$ sed -n '1,3p' student.txt 
ID	Name	PHP	Linux	MySQL	Average
1	Liming	82	95		86		87.66
2 	Sc		74	96		87		85.66
```



##### （3）数据追加

- sed ‘2a hello’ student.txt
  #在第二行后追加hello

  ```shell
  [zlx@zlx-vmwarevirtualplatform 桌面]$ sed '2a hello' student.txt 
  ID	Name	PHP		Linux	MySQL	Average
  1	Liming	82		95		86		87.66
  hello
  2 	Sc		74		96		87		85.66  
  3	Gao		99		83		93		91.66
  
  [zlx@zlx-vmwarevirtualplatform 桌面]$ sed '2a hello \ world' student.txt 
  ID	Name	PHP	Linux	MySQL	Average
  1	Liming	82	95		86		87.66
  hello  world
  2 	Sc		74	96		87		85.66
  3	Gao		99	83		93		91.66
  ```

  

##### （4）数据插入

- sed ‘2i hello \ world’ student.txt
  在第二行前插入两行数据

  ```shell
  [zlx@zlx-vmwarevirtualplatform 桌面]$ sed '2i hello' student.txt 
  ID	Name	PHP		Linux	MySQL	Average
  hello
  1	Liming	82		95		86		87.66
  2 	Sc		74		96		87		85.66
  3	Gao		99		83		93		91.66
  
  [zlx@zlx-vmwarevirtualplatform 桌面]$ sed '2i hello \ world' student.txt 
  ID	Name	PHP	Linux	MySQL	Average
  hello  world
  1	Liming	82	95	86	87.66
  2 	Sc	74	96	87	85.66
  3	Gao	99	83	93	91.66
  ```

  

##### （5）数据删除

- sed ‘1,3d’ student.txt

  #删除1-3行数据后输出

- sed -i '1,3d'student.txt

  #删除1-3行数据（-i 修改数据文件）

  ```shell
  [zlx@zlx-vmwarevirtualplatform 桌面]$ sed '1,3d' student.txt 
  3	Gao	99	83	93	91.66
  [zlx@zlx-vmwarevirtualplatform 桌面]$ sed -i '3d' student.txt 
  [zlx@zlx-vmwarevirtualplatform 桌面]$ cat student.txt 
  ID	Name	PHP	Linux	MySQL	Average
  1	Liming	82	95	86	87.66
  3	Gao	99	83	93	91.66
  ```

  

##### （6）数据替换

- 行替换：sed '2c No such person' student.txt

  #将第二行替换为指定字符串

  ```shell
  [zlx@zlx-vmwarevirtualplatform 桌面]$ sed '2c No such person' student.txt 
  ID	Name	PHP	Linux	MySQL	Average
  No such person
  2 	Sc	74	96	87	85.66
  3	Gao	99	83	93	91.66
  ```



- 字符串替换

  sed '行范围s/旧字符串/新字符串/g' 文件名

  - sed ‘3s/74/99/g’ student.txt
    在第三行中，把74换成99
  - sed -i ‘3s/74/99/g’ student.txt
    sed操作的数据直接写入文件
  - sed -e ‘s/Liming//g ; s/Gao//g’ student.txt
    同时把“Liming”和“Gao”替换为空（-e 多条sed命令编辑）

  ```shell
  #将第三行的99替换为95
  [zlx@zlx-vmwarevirtualplatform 桌面]$ sed '3s/99/95/g' student.txt 
  ID	Name	PHP	Linux	MySQL	Average
  1	Liming	82	95	86	87.66
  3	Gao	95	83	93	91.66
  [zlx@zlx-vmwarevirtualplatform 桌面]$ sed -i '3s/99/95/g' student.txt 
  [zlx@zlx-vmwarevirtualplatform 桌面]$ cat student.txt 
  ID	Name	PHP	Linux	MySQL	Average
  1	Liming	82	95	86	87.66
  3	Gao		95	83	93	91.66
  #将Liming和Gao的成绩替换
  [zlx@zlx-vmwarevirtualplatform 桌面]$ sed -e '2s/Liming/Gao/g;3s/Gao/Liming/g' student.txt 
  ID	Name	PHP	Linux	MySQL	Average
  1	Gao	82	95	86	87.66
  3	Liming	95	83	93	91.66
  ```

  



### 11.3 字符处理命令

#### 11.3.1 sort排序命令

- 命令格式： <font color='red'>sort [选项] 文件名</font>

- 选项：
  - -f： 忽略大小写 
  - -n： 以数值型进行排序，默认使用字符串型排序 
  - -r： 反向排序 
  - -t： 指定分隔符，默认分隔符是制表符 
  - -k n[,m]： 按照指定的字段范围排序。从第 n 字段开始， m 字段结束（默认到行尾） （注意：-k 3表示用第3到最后的字段范围排序，-k 3,3 才表示用第三个字段排序）

- 举列
  - [root@localhost ~]# sort /etc/passwd 

    #排序用户信息文件 

  - [root@localhost ~]# sort -r /etc/passwd 

    #反向排序

  - [root@localhost ~]# sort -t ":" -k 3,3 /etc/passwd 

    #指定分隔符是“：”，用第三字段开头，第三字段结尾排序，就是只用第三字段排序 

  - [root@localhost ~]# sort -n -t ":" -k 3,3 /etc/passwd 

    #指定分隔符是“：”，用第三个字段且以数值型进行排序

    ```shell
    [zlx@zlx-vmwarevirtualplatform 桌面]$ cat student.txt
    ID	Name	PHP	Linux	MySQL	Average
    1	Liming	82	95		86		87.66
    2	Sc		98	99		100		99
    3	Gao		95	83		93		91.66
    #按平均分从低到高排序
    [zlx@zlx-vmwarevirtualplatform 桌面]$ sort -n -k 6,6 student.txt 
    ID	Name	PHP		Linux	MySQL	Average
    1	Liming	82		95		86		87.66
    3	Gao		95		83		93		91.66
    2	Sc		98		99		100		99
    #按平均分从高到低排序
    [zlx@zlx-vmwarevirtualplatform 桌面]$ sort -r -n -k 6,6 student.txt 
    2	Sc		98	99		100		99
    3	Gao		95	83		93		91.66
    1	Liming	82	95		86		87.66
    ID	Name	PHP	Linux	MySQL	Average
    
    ```

    

#### 11.3.2 wc统计命令

- 命令格式：<font color='red'> wc [选项] 文件名</font>

- 选项： 

- - -l： 只统计行数
  - -w： 只统计单词数 
  - -m： 只统计字符数

  ```sehll
  [zlx@zlx-vmwarevirtualplatform 桌面]$ wc student.txt 
   4 24 95 student.txt
  [zlx@zlx-vmwarevirtualplatform 桌面]$ wc -l student.txt 
  4 student.txt
  [zlx@zlx-vmwarevirtualplatform 桌面]$ wc -w student.txt 
  24 student.txt
  [zlx@zlx-vmwarevirtualplatform 桌面]$ wc -m student.txt 
  95 student.txt
  ```

  
