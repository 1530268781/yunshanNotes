## python函数装饰器符@

### 1 函数修饰符@的作用

首先介绍函数装饰器。通过装饰器函数，在不修改原函数的前提下，对函数的功能进行合理扩充。
例如：有一个函数func(a, b)，它的功能是求a,b的差值，我现在有一个需求，就是想对函数功能再装饰下，求完差值后再取绝对值，但是不能在func函数内部实现，这时候就需要装饰器函数了，比如func = decorate(func)函数，将func函数作为参数传递给decorate函数，由decorate来丰富func函数，丰富完成后再返回给func,此时func的功能就丰富

用@装饰器的格式来写的目的就是为了书写简单方便

### 2 函数修饰符@的工作原理

假设用 funA() 函数装饰器去装饰 funB() 函数，如下所示：

```python
#funA 作为装饰器函数
def funA(fn):
    #...
    fn() # 执行传入的fn参数
    #...
    return '...'

@funA
def funB():
    #...
```


其等价于：

```python
def funA(fn):
    #...
    fn() # 执行传入的fn参数
    #...
    return '...'

def funB():
    #...
    
funB = funA(funB)
```


通过比对以上 2 段程序不难发现，使用函数装饰器 A() 去装饰另一个函数 B()，其底层执行了如下 2 步操作：

将 B 作为参数传给 A() 函数；
将 A() 函数执行完成的返回值反馈回 B。
具体例子见[Python @函数装饰器及用法（超级详细](http://c.biancheng.net/view/2270.html)
被“＠函数”修饰的函数不再是原来的函数，而是被替换成一个新的东西（取决于装饰器的返回值），即如果装饰器函数的返回值为普通变量，那么被修饰的函数名就变成了变量名；同样，如果装饰器返回的是一个函数的名称，那么被修饰的函数名依然表示一个函数。

### 3 函数修饰符@的使用

例1：被修饰函数带参数

```python
def funA(fn):         # 最外层的装饰器函数的参数为被装饰函数的名字
	def aaa(n):       # 装饰器内层的函数的参数为被装饰函数的参数
		n = n + 3     # 被装饰函数的参数进行运算（可以认为是扩展了功能）
		print("a:",n)
		fn(n)		  # 调用被装饰函数
	return aaa		  # 注意：返回时只需返回函数名，不要把变量也带上

@funA
def funB(a):
	b = a + 100
	print("funB():", b)
funB(1)

输出：
a: 4
funB(): 104
```


例2：修饰符带参数，需要比上面例子多一层包装，把参数也传进去就好

```python
def funA(c):                       # 多一层包装
	def bbb(fn):
		def aaa(n):
			n = n + 3 + c
			print("a:",n)
			fn(n)
			# print("Python教程:",n)
		return aaa
	return bbb

@funA(2)
def funB(a):
	b = a + 100
	print("funB():", b)
funB(1)

输出：
a: 6
funB(): 106
```


参考自[python函数修饰符@的使用](https://www.cnblogs.com/gdjlc/p/11182441.html)

### 4 Python 内置的 3 种函数装饰器：＠staticmethod、＠classmethod 和 @property

其中 staticmethod()、classmethod() 和 property() 都是 Python 的内置函数。

- staticmethod：
  使用场景：当某个方法不需要用到对象中的任何资源时，将这个方法改为一个静态方法

  使用方法： 在方法定义的前面加一个@staticmethod，加上之后, 这个方法就和普通的函数没有什么区别了, 只不过写在了一个类中, 可以使用这个类的对象调用,
  （参考自[@staticmethod](https://www.cnblogs.com/594504110python/p/10062336.html)怎么用?）

  

- classmethod ：
  使用场景：修饰符对应的函数不需要实例化，不需要 self 参数，但第一个参数需要是表示自身类的 cls 参数，可以来调用类的属性，类的方法，实例化对象等。
  （参考自Python classmethod 修饰符）

  

- property：
  使用场景：广泛应用在类的定义中。在绑定属性时，如果我们直接把属性暴露出去，虽然写起来很简单，但是，没办法检查参数，导致可以把成绩随便改；可以让调用者写出简短的代码，同时保证对参数进行必要的检查，这样，程序运行时就减少了出错的可能性。

  原理：在定义类时，把方法变成属性，在实例化类后赋值时就可以把方法当做属性一样进行赋值，在方法中可以定义对参数的检查操作。

  使用方法：详见使用@property

  ————————————————

  版权声明：本文为CSDN博主「关习习」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
  原文链接：https://blog.csdn.net/qq_22829061/article/details/111617810

