---
title: Pandas库-DataFrame类型
date: 2020-04-26 21:52:18
categories:
- [编程, Python]
tags: Pandas

---

# Pandas库-DataFrame类型

​	<mark>DataFrame=共用相同索引的一组列</mark>

+ 每列值的类型可以不同
+ DataFrame既有行索引，也有列索引

## DataFrame的创建

|               可以创建DataFrame的类型               |
| :-------------------------------------------------: |
|                     二维ndarray                     |
| 一维ndarray、列表、字典、元组或Series构成的**字典** |
|                       Series                        |
|                    其他DataFrame                    |

<!--more-->

### 由二维ndarray创建

```python
#IPython控制台操作#
import pandas as pd

import numpy as np

d=pd.DataFrame(np.arange(10).reshape(2,5))

d
Out[4]: 
   0  1  2  3  4
0  0  1  2  3  4
1  5  6  7  8  9
```

> 此例的DataFrame就是<mark>原数据</mark>加上<mark>行和列的索引</mark>

### 由一维对象构成的字典创建

#### Series构成的字典

```python
#IPython控制台操作#
import pandas as pd

dt={'one':pd.Series([1,2,3],index=['a','b','c']),'two':pd.Series([9,8,7,6],index=['a','b','c','d'])}

d=pd.DataFrame(dt)

d
Out[4]: 
   one  two
a  1.0    9
b  2.0    8
c  3.0    7
d  NaN    6

pd.DataFrame(dt,index=['b','c','a'],columns=['two','three'])
Out[5]: 
   two three
b    8   NaN
c    7   NaN
a    9   NaN
```

> 索引为'three'的列是没有的，但会自动补齐

#### 列表构成的字典

```python
#IPython控制台操作#
import pandas as pd
d1={'one':[1,2,3,4],'two':[9,8,7,6]}
import pandas as pd

dl={'one':[1,2,3,4],'two':[9,8,7,6]}

d=pd.DataFrame(dl,index=['a','b','c','d'])#字典没规定行索引，这里规定

d
Out[4]: 
   one  two
a    1    9
b    2    8
c    3    7
d    4    6

d['a']['one']#这种方法是错误的，必须先列后行
##KeyError: 'a'##

d['one']['a']
Out[6]: 1

d['one']
Out[7]: 
a    1
b    2
c    3
d    4
Name: one, dtype: int64

d.index
Out[8]: Index(['a', 'b', 'c', 'd'], dtype='object')

d.columns
Out[9]: Index(['one', 'two'], dtype='object')

d.values
Out[10]: 
array([[1, 9],
       [2, 8],
       [3, 7],
       [4, 6]], dtype=int64)
```

## 数据类型操作

### 重新索引

`DataFrame.reindex(index=None,columns=None,...)`

|     参数      |                             说明                             |
| :-----------: | :----------------------------------------------------------: |
| index,columns |                      新的行列自定义索引                      |
|  fill_value   |               重新索引中，用于填充缺失位置的值               |
|    method     | 填充方法,fill当前值向前填充（等于前一项的值），bfill向后填充 |
|     limit     |                          最大填充量                          |
|     copy      |                    默认True，生成新的对象                    |

### 索引类型操作

|        方法        |                  说明                  |
| :----------------: | :------------------------------------: |
|    .append(idx)    | 连接另一个Index对象，产生新的Index对象 |
|     .diff(idx)     |      计算差集，产生新的Index对象       |
| .intersection(idx) |                计算交集                |
|    .union(idx)     |                计算并集                |
|    .delete(loc)    |          删除loc位置处的元素           |
|   .insert(loc,e)   |         在loc位置增加一个元素          |

```python
#IPython控制台操作#
import pandas as pd

a={"城市":["沈阳","深圳","广州","上海","北京"],"同比":[101.4,102.0,101.3,101.2,101.5],"环比":[100.1,102.0,101.3,101.2,101.5],"定基":[101.6,145.5,120.0,127.8,121.4]}#列表组成字典创建DataFrame，指定了列索引名

a
Out[3]: 
{'城市': ['沈阳', '深圳', '广州', '上海', '北京'],
 '同比': [101.4, 102.0, 101.3, 101.2, 101.5],
 '环比': [100.1, 102.0, 101.3, 101.2, 101.5],
 '定基': [101.6, 145.5, 120.0, 127.8, 121.4]}

b=pd.DataFrame(a,index=['c5','c4','c3','c2','c1'])#指定行索引名

b
Out[5]: 
    城市     同比     环比     定基
c5  沈阳  101.4  100.1  101.6
c4  深圳  102.0  102.0  145.5
c3  广州  101.3  101.3  120.0
c2  上海  101.2  101.2  127.8
c1  北京  101.5  101.5  121.4

nc=b.columns.delete(2)#删除列索引下标为2的项

nc
Out[7]: Index(['城市', '同比', '定基'], dtype='object')


ni=b.index.insert(5,'c0')#在行索引下标为5的地方插入行索引名'c0'

ni
Out[8]: Index(['c5', 'c4', 'c3', 'c2', 'c1', 'c0'], dtype='object')

nb=b.reindex(index=ni,columns=nc)#按照新的index,columns重新指定索引

nb
Out[9]: 
     城市     同比     定基
c5   沈阳  101.4  101.6
c4   深圳  102.0  145.5
c3   广州  101.3  120.0
c2   上海  101.2  127.8
c1   北京  101.5  121.4
c0  NaN    NaN    NaN

nb.drop('c0')#删除索引'c0'，默认axis=0
Out[10]: 
    城市     同比     定基
c5  沈阳  101.4  101.6
c4  深圳  102.0  145.5
c3  广州  101.3  120.0
c2  上海  101.2  127.8
c1  北京  101.5  121.4

nb.drop('同比',axis=1)#删除索引'同比'，指定axis=1
Out[11]: 
     城市     定基
c5   沈阳  101.6
c4   深圳  145.5
c3   广州  120.0
c2   上海  127.8
c1   北京  121.4
c0  NaN    NaN
```

## 数据类型计算

> **算术运算法则**
>
> + 算术运算根据行列索引，补齐后运算，结果默认为浮点数
> + 补齐时缺项填充NaN（空值）
> + 二维和一维、一维和零维为广播运算
> + 采用+ - * / 符号进行的二元运算产生新的对象
>
> 也可以用如下函数进行四则运算：
>
> |      方法       |           说明           |
> | :-------------: | :----------------------: |
> | .add(d,**argws) | 类型间加法运算，可选参数 |
> | .sub(d,**argws) | 类型间减法运算，可选参数 |
> | .mul(d,**argws) | 类型间乘法运算，可选参数 |
> | .div(d,**argws) | 类型间除法运算，可选参数 |

#### 一般四则运算

```python
#IPython控制台操作#
import pandas as pd

import numpy as np

a=pd.DataFrame(np.arange(12).reshape(3,4))

a
Out[4]: 
   0  1   2   3
0  0  1   2   3
1  4  5   6   7
2  8  9  10  11

b=pd.DataFrame(np.arange(20).reshape(4,5))

b
Out[6]: 
    0   1   2   3   4
0   0   1   2   3   4
1   5   6   7   8   9
2  10  11  12  13  14
3  15  16  17  18  19

a+b
Out[7]: 
      0     1     2     3   4
0   0.0   2.0   4.0   6.0 NaN
1   9.0  11.0  13.0  15.0 NaN
2  18.0  20.0  22.0  24.0 NaN
3   NaN   NaN   NaN   NaN NaN

a*b
Out[8]: 
      0     1      2      3   4
0   0.0   1.0    4.0    9.0 NaN
1  20.0  30.0   42.0   56.0 NaN
2  80.0  99.0  120.0  143.0 NaN
3   NaN   NaN    NaN    NaN NaN
```

#### 用函数进行四则运算

```python
#IPython控制台操作#
import pandas as pd

import numpy as np

a=pd.DataFrame(np.arange(12).reshape(3,4))

a
Out[4]: 
   0  1   2   3
0  0  1   2   3
1  4  5   6   7
2  8  9  10  11

b=pd.DataFrame(np.arange(20).reshape(4,5))

b
Out[6]: 
    0   1   2   3   4
0   0   1   2   3   4
1   5   6   7   8   9
2  10  11  12  13  14
3  15  16  17  18  19

b.add(a,fill_value=100)		#100代替NaN进行运算
Out[7]: 
       0      1      2      3      4
0    0.0    2.0    4.0    6.0  104.0
1    9.0   11.0   13.0   15.0  109.0
2   18.0   20.0   22.0   24.0  114.0
3  115.0  116.0  117.0  118.0  119.0

a.mul(b,fill_value=0)		#0代替NaN进行运算
Out[8]: 
      0     1      2      3    4
0   0.0   1.0    4.0    9.0  0.0
1  20.0  30.0   42.0   56.0  0.0
2  80.0  99.0  120.0  143.0  0.0
3   0.0   0.0    0.0    0.0  0.0
```

#### 广播运算

```python
#IPython控制台操作#
import pandas as pd

import numpy as np

b=pd.DataFrame(np.arange(20).reshape(4,5))

b
Out[4]: 
    0   1   2   3   4
0   0   1   2   3   4
1   5   6   7   8   9
2  10  11  12  13  14
3  15  16  17  18  19

c=pd.Series(np.arange(4))

c
Out[6]: 
0    0
1    1
2    2
3    3
dtype: int32

c-10	#c的每一个值-10
Out[7]: 
0   -10
1    -9
2    -8
3    -7
dtype: int32

b-c		#b每一行-c
Out[8]: 
      0     1     2     3   4
0   0.0   0.0   0.0   0.0 NaN
1   5.0   5.0   5.0   5.0 NaN
2  10.0  10.0  10.0  10.0 NaN
3  15.0  15.0  15.0  15.0 NaN
```

> 默认运算发生在高维数据的<mark>0轴上</mark>，要想在其他轴上，可类似`b.sub(c,axis=1)`来指定。

#### 比较运算

```python
#IPython控制台操作#
import pandas as pd

import numpy as np

a=pd.DataFrame(np.arange(12).reshape(3,4))

a
Out[4]: 
   0  1   2   3
0  0  1   2   3
1  4  5   6   7
2  8  9  10  11

d=pd.DataFrame(np.arange(12,0,-1).reshape(3,4))

d
Out[6]: 
    0   1   2  3
0  12  11  10  9
1   8   7   6  5
2   4   3   2  1

a>d		#比较运算
Out[7]: 
       0      1      2      3
0  False  False  False  False
1  False  False  False   True
2   True   True   True   True

a==d	#比较运算
Out[8]: 
       0      1      2      3
0  False  False  False  False
1  False  False   True  False
2  False  False  False  False
```

> <mark>同维度</mark>比较运算，数据规模必须<mark>一样</mark>

```python
#IPython控制台操作#
import pandas as pd

import numpy as np

a=pd.DataFrame(np.arange(12).reshape(3,4))

a
Out[4]: 
   0  1   2   3
0  0  1   2   3
1  4  5   6   7
2  8  9  10  11

c=pd.Series(np.arange(4))

c
Out[6]: 
0    0
1    1
2    2
3    3
dtype: int32

a>c
Out[7]: 
       0      1      2      3
0  False  False  False  False
1   True   True   True   True
2   True   True   True   True

c>0
Out[8]: 
0    False
1     True
2     True
3     True
dtype: bool
```

> 不同维度比较，广播运算，默认在1轴