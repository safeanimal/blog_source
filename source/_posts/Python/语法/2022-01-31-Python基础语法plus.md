---
title: Python基础语法plus
date: 2022-01-31 16:34:28
categories:
- [编程, Python, 语法]
tags: Python
---



# 人机交互

## Input用法

```python
s = input()#输入一个字符串
s = input("请输入数据：")#提示信息后输入
s = eval(input())#根据字符串自动返回匹配类型的值。输入12，返回int；输入3.2，返回float；输入[1, 2]，返回list
s = float(input())
s = int(input())
```

[进制转换](https://www.notion.so/bb78f7f4749c492980ea773198f0b169)

## Print用法

```python
print(1,2,3,4,5)             # 输出：1 2 3 4 5，默认用空格分隔多个输出对象
print(1,2,3,4,5,sep = ',')   # 输出：1,2,3,4,5，各输出对象间用指定的逗号分隔
print(2019,11,18,sep = '/')  # 输出：2019/11/18
print(23,59,36,sep = ':')    # 输出：23:59:36
print([1,2,3,4,5])           # 输出：[1, 2, 3, 4, 5]，这是一个列表对象
print(*[1,2,3,4,5])          # 输出：1 2 3 4 5，输出时对列表对象（序列类型）进行解包
print('12345')               # 输出：12345，这是一个对象
print(*'12345')              # 输出：1 2 3 4 5，输出时对字符串对象（序列类型）进行解包
for i in range(5):           # 产生整数序列：0,1,2,3,4，依次赋值给i
	print(i)                 # 输出后换行，竖向输出0 1 2 3 4
# 加参数end = ','，输出后不换行，每个输出后跟一个逗号0,1,2,3,4,
for i in range(5):
	print(i,end = ',')       
# 加参数end = ' '，输出后不换行，每个输出后跟一个逗号0 1 2 3 4 （注意4后面有空格）
for i in range(5):
	print(i,end = ' ')
```

<aside> 💡 在已经创建了文件对象的前提下，可通过 file 参数将输出打印到其他文件对象中，如 file=f (f 是已经创建好的文件对象)

</aside>

```python
f = open('test.txt','w',encoding = 'utf-8')       
# 以写模式打开当前路径下的文件test.txt（文件不存在时创建文件），创建文件对象，命名为： f

print('这是要写入的测试数据')                        
# file参数缺省时，默认输出到控制台，即显示器

print('这是要写入的测试数据',file=f)                 
# 将输出的内容 '这是要写入的测试数据' 写入到文件对象 f 中，即写入文件test.txt中

f.close()                                          
# 文件对象的 close()方法刷新缓冲区里任何还没写入的信息，并关闭该文件，这之后便不能再进行写入。
name = input()
city = input()
hobby = input()

#第一种
print(f"我的名字是{name}，来自{city}，我的爱好是{hobby}!")
#第二种
print("我的名字是{}，来自{}，我的爱好是{}".format(name, city, hobby))#{}可以替代int float str

#浮点数精度控制
num = 1.344
print("{:.3f}".format(num))
```

[Python format 格式化函数](https://www.runoob.com/python/att-string-format.html)

<aside> 💡 分行书写**末尾加\*\*或\**()括起来多行**

</aside>

[字符串属性](https://www.notion.so/abf7fbe683654af087b54ef78353c447)

[字符串方法](https://www.notion.so/7fab8a3f232544c9af053128a7ea0d7a)

# 列表

```python
l1 = [('dungeon',7),('winterfell',4),('bran',9),('meelo',6)]
l2 = [[ 'Angle', '0121701100106',99], [ 'Jack', '0121701100107',86], [ 'Tom', '0121701100109',65], [ 'Smith', '0121701100111', 100], ['Bob', '0121701100115',77], ['Lily', '0121701100117', 59]]

sl1 = sorted(l1, key = lambda x:x[1])#对l1每个元素x，比较x[1]排序
sl2 = sorted(l2, key = lambda x:x[0])
sl3 = sorted(l2, key = lambda x:x[2])

print(sl1)
print(sl2)
print(sl3)

list1 = [1, -2, 4, -6]
list1.sort(key = lambda x:(abs(x), x), reverse = True)#对list1排序，先按abs(x)排，再按x，逆序
```

[Python sorted() 函数](https://www.runoob.com/python/python-func-sorted.html)

sorted排序函数（注意与sort函数的区别）

[列表的方法（属性和字符串的一样）](https://www.notion.so/1840c7726e1b4cf8a96784beea109ee7)

[Python3 List sort()方法](https://www.runoob.com/python3/python3-att-list-sort.html)

sort函数（评论区笔记更详细）

- sort函数使用实例

  # **动物重量排序**

  ## **描述**

  输入一系列动物名和其重量，重量单位可能是kg，也可能是t，动物名、与重量间空格分隔，重量数值与单位间无分隔。按重量由小到大排序以二维列表形式输出。‪‬‪‬‪‬‪‬‪‬‮‬‫‬‭‬‪‬‪‬‪‬‪‬‪‬‮‬‪‬‫‬‪‬‪‬‪‬‪‬‪‬‮‬‪‬‫‬‪‬‪‬‪‬‪‬‪‬‮‬‫‬‫‬‪‬‪‬‪‬‪‬‪‬‮‬‭‬‪‬‪‬‪‬‪‬‪‬‪‬‮‬‫‬‫‬

  ## **输入**

  每次输入一个动物名，以及其重量和单位，动物名与重量间用空格分隔，直接输入回车时结束输入。‪‬‪‬‪‬‪‬‪‬‮‬‫‬‭‬‪‬‪‬‪‬‪‬‪‬‮‬‪‬‫‬‪‬‪‬‪‬‪‬‪‬‮‬‪‬‫‬‪‬‪‬‪‬‪‬‪‬‮‬‫‬‫‬‪‬‪‬‪‬‪‬‪‬‮‬‭‬‪‬‪‬‪‬‪‬‪‬‪‬‮‬‫‬‫‬

  ## **输出**

  以二维列表形式输出，按重量由小到大升序排序。‪‬‪‬‪‬‪‬‪‬‮‬‫‬‭‬‪‬‪‬‪‬‪‬‪‬‮‬‪‬‫‬‪‬‪‬‪‬‪‬‪‬‮‬‪‬‫‬‪‬‪‬‪‬‪‬‪‬‮‬‫‬‫‬‪‬‪‬‪‬‪‬‪‬‮‬‭‬‪‬‪‬‪‬‪‬‪‬‪‬‮‬‫‬‫‬

  ## **输入输出示例**

  [Untitled](https://www.notion.so/2e619c56adb64d37955500778fbdc04b)

  ```python
  ans = []
  
  while True:
      s = input()
      if s == '':
          break
      ls = s.split()
      ans.append(ls)
  
  print(sorted(ans, key = lambda x: float(x[1][:-1]) * 1000 if x[1][-1] == 't' else float(x[1][:-2])))#sorted无cmp函数，使用key = lambda x: x的表达式
  ```

<aside> 💡 列表推导式是一种创建新列表的便捷的方式，通常用于根据一个列表中的每个元素通过某种运算或筛选得到另外一系列新数据，创建一个新列表。列表推导式由1个表达式跟一个或多个for 从句、0个或多个if从句构成。‪‬‪‬‪‬‪‬‪‬‮‬‫‬‭‬‪‬‪‬‪‬‪‬‪‬‮‬‪‬‫‬‪‬‪‬‪‬‪‬‪‬‮‬‪‬‫‬‪‬‪‬‪‬‪‬‪‬‮‬‫‬‫‬‪‬‪‬‪‬‪‬‪‬‮‬‭‬‪‬‪‬‪‬‪‬‪‬‪‬‮‬‫‬‫‬

</aside>

```python
# 列表推导式由1个表达式跟一个或多个for 从句、0个或多个if从句构成。
# 列表推导式置于一对方括号之中
[x**2 for x in range(10)]  #计算range(10)中每个数的平方，推导出新列表# 得到新列表[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
```

<aside> 💡 for前面是一个表达式，in 后面是一个列表或能生成列表的对象。将in后面列表中的每一个数据作为for前面表达式的参数，再将计算得到的序列转成列表。if是一个条件从句，可以根据条件返回新列表。‪‬‪‬‪‬‪‬‪‬‮‬‫‬‭‬‪‬‪‬‪‬‪‬‪‬‮‬‪‬‫‬‪‬‪‬‪‬‪‬‪‬‮‬‪‬‫‬‪‬‪‬‪‬‪‬‪‬‮‬‫‬‫‬‪‬‪‬‪‬‪‬‪‬‮‬‭‬‪‬‪‬‪‬‪‬‪‬‪‬‮‬‫‬‫‬

</aside>

<aside> 💡 for前面也可以是一个内置函数或自定义函数：‪‬‪‬‪‬‪‬‪‬‮‬‫‬‭‬‪‬‪‬‪‬‪‬‪‬‮‬‪‬‫‬‪‬‪‬‪‬‪‬‪‬‮‬‪‬‫‬‪‬‪‬‪‬‪‬‪‬‮‬‫‬‫‬‪‬‪‬‪‬‪‬‪‬‮‬‭‬‪‬‪‬‪‬‪‬‪‬‪‬‮‬‫‬‫‬

</aside>

```python
# 自定义函数f(x)def fun(x):
    return x + x ** 2 + x ** 3     # 返回 x + x ** 2 + x ** 3

y = [fun(i) for i in range(10)]    # 列表推导式，按函数fun(x)，推导出新列表print(y)                           # 输出列表[0, 3, 14, 39, 84, 155, 258, 399, 584, 819]
def fun(x):
    return x + x**2 + x ** 3  # 返回x + x ** 2 + x ** 3# 列表推导式，根据原列表中的偶数，推导新列表
y = [fun(i) for i in range(10) if i%2 is 0]  
print(y)                                     # 输出列表[0, 14, 84, 258, 584]
ls = [(x, y) for x in [1,2,3] for y in [3,1,4] if x != y]
print(ls)      # 输出[(1, 3), (1, 4), (2, 3), (2, 1), (2, 4), (3, 1), (3, 4)]
print([x ** 3 for x in range(10)])
# 输出列表 [0, 1, 8, 27, 64, 125, 216, 343, 512, 729]

print((x ** 3 for x in range(10)))
# 输出生成器对象 <generator object <genexpr> at 0x000001FBC47185C8>print(list(x ** 3 for x in range(10)))
# 生成器可遍历或转列表# [0, 1, 8, 27, 64, 125, 216, 343, 512, 729]
dic = {'李明': '20191202001', '张凡':'20191202002'} # 姓名：学号
dic_update = {v: k for k, v in dic.items()}
print(dic_update)
# 输出交换了键和值的字典 {'20191202001': '李明', '20191202002': '张凡'}
print({x ** 3 for x in range(10)})
# 输出集合 {0, 1, 64, 512, 8, 343, 216, 729, 27, 125}
```

# 函数

## 局部变量与全局变量

局部变量：**函数内部**定义的变量，函数执行完后被释放

全局变量：**函数外部**定义的变量

```python
############1
x = 1#全局变量
def f():
	print(x)#输出1

############2
x = 1
def f():
	x = 2
	print(x)#输出2
print(x)#输出1

############3
x = 1
def f():
	global x#声明使用全局变量x
	x = 2

print(x)#输出2
```

## 参数传递

```python
#猜猜下面代码运行结果是什么
def func(x = [],y = [6,7]):
  x.append(8)
  y.append(8)
  return(x+y)

a,b = [1,2],[3,4]
t=func(x=a)
t=func(y=b)
print(func(),end=";")

#结果是[8, 8, 6, 7, 8, 8]
#Note：你会发现形参的改变是会被保留的！注意x，y值的变化！
```

## lambda函数

```python
#用于代替一个有若干参数和一个返回语句的函数
def f(x, y):
	return x + y

f = lambda x, y: x + y
#上面两句作用完全相等，lambda函数更简洁
```

## 常用内置函数

map和filter均返回iterable

```python
#map(function, iterable)

def square(x):
	return x ** 2#每个元素平方
map(square, [1, 2, 3])#返回[1, 4, 9]
map(int, ['3', '4'])#返回34
#filter(function, iterable)

def even(x):
	return x % 2 == 0#筛选偶数

filter(even, [1, 2, 3, 4])#返回[2, 4]
filter(str.digit, 'p2p')#返回'2'
from functools import reduce

def add(x, y) :            # 两数相加
    return x + y
sum1 = reduce(add, [1,2,3,4,5])   # 计算列表和：1+2+3+4+5
sum2 = reduce(lambda x, y: x+y, [1,2,3,4,5])  # 使用 lambda 匿名函数
```

# 集合

<aside> 💡 集合是**无序的**，无重复元素的数据类型，在转化为序列时，其各元素位置**随机**

</aside>

[常用方法](https://www.notion.so/45819f7a3f234a5d8e1ab53a773a5744)

```python
print(set())   # 产生空集合 set()
print(set('Hello Python')) # 字符串转集合，去掉重复字符 {'e', 'H', 'c', 'a', 'R', 'r', 'k', 'n'}

print(set((1,2,3,4,5,5))) # 元组转集合，去掉重复元素  {1, 2, 3, 4, 5}

print(set(set(['H', 'e', 'l', 'l', 'o', ' ', 'P', 'y', 't', 'h', 'o', 'n'])))
#  列表转集合，去掉重复元素  {'e', 'a', 'r', 'k', 'H', 'n', 'c'}
print(set([1,2,1,2,3,4,5,6,0,9,12,22,3])) #
# 列表转集合，去掉重复元素  {0, 1, 2, 3, 4, 5, 6, 9, 12, 22}
print(set({'University' : 'WHUTI', 'Rank' : 40 }))
# 字典转集合，返回字典的键（字典的键唯一），不确定顺序 {'Rank', 'University'}

print(set(enumerate(['H', 'e', 'l', 'l', 'o', ' ', 'P', 'y', 't', 'h', 'o', 'n'])))
# {(9, 'k'), (4, 'e'), (0, 'H'), (7, 'a'), (3, 'k'), (8, 'n'), (1, 'a'), (5, 'r'), (2, 'c'), (6, 'r')}
```

# 类

```python
class Bing():
    def __init__(self,age,name):
        self.age=age;
        self.name=name;
    
    def speak(self):
        print("My name is "+self.name)
    
lover=Bing(30,'wang')
lover.speak()

class Wangbingbing(Bing):
    def __init__(self,age,name):
        super().__init__(age,name)#调用父类方法
        

firstlover=Wangbingbing(22,'wangbingbing')
firstlover.speak()
```

# 文件

open()函数有两个参数：文件名和打开模式。打开模式用于控制使用何种方式打开文件，open()函数提供7种基本的打开模式，如下： r：只读模式，如果文件不存在，返回异常FileNotFoundError，默认值 w：覆盖写模式，文件不存在则创建，存在则完全覆盖原文件 x：创建写模式，文件不存在则创建，存在则返回异常FileExistsError a：追加写模式，文件不存在则创建，存在则在原文件最后追加内容 b：二进制文件模式 t：文本文件模式，默认值 +：与r/w/x/a一同使用，在原功能基础上增加读写功能 其中'r'、'w'、'x'、'a'可以和'b'、't'、'+'组合使用。

```python
with open('test.txt') as file:#打开文件
    content=file.readlines()#按行读，content为一个列表
#[line.strip() for line in file]可以读入时对所有行进行操作，并组成列表
    for line in content:
        if '123' in line:
            print('Here am I')
            
filename='output.txt'#若该文件不存在则先创建一个

#w 写 r 读 a 追加 w+ 读和写
#write不会在写入的文本末尾添加空行。写入文件不存在时，创建文件。写入文件若已存在，写入前会清空原内容。
with open(filename,'w') as file:#以写模式打开文件，r读
    while True:
        name=input("What's your name?")
        if name == 'gui':
            break
        file.write(name+' entered the system!\\n')#向文件写入内容，写入的必须是字符串
        print("Welcome to the system! "+name)
```

# 异常

<aside> 💡 如果当try后的语句执行时发生异常，python就跳回到try并执行**第一个**匹配该异常的except子句，异常处理完毕，控制流就**通过整个try语句**（除非在处理异常时又引发新的异常）。

</aside>

<aside> 💡 如果在try后的语句里发生了异常，却没有匹配的except子句，异常将被递交到**上层的try**，或者到程序的最上层（这样将结束程序，并打印默认的出错信息）。

</aside>

<aside> 💡 如果在try子句执行时没有发生异常，python将执行**else语句后**的语句（如果有else的话），然后控制流通过整个try语句。

</aside>

```python
try:
    print(5/0)
except ZeroDivisionError:#除0异常
    print("Can't divide by zero")
    
try:
    with open('fakefile') as file:
        content=file.read()
        print(content)
except FileNotFoundError:#文件存在异常
    pass#什么也不做
else:#不存在异常
		pass
```

# 模块

```python
#第一种
import math#引入math模块
math.sqrt(10)#math.fun()调用math中的函数

#第二种
from math import sqrt#直接引入math中的sqrt函数
sqrt(10)

#第三种
from math import *#引入math中的全部函数
```

# 常用模块

## collections

### Counter

Counter是字典的一个子类，字典的方法都可以使用，用于统计**可迭代序列**中**每个元素出现的次数**。

```python
from collections import Counter

c = Counter('I just wanna run')
print(c)
Counter({' ': 3, 'n': 3, 'u': 2, 'a': 2, 'I': 1, 'j': 1, 's': 1, 't': 1, 'w': 1, 'r': 1})
```

[Python计数器collections.Counter用法详解_TheGkeone-CSDN博客](https://blog.csdn.net/sinat_28576553/article/details/99131954?utm_medium=distribute.pc_relevant_t0.none-task-blog-BlogCommendFromMachineLearnPai2-1.control&dist_request_id=1328641.50280.16157852818205355&depth_1-utm_source=distribute.pc_relevant_t0.none-task-blog-BlogCommendFromMachineLearnPai2-1.control)