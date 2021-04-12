---
title: numpy包
date: 2020-04-26 21:51:29
tags: Python

---

# Numpy包

## 数组

### 定义和属性

```python
import numpy as np
a=np.array([1,2,3,4])#按照列表[1,2,3,4]创建数组a
a.ndim#数组a的维度 1
a.shape#数组a的形状，为一个元组，这里是一维，表示为(4,)
a.size#数组a的大小 1*4=4
a.dtype#数组a的数值类型 int32
a.itemsize#数组a的元素的大小 4
```

<!--more-->

### 生成数组

```python
a=np.arange(st, ed, step)#按step间隔在[st, ed)中生成数据
a=np.linspace(st, ed, num = n)#在[st, ed)中等间隔填充n个数据
#dtype为可选参数，可简单地分为np.int/np.float
a=np.ones(shape,dtype)#按照shape形状，dtype数据类型，生成全一矩阵
a=np.zeros(shape,dtype)#全零矩阵
a=np.eye(length,dtype)#length*length的单位阵
a=np.full(shape,value)#shape形状，值全为value的矩阵
a=np.ones_like(b,dtype)#按照b的形状和dtype数据类型生成全一矩阵
a=np.zeros_like(b,dtype)#原理同上
a=np.full_like(b,value,dtype)#原理同上
```

### 数组维度变换

```python
a.reshape(shape)#返回一个数组a转换为shape形状的新数组（不改变数组a）
a.resize(shape)#按照shape改变数组a
a.flatten()#返回数组a的一维数组形式
```

### 数组类型转换

```python
#将数组a的数据类型变为new_type，返回新数组
new_a=a.astype(new_type)

#example
a.astype(int)#对a取整，返回新数组
```

### 数据索引和切片

```python
#一维数组和列表相同
##下面多维数组
a=np.array([[1,2,3],[4,5,6]])
a[0,1]#第一维位置0，第二维位置1
a[:,1]#第一维全部，第二维位置1
a[::2,1]#第一维按步长2，第二维位置1
a[expression on a]#选出a中满足表达式的部分

#example
a[a>2 and a<6] *= -1 #将a中在(2, 6)之间的数字取负
```

### 数组运算

```python
a+2
a-2
a*2
a/2
a**2
a+b
a-b
a*b
a/b
a**b
a>b#产生布尔型数组
a<b
a>=b
a<=b
a==b
a!=b
np.abs(a)
np.fabs(a)
np.square(a)
np.sqrt(a)
np.log(a)
np.log10(a)
np.log2(a)
np.ceil(a)
np.floor(a)
np.rint(a)#四舍五入值
np.modf(a)#分为小数和整数部分，两个数组分开存储
np.cos(a)
np.cosh(a)
np.sin(a)
np.sinh(a)
np.tan(a)
np.tanh(a)
np.sign(a)#数组各元素的符号值
np.maximum(x,y)
np.fmax()
np.minimun(x,y)
np.fmin()
np.mod(x,y)#模运算
np.copysign(x,y)#y的元素的符号赋给x对应元素
np.vstack((a, b))#垂直拼接a, b数组
np.hstack((a, b))#水平拼接a, b数组
```

### 矩阵运算

```python
#element-wise
A + B
A - B
A * B
A / B

#matrix multiplication
np.dot(A, B)
np.mat(A) * np.mat(B)#显式声明为矩阵再相乘
A.T#矩阵转置
np.linalg.inv(A)#矩阵求逆
```



## 数据读取存储

```python
#非二进制格式，sep为分隔符
a.tofile('myzi.dat',sep=',',format="%d")
c=np.fromfile('myzi.dat',dtype=np.int,sep=',')

#二进制格式
a.tofile('myzi.dat',format="%d")
c=np.fromfile('myzi.dat',dtype=np.int)

#一种快捷的方法
np.save("myzi",a) #.npy
np.savez("myzi",a) #.npz压缩文件

a=np.load("myzi.npy")
a=np.load("myzi.npz")
```

## np.random包

### np.random.rand()

```python
#按照参数(dn代表第n维的元素个数)，生成随机数组，数组元素为[0,1)之间的浮点数，均匀分布
a=np.random.rand(d1,d2,...,dn)
```

### np.random.randn()

```python
#按照参数(dn代表第n维的元素个数)，生成随机数组，数组元素分布符合标准正态分布
a=np.random.rand(d1,d2,...,dn)
```

### np.random.randint()

```python
#随机生成[min,max]之间的整数，形成shape模样的ndarray
a=np.random.randint(min,max,shape)
```

### np.random.seed()

```python
#指定种子s，对于同一个随机数生成操作，如果两个操作的种子相同，那么生成的随机数也相同
np.random.seed(s)
```

### shuffle()

```python
#把数组a打乱（按照第0轴）
np.random.shuffle(a)
```

### permutation()

```python
#返回数组a的一个乱序（按照第0轴）
np.random.permutation(a)
```

### choice()

```python
#从数组b中按照概率p随机抽取元素，生成size形状的数组，replace=True/False代表原来抽取的元素能不能再次被抽取
#replace和p为可选参数，replace默认为True
np.random.choice(b,size,replace,p)
```

### uniform()

```python
#生成均匀分布的size形状的数组，生成元素的范围为[low,high]
np.random.uniform(low,high,size)
```

### normal()

```python
#生成正态分布的size形状的数组，正态分布的均值为avg，标准差为var
np.random.normal(avg,var,size)
```

### poisson()

```python
#按照参数lam，随机生成size形状的符合泊松分布的数组
np.random.poisson(lam,size)
```

## 统计函数

```python
np.sum(a,axis=None)#数组a所有元素的和，默认axis=None，代表不分轴，全部计算
np.mean(a,axis=None)#平均值
np.average(a,axis=None,weights=None)#对数组a，按照权重列表weights，对axis轴进行加权平均值的计算
np.std(a,axis=None)#标准差
np.var(a,axis=None)#方差
np.median(a, axis=None)

#example
np.average(a,axis=1,weights=[10,5,1])#对数组a，第1轴，按weights加权求值

min(a, axis=None)#数组a中的最小值
max(a, axis=None)#数组a中的最大值
argmin(a, axis=None)#数组a中元素最小值降到一维后（flatten后）的下标
argmax(a, axis=None)

unravel_index(index,shape)#根据shape将一维下标index转换为多维下标
ptp(a)#数组a中元素最小值和最大值的差


#examples
a=np.array([[15,14,13,12,11],
           [10,9,8,7,6],
           [5,4,3,2,1]])
np.argmax(a)#结果为0
np.unravel_index(np.argmax(a),b.shape)#重塑成多维下标，结果为(0,0)
```

## 梯度函数

```python
np.gradient(f)#计算数组f中元素的梯度，当f为多维时，返回每个维度梯度

#梯度：连续值之间的变化率，即斜率
#连续的3个值，a,b,c，b点的梯度为(c-a)/2，a点梯度为(b-a)/1，c点梯度为(c-b)/1
```

