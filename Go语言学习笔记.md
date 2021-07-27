### Go语言概述

#### 1.Go语言简介

- Go 是一个开源的编程语言，它能让<font color='cornflowerblue'>构造简单、可靠且高效的软件</font>font>变得容易。

- Go是从2007年末由Robert Griesemer, Rob Pike, Ken Thompson主持开发，后来还加入了Ian Lance Taylor, Russ Cox等人，并最终于2009年11月开源，在2012年早些时候发布了Go 1稳定版本。现在Go的开发已经是完全开放的，并且拥有一个活跃的社区。



#### 2.Go语言特色

- 简洁、快速、安全
- 并行、有趣、开源
- 内存管理、v数组安全、编译迅速



#### 3.Go 语言用途

- Go 语言被设计成一门应用于搭载 <font color='cornflowerblue'>Web 服务器</font>，<font color='cornflowerblue'>存储集群</font>或类似用途的<font color='cornflowerblue'>巨型中央服务器</font>的系统编程语言。

- 对于高性能分布式系统领域而言，Go 语言无疑比大多数其它语言有着更高的开发效率。它提供了<font color='cornflowerblue'>海量并行的支持</font>，这对于游戏服务端的开发而言是再好不过了。



### Go语言结构

#### 1.Hello World 实例

（1）Go 语言的基础组成有以下几个部分：
- 包声明
- 引入包
- 函数
- 变量
- 语句 & 表达式
- 注释

（2）接下来让我们来看下简单的代码，该代码输出了"Hello World!":

```go
package main

import "fmt"

func main() {
   /* 这是我的第一个简单的程序 */
   fmt.Println("Hello, World!")
}
```

（3）让我们来看下以上程序的各个部分：

1. *package main* 定义了包名。你必须在源文件中非注释的第一行指明这个文件属于哪个包，如：package main。package main表示一个可独立执行的程序，每个 Go 应用程序都包含一个名为 main 的包。
2. *import "fmt"* 告诉 Go 编译器这个程序需要使用 fmt 包（的函数，或其他元素），<font color='red'>fmt 包实现了格式化 IO（输入/输出）的函数</font>。
3. 下一行 *func main()* 是程序开始执行的函数。main 函数是每一个可执行程序所必须包含的，一般来说都是在启动后第一个执行的函数（如果有 init() 函数则会先执行该函数）。
4. /*...*/ 是注释，在程序执行时将被忽略。单行注释是最常见的注释形式，你可以在任何地方使用以 // 开头的单行注释。多行注释也叫块注释，均已以 /* 开头，并以 */ 结尾，且不可以嵌套使用，多行注释一般用于包的文档描述或注释成块的代码片段。
5. *fmt.Println(...)* 可以将字符串输出到控制台，并在最后自动增加换行字符 \n。
   使用 fmt.Print("hello, world\n") 可以得到相同的结果。
   Print 和 Println 这两个函数也支持使用变量，如：fmt.Println(arr)。如果没有特别指定，它们会以默认的打印格式将变量 arr 输出到控制台。
6. 当标识符（包括常量、变量、类型、函数名、结构字段等等）以一个<font color='red'>大写字母开头</font>，如：Group1，那么使用这种形式的标识符的对象就可以被外部包的代码所使用（客户端程序需要先导入这个包），这被称为导出（像面向对象语言中的 <font color='red'>public</font>）；标识符如果<font color='red'>以小写字母开头</font>，则对包外是不可见的，但是他们在整个包的内部是可见并且可用的（像面向对象语言中的 <font color='red'>private</font> ）。



#### 2.执行 Go 程序

（1）让我们来看下如何编写 Go 代码并执行它。步骤如下：
- 打开编辑器如Sublime2，将以上代码添加到编辑器中。
- 将以上代码保存为 *hello.go*
- 打开命令行，并进入程序文件保存的目录中。
- 输入命令 *go run hello.go* 并按回车执行代码。

（2）如果操作正确你将在屏幕上看到 *"Hello World!"* 字样的输出。

```go
$ go run hello.go
Hello, World!
```



### Go语言基础语法

#### 1.行分隔符

- 在 Go 程序中，<font color='red'>一行代表一个语句结束</font>。每个语句不需要像 C 家族中的其它语言一样以分号 ; 结尾，因为这些工作都将由 Go 编译器自动完成。

- 如果你打算将多个语句写在同一行，它们则必须使用 ; 人为区分，但在实际开发中我们并不鼓励这种做法。



#### 2.注释

- 注释不会被编译，每一个包应该有相关注释。

- 单行注释是最常见的注释形式，你可以在任何地方使用以 // 开头的单行注释。多行注释也叫块注释，均已以 /* 开头，并以 */ 结尾。如：

```go
// 单行注释
/*
 Author by w3cschoolW3Cschool教程
 我是多行注释
 */
```



#### 3.关键字

（1）下面列举了 Go 代码中会使用到的 25 个关键字或保留字：

| break    | default     | func   | interface | select |
| -------- | ----------- | ------ | --------- | ------ |
| case     | defer       | go     | map       | struct |
| chan     | else        | goto   | package   | switch |
| const    | fallthrough | if     | range     | type   |
| continue | for         | import | return    | var    |

（2）除了以上介绍的这些关键字，Go 语言还有 36 个预定义标识符：

| append | bool    | byte    | cap     | close  | complex | complex64 | complex128 | uint16  |
| ------ | ------- | ------- | ------- | ------ | ------- | --------- | ---------- | ------- |
| copy   | false   | float32 | float64 | imag   | int     | int8      | int16      | uint32  |
| int32  | int64   | iota    | len     | make   | new     | nil       | panic      | uint64  |
| print  | println | real    | recover | string | true    | uint      | uint8      | uintptr |



### Go语言数据类型

#### 1.Go 语言数据类型

| 序号 | 类型和描述                                                   |
| :--- | :----------------------------------------------------------- |
| 1    | **布尔型** 布尔型的值只可以是常量 true 或者 false。一个简单的例子：var b bool = true。 |
| 2    | **数字类型** 整型 int 和浮点型 float，Go 语言支持整型和浮点型数字，并且原生支持复数，其中位的运算采用补码。 |
| 3    | **字符串类型:** 字符串就是一串固定长度的字符连接起来的字符序列。Go的字符串是由单个字节连接起来的。Go语言的字符串的字节使用UTF-8编码标识Unicode文本。 |
| 4    | **派生类型:** 包括：(a) 指针类型（Pointer）(b) 数组类型(c) 结构化类型(struct)(d) 联合体类型 (union)(e) 函数类型(f) 切片类型(g) 接口类型（interface）(h) Map 类型(i) Channel 类型 |



#### 2.数字类型

- Go 也有基于架构的类型，例如：int、uint 和 uintptr。

| 序号 | 类型和描述                                                   |
| :--- | :----------------------------------------------------------- |
| 1    | **uint8** 无符号 8 位整型 (0 到 255)                         |
| 2    | **uint16** 无符号 16 位整型 (0 到 65535)                     |
| 3    | **uint32** 无符号 32 位整型 (0 到 4294967295)                |
| 4    | **uint64** 无符号 64 位整型 (0 到 18446744073709551615)      |
| 5    | **int8** 有符号 8 位整型 (-128 到 127)                       |
| 6    | **int16** 有符号 16 位整型 (-32768 到 32767)                 |
| 7    | **int32** 有符号 32 位整型 (-2147483648 到 2147483647)       |
| 8    | **int64** 有符号 64 位整型 (-9223372036854775808 到 9223372036854775807) |

- 浮点型：

| 序号 | 类型和描述                        |
| :--- | :-------------------------------- |
| 1    | **float32** IEEE-754 32位浮点型数 |
| 2    | **float64** IEEE-754 64位浮点型数 |
| 3    | **complex64** 32 位实数和虚数     |
| 4    | **complex128** 64 位实数和虚数    |



#### 3.其他数字类型

以下列出了其他更多的数字类型：

| 序号 | 类型和描述                               |
| :--- | :--------------------------------------- |
| 1    | **byte** 类似 uint8                      |
| 2    | **rune** 类似 int32                      |
| 3    | **uint** 32 或 64 位                     |
| 4    | **int** 与 uint 一样大小                 |
| 5    | **uintptr** 无符号整型，用于存放一个指针 |



### Go语言变量

#### 1.变量声明

（1）第一种，指定变量类型，先声明后赋值

```go
//var v_name v_type
//v_name = value
```

（2）第二种，根据值自行判定变量类型。

```go
//var v_name = value
```

（3）第三种，省略var, 注意 :=左侧的变量不应该是已经声明过的，否则会导致编译错误。

```go
//v_name := value
// 例如
var a int = 10
var b = 10
c : = 10
```



#### 2.多变量声明

（1）类型相同多个变量, 非全局变量

```go
var vname1, vname2, vname3 type
vname1, vname2, vname3 = v1, v2, v3

var vname1, vname2, vname3 = v1, v2, v3 //和python很像,不需要显示声明类型，自动推断

vname1, vname2, vname3 := v1, v2, v3 //出现在:=左侧的变量不应该是已经被声明过的，否则会导致编译错误


```

（2）类型不同的多个变量，全局变量

```go
var (
    vname1 v_type1
    vname2 v_type2
)
```

（3）实例如下

```go
var a int = 12

var b int
b = 13

c := 14

var d, e, f int
d, e, f = 15, 16, 17

g, h, i := 18, 19, “work”

var(
    j int
    k string
)
j = 21
k = "hello"
```



#### 3.值类型和引用类型

（1）所有像 int、float、bool 和 string 这些基本类型都属于<font color='red'>值类型</font>，使用这些类型的变量直接指向存在内存中的值：

![img](https://atts.w3cschool.cn/attachments/day_161120/201611202341534498.png)

当使用等号 `=` 将一个变量的值赋值给另一个变量时，如：`j = i`，实际上是在内存中将 i 的值进行了拷贝：

![img](https://atts.w3cschool.cn/attachments/day_161120/201611202342229643.png)

你可以通过 &i 来获取变量 i 的内存地址，例如：0xf840000040（每次的地址都可能不一样）。值类型的变量的值存储在栈中。

内存地址会根据机器的不同而有所不同，甚至相同的程序在不同的机器上执行后也会有不同的内存地址。因为每台机器可能有不同的存储器布局，并且位置分配也可能不同。

（2）更复杂的数据通常会需要使用多个字，这些数据一般使用<font color='red'>引用类型</font>保存。

一个引用类型的变量 r1 存储的是 r1 的值所在的内存地址（数字），或内存地址中第一个字所在的位置。

![img](https://atts.w3cschool.cn/attachments/day_161120/201611202342474583.png)

这个内存地址为称之为指针，这个指针实际上也被存在另外的某一个字中。

同一个引用类型的指针指向的多个字可以是在连续的内存地址中（内存布局是连续的），这也是计算效率最高的一种存储形式；也可以将这些字分散存放在内存中，每个字都指示了下一个字所在的内存地址。

当使用赋值语句 r2 = r1 时，只有引用（地址）被复制。

如果 r1 的值被改变了，那么这个值的所有引用都会指向被修改后的内容，在这个例子中，r2 也会受到影响。



### Go语言常量

#### 1.常量的定义格式

```
const identifier [type] = value
```

（1）你可以省略类型说明符 [type]，因为编译器可以根据变量的值来推断其类型。

- 显式类型定义： `const b string = "abc"`
- 隐式类型定义： `const b = "abc"`

（2）多个相同类型的声明可以简写为：

```
const c_name1, c_name2 = value1, value2
```



#### 2.iota

（1）iota，特殊常量，可以认为是一个可以被编译器修改的常量。

（2）在每一个const关键字出现时，被重置为0，然后再下一个const出现之前，每出现一次iota，其所代表的数字会自动增加1。

（4）iota 可以被用作枚举值：

```go
const (
    a = iota
    b = iota
    c = iota
)
```

第一个 iota 等于 0，每当 iota 在新的一行被使用时，它的值都会自动加 1；所以 a=0, b=1, c=2 可以简写为如下形式：

```go
const (
    a = iota
    b
    c
)
```

（5）iota 用法

```go
package main

import "fmt"

func main() {
    const (
            a = iota   //0
            b          //1
            c          //2
            d = "ha"   //独立值，iota += 1
            e          //"ha"   iota += 1
            f = 100    //iota +=1
            g          //100  iota +=1
            h = iota   //7,恢复计数
            i          //8
    )
    fmt.Println(a,b,c,d,e,f,g,h,i)
}
```

以上实例运行结果为：

```go
0 1 2 ha ha 100 100 7 8
```



### Go语言运算符

略



### Go语言条件语句

Go 语言提供了以下几种条件判断语句：

| 语句                                                         | 描述                                                         |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| [if 语句](https://www.w3cschool.cn/go/go-if-statement.html)  | **if 语句** 由一个布尔表达式后紧跟一个或多个语句组成。       |
| [if...else 语句](https://www.w3cschool.cn/go/go-if-else-statement.html) | **if 语句** 后可以使用可选的 **else 语句**, else 语句中的表达式在布尔表达式为 false 时执行。 |
| [if 嵌套语句](https://www.w3cschool.cn/go/go-nested-if-statements.html) | 你可以在 **if** 或 **else if** 语句中嵌入一个或多个 **if** 或 **else if** 语句。 |
| [switch 语句](https://www.w3cschool.cn/go/go-switch-statement.html) | **switch** 语句用于基于不同条件执行不同动作。                |
| [select 语句](https://www.w3cschool.cn/go/go-select-statement.html) | **select** 语句类似于 **switch** 语句，但是select会随机执行一个可运行的case。如果没有case可运行，它将阻塞，直到有case可运行。 |

#### 1.if语句

```go
if 布尔表达式 {
   /* 在布尔表达式为 true 时执行 */
}
```

#### 2.if...else语句

```go
if 布尔表达式 {
   /* 在布尔表达式为 true 时执行 */
} else {
  /* 在布尔表达式为 false 时执行 */
}
```

#### 3.if嵌套语句

```go
if 布尔表达式 1 {
   /* 在布尔表达式 1 为 true 时执行 */
   if 布尔表达式 2 {
      /* 在布尔表达式 2 为 true 时执行 */
   }
}
```

#### 4.switch语句

```go
switch var1 {
    case val1:
        ...
    case val2:
        ...
    default:
        ...
}
```

#### 5.select语句

[参考：select用法](https://blog.csdn.net/zhonglinzhang/article/details/45913443)

（1）select是Go中的一个控制结构，类似于用于通信的switch语句。<font color='red'>每个case必须是一个通信操作</font>，要么是发送要么是接收。

**select随机执行一个可运行的case。如果没有case可运行，它将阻塞，直到有case可运行。一个默认的子句应该总是可运行的。**

（2）语法

Go 编程语言中 select 语句的语法如下：

```
select {
    case communication clause  :
       statement(s);      
    case communication clause  :
       statement(s); 
    /* 你可以定义任意数量的 case */
    default : /* 可选 */
       statement(s);
}
```

以下描述了 select 语句的语法：

- 每个case都必须是一个通信

- 所有channel表达式都会被求值

- 所有被发送的表达式都会被求值

- 如果任意某个通信可以进行，它就执行；其他被忽略。

- 如果有多个case都可以运行，Select会随机公平地选出一个执行。其他不会执行。

  否则：

  1. 如果有default子句，则执行该语句。
  2. 如果没有default字句，select将阻塞，直到某个通信可以运行；Go不会重新对channel或值进行求值。

（3）实例

```
package main

import "fmt"

func main() {
   var c1, c2, c3 chan int
   var i1, i2 int
   select {
      case i1 = <-c1:
         fmt.Printf("received ", i1, " from c1\n")
      case c2 <- i2:
         fmt.Printf("sent ", i2, " to c2\n")
      case i3, ok := (<-c3):  // same as: i3, ok := <-c3
         if ok {
            fmt.Printf("received ", i3, " from c3\n")
         } else {
            fmt.Printf("c3 is closed\n")
         }
      default:
         fmt.Printf("no communication\n")
   }    
}
```

以上代码执行结果为：

```
no communication
```



### GO语言循环语句

#### 1.for循环

（1）和 C 语言的 for 一样：

```
for init; condition; post { }
```

（2）和 C 的 while 一样：

```
for condition { }
```

（3）和 C 的 for(;;) 一样：

```
for { }
```

- init： 一般为赋值表达式，给控制变量赋初值；
- condition： 关系表达式或逻辑表达式，循环控制条件；
- post： 一般为赋值表达式，给控制变量增量或减量。

（3）for 循环的 range 格式可以对 slice、map、数组、字符串等进行迭代循环。格式如下：

```
for key, value := range oldMap {
    newMap[key] = value
}
```

```go
func main() {

   var b int = 15
   var a int

   numbers := [6]int{1, 2, 3, 5} 

   /* for 循环 */
   for a := 0; a < 10; a++ {
      fmt.Printf("a 的值为: %d\n", a)
   }

   for a < b {
      a++
      fmt.Printf("a 的值为: %d\n", a)
      }

   for i,x:= range numbers {
      fmt.Printf("第 %d 位 x 的值 = %d\n", i,x)
   }   
}
```



#### 2.循环嵌套

```
for [condition |  ( init; condition; increment ) | Range]
{
   for [condition |  ( init; condition; increment ) | Range]
   {
      statement(s);
   }
   statement(s);
}
```

实例:

以下实例使用循环嵌套来输出 2 到 100 间的素数：

```go
package main

import "fmt"

func main() {
   /* 定义局部变量 */
   var i, j int

   for i=2; i < 100; i++ {
      for j=2; j <= (i/j); j++ {
         if(i%j==0) {
            break; // 如果发现因子，则不是素数
         }
      }
      if(j > (i/j)) {
         fmt.Printf("%d  是素数\n", i);
      }
   }  
}
```



#### 3.循环控制语句

GO 语言支持以下几种循环控制语句：

| 控制语句                                                     | 描述                                             |
| :----------------------------------------------------------- | :----------------------------------------------- |
| [break 语句](https://www.w3cschool.cn/go/go-break-statement.html) | 经常用于中断当前 for 循环或跳出 switch 语句      |
| [continue 语句](https://www.w3cschool.cn/go/go-continue-statement.html) | 跳过当前循环的剩余语句，然后继续进行下一轮循环。 |
| [goto 语句](https://www.w3cschool.cn/go/go-goto-statement.html) | 将控制转移到被标记的语句。                       |



#### Go语言函数

#### 1.函数定义

（1）Go 语言函数定义格式如下：

```
func function_name( [parameter list] ) [return_types]{
   函数体
}
```

（2）函数定义解析：

- func：函数由 func 开始声明
- function_name：函数名称，函数名和参数列表一起构成了函数签名。
- parameter list]：参数列表，参数就像一个占位符，当函数被调用时，你可以将值传递给参数，这个值被称为实际参数。参数列表指定的是参数类型、顺序、及参数个数。参数是可选的，也就是说函数也可以不包含参数。
- return_types：返回类型，函数返回一列值。return_types 是该列值的数据类型。有些功能不需要返回值，这种情况下 return_types 不是必须的。
- 函数体：函数定义的代码集合。

（3）实例

以下实例为 max() 函数的代码，该函数传入两个整型参数 num1 和 num2，并返回这两个参数的最大值：

```go
/* 函数返回两个数的最大值 */
func max(num1, num2 int) int{
   /* 声明局部变量 */
   var result int

   if (num1 > num2) {
      result = num1
   } else {
      result = num2
   }
   return result 
}
```



#### 2.函数调用

当创建函数时，你定义了函数需要做什么，通过调用改函数来执行指定任务。

调用函数，向函数传递参数，并返回值，例如：

```go
package main

import "fmt"

func main() {
   /* 定义局部变量 */
   var a int = 100
   var b int = 200
   var ret int

   /* 调用函数并返回最大值 */
   ret = max(a, b)

   fmt.Printf( "最大值是 : %d\n", ret )
}

/* 函数返回两个数的最大值 */
func max(num1, num2 int) int {
   /* 定义局部变量 */
   var result int

   if (num1 > num2) {
      result = num1
   } else {
      result = num2
   }
   return result 
}
```

以上实例在 main() 函数中调用 max（）函数，执行结果为：

```
最大值是 : 200
```



#### 3.函数返回多个值

Go 函数可以返回多个值，例如：

```go
package main

import "fmt"

func swap(x, y string) (string, string) {
   return y, x
}

func main() {
   a, b := swap("Mahesh", "Kumar")
   fmt.Println(a, b)
}
```

以上实例执行结果为：

```
Kumar Mahesh
```



#### 4.函数参数

函数如果使用参数，该变量可称为函数的形参。

形参就像定义在函数体内的局部变量。

调用函数，可以通过两种方式来传递参数：

| 传递类型                                                     | 描述                                                         |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| [值传递](https://www.w3cschool.cn/go/go-function-call-by-value.html) | 值传递是指在调用函数时将实际参数复制一份传递到函数中，这样在函数中如果对参数进行修改，将不会影响到实际参数。 |
| [引用传递](https://www.w3cschool.cn/go/go-function-call-by-reference.html) | 引用传递是指在调用函数时将实际参数的地址传递到函数中，那么在函数中对参数所进行的修改，将影响到实际参数。 |

默认情况下，Go 语言使用的是值传递，即在调用过程中不会影响到实际参数。



#### 5.函数用法

| 函数用法                                                     | 描述                               |
| :----------------------------------------------------------- | :--------------------------------- |
| [函数作为值](https://www.w3cschool.cn/go/go-function-as-values.html) | 函数定义后可作为值来使用           |
| [闭包](https://www.w3cschool.cn/go/go-function-closures.html) | 闭包是匿名函数，可在动态编程中使用 |
| [方法](https://www.w3cschool.cn/go/go-method.html)           | 方法就是一个包含了接受者的函数     |

（1）函数作为值

Go 语言可以很灵活的创建函数，并作为值使用。以下实例中我们在定义的函数中初始化一个变量，该函数仅仅是为了使用内置函数 math.sqrt() ，实例为：

```go
package main

import (
   "fmt"
   "math"
)

func main(){
   /* 声明函数变量 */
   getSquareRoot := func(x float64) float64 {
      return math.Sqrt(x)
   }

   /* 使用函数 */
   fmt.Println(getSquareRoot(9))

}
```

以上代码执行结果为：

```
3
```

（2）闭包

Go 语言支持匿名函数，可作为闭包。匿名函数是一个"内联"语句或表达式。匿名函数的优越性在于可以直接使用函数内的变量，不必申明。

以下实例中，我们创建了函数 getSequence() ，返回另外一个函数。该函数的目的是在闭包中递增 i 变量，代码如下：

```go
package main

import "fmt"

func getSequence() func() int {
   i:=0
   return func() int {
      i+=1
     return i  
   }
}

func main(){
   /* nextNumber 为一个函数，函数 i 为 0 */
   nextNumber := getSequence()  

   /* 调用 nextNumber 函数，i 变量自增 1 并返回 */
   fmt.Println(nextNumber())
   fmt.Println(nextNumber())
   fmt.Println(nextNumber())
   
   /* 创建新的函数 nextNumber1，并查看结果 */
   nextNumber1 := getSequence()  
   fmt.Println(nextNumber1())
   fmt.Println(nextNumber1())
}
```

以上代码执行结果为：

```
1
2
3
1
2
```

（3）方法



### Go语言变量作用域

略



### Go语言数组

#### 1.声明数组

Go 语言数组声明需要指定元素类型及元素个数，语法格式如下：

```
var variable_name [SIZE] variable_type
```

以上为一维数组的定义方式。数组长度必须是整数且大于 0。例如以下定义了数组 balance 长度为 10 类型为 float32：

```
var balance [10] float32
```



#### 2.初始化数组

- 方式一

  ```go
  func main(){
     var arr [3]int = [3]int{1,2,3}
     //不允许写成 var arr [3]int = {1,2,3}
     fmt.Println(arr) //[1 2 3]
  }
  ```

  

- 方式二

  ```go
  func main(){
     var arr [3]int
     arr[0] = 1
     arr[1] = 2
     arr[2] = 3
     fmt.Println(arr) //[1 2 3]
  }
  ```

  

- 方式三
  这是方式一的一种简化形式。

  ```go
  func main(){
  	var arr = [3]int{1,2,3}
  	fmt.Println(arr) //[1 2 3]
  }
  ```



- 方式四
  方式一的简化形式，也是用得最多的一种方式。

  注意：:=符号只允许在函数中使用，即只能在声明局部变量的时候使用，而var没有这个限制。

  ```go
  func main(){
  	arr := [3]int{1,2,3}
  	fmt.Println(arr) //[1 2 3]
  }
  ```



- 方式五
  让编译器根据初始值的个数自行推断数组的长度。以...来代替[]中的数字，注意若[]中为空则表示为切片。

  ```go
  func main(){
  	var arr = [...]int{1,2,3}
  	fmt.Println(arr) //[1 2 3]
  }
  ```

  

- 方式六
  利用指定索引值的方式来初始化。

  ```go
  func main(){
      arr := [5]int{0:1,4:3} //例如 0:1 表示数组下标0对应的值为1
  	fmt.Println(arr) // [1 0 0 0 3]
  }
  ```

  ```go
  var arr[3]int = [3]int{1,2,3}
  
  var arr1[3]int
  arr1[0] = 1
  arr1[1] = 2
  arr1[2] = 3
  
  var arr2 = [3]int{1,2,3}
  
  arr3 := [3]int{1,2,3}
  
  var arr4 = [...]int{1,2,3}
  
  arr5 := [3]int{0:1,2:3}
  ```

  