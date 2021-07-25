## 第一章 Linux的目录结构

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



## 第二章 Linux常用命令

### 2.1 文件处理命令

#### 2.1.0 通配符与命令格式

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



#### 2.1.1 文件处理命令ls

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



#### 2.1.2 目录处理命令

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

- 功能描述：删除文件或目录（-r）


- 范例：

  ```shell
  $ rm /tmp/yum.log 
  #删除文件/tmp/yum.log 
  
  $ rm -rf /tmp/Japan/longze 
  #删除目录/tmp/Japan/longze
  ```



#### 2.1.3 文件处理命令

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
  -  -A 显示隐藏字符

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



#### 2.1.4 文件链接命令

##### （5）<font color='red'>ln</font>

- 命令英文原意：link 

- 命令所在路径：/bin/ln 

- 执行权限：所有用户

- 语法：ln -s [原文件] [目标文件] 
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
  - 可以通过i节点来区分，源文件和硬链接文件的i节点是一样的，所以他们会同步更新
  - 但是他不能跨分区放置硬链接比如：/分区 硬链接 不能放到/boot 分区 
  - 而且不能对目录使用



### 2.2 全权限管理命令

#### 4.2.1 权限管理命令 <font color='red'>chmod</font>

##### （1）chmod 

- 命令英文原意：<font color='orange'>ch</font>ange the permissions <font color='orange'>mod</font>e of a file 

- 命令所在路径：/bin/chmod 

- 执行权限：所有用户

- 语法：chmod [{ugoa}{+-=}{rwx}] [文件或目录] 

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


- 语法：chown [用户] [文件或目录] 


- 功能描述：改变文件或目录的所有者 范例：$ chown shenchao fengjie 


- 改变文件 fengjie 的所有者为 shenchao



##### （2）<font color='red'>chgrp </font>

- 命令英文原意：change file group ownership 


- 命令所在路径：/bin/chgrp


- 执行权限：所有用户


- 语法：chgrp [用户组] [文件或目录] 


- 功能描述：改变文件或目录的所属组


- 范例：$ chgrp lampbrother fengjie 


 改变文件 fengjie 的所属组为 lampbrother



##### （3）<font color='red'>umask</font>

- 命令英文原意：the user file-creation mask 


- 命令所在路径：Shell 内置命令


- 执行权限：所有用户


- 语法：umask [-S] 


- -S 以 rwx 形式显示新建文件缺省权限

- 功能描述：显示、设置文件的缺省权限


- 范例： $ umask -S


tips: 新建文件是默认没有 x 权限（比如：防止木马病毒攻击）





## 第十章 Shell基础

### 10.1 Shell概述

#### 10.1.1 Shell是什么

- Shell是一个<font color='orange'>命令行解释器</font>，它为用户提供了一个向Linux内核发送请求以便运行程序的界面系统级程序，用户可以用Shell来 启动、挂起、停止甚至是编写一些程序。

  <img src="Linux%E5%AD%A6%E4%B9%A0%E7%AC%94%E8%AE%B0/image-20210721142803916.png" alt="image-20210721142803916" style="zoom:50%;" />

- Shell还是一个功能相当强大的<font color='orange'>编程语言</font>， 易编写，易调试，灵活性较强。Shell是解释执行的<font color='orange'>脚本语言</font>，在Shell中可以直接调用Linux系统命令。



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
$ cd ~$ ls公共  模板  视频  图片  文档  下载  音乐  桌面$ cd 文档$ ls$ mkdir 脚本练习$ cd 脚本练习$ vim hello.sh$ sh hello.shWelcome to linux world!hhh
```


```sh
#!/bin/bash#This is my first program#Author:zlxecho -e 'Welcome to linux world!\nhhh'
```

注意：在这一段脚本中，#!/bin/Bash这一句是个例外，他并不是注释，是标识，说明以下语句是Shell脚本，解释器是/bin/bash



#### 10.2.3执行脚本

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

例子： [root@localhost ~]# ls ; date ; cd /user ; pwd

[root@localhost ~]# dd if=输入文件 of=输出文件 bs=字节数 count=个数 

选项： 

if=输入文件 指定源文件或源设备 

of=输出文件 指定目标文件或目标设备 

bs=字节数 指定一次输入/输出多少字节，即把这些字节看做一个数据块

count=个数 指定输入/输出多少个数据块 

例子：

[root@localhost ~]# date ; dd if=/dev/zero of=/root/testfile bs=1k count=100000 ; date[root@localhost ~]# ls anaconda-ks.cfg && echo yes 

[root@localhost ~]# ls /root/test || echo "no 

[root@localhost ~]# 命令 && echo yes || echo no

2、 管道符

命令格式：

[root@localhost ~]# 命令 1 | 命令 2 

\#命令 1 的正确输出作为命令 2 的操作对象

颜色显示 

例子：

[root@localhost ~]# ll -a /etc/ | more 

[root@localhost ~]# netstat -an | grep "ESTABLISHED"

[root@localhost ~]# grep [选项] "搜索内容" 文件名

选项： 

-i： 忽略大小写 

-n： 输出行号 

-v： 反向查找 

--color=auto 搜索出的关键字用颜色显示

**10.3.5 通配符与其他特殊符号**

1、通配符[root@localhost ~]# cd /tmp/ 

[root@localhost tmp]# rm -rf * 

[root@localhost tmp]# touch abc 

[root@localhost tmp]# touch abcd 

[root@localhost tmp]# touch 012 

[root@localhost tmp]# touch 0abc 

[root@localhost tmp]# ls ?abc 

[root@localhost tmp]# ls [0-9]* 

[root@localhost tmp]# ls [^0-9]*3、 Bash 中其他特殊符号反引号与$() 

[root@localhost ~]# echo `ls` 

[root@localhost ~]# echo $(date) 

单引号与双引号

[root@localhost ~]# name=sc 

[root@localhost ~]# echo '$name' 

[root@localhost ~]# echo "$name" 

[root@localhost ~]# echo ‘$(date)' 

[root@localhost ~]# echo “$(date)"



### 10.4 Bash 的变量

### 10.5 Bash的运算符-1

### 10.6 Bash的运算符-2

待更新

