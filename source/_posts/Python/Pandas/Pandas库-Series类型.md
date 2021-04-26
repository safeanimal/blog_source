---
title: Pandas库-Series类型
date: 2020-04-26 21:53:04
categories:
- [编程, Python]
tags: Pandas

---

# Pandas库-Series类型

​	Series类型由一组<mark>数据</mark>和与之相关的<mark>数据索引</mark>组成。

​	<mark>Series=Index+ndarray</mark>

<!--more-->

### 默认索引

```python
#input#
import pandas as pd
a=pd.Series([9,8,7,6])
a#显示a的信息
```

```python
#output#
0    9
1    8
2    7
3    6
dtype: int64
```

> 其中左侧为索引，右侧为数据，数据类型为int64（沿用numpy数据类型）

### 自定义索引

```python
#input#
import pandas as pd
b=pd.Series([9,8,7,6],index=['a','b','c','d'])
b#显示b的信息
```

```python
#output#
a    9
b    8
c    7
d    6
dtype: int64
```

## 创建

| 可以创建Series的类型 |
| :------------------: |
|         列表         |
|        标量值        |
|         字典         |
|       ndarray        |
|       其他函数       |

### 用标量值创建

```python
#input#
import pandas as pd
s=pd.Series(25,index=['a','b','c'])#用值25创建,index不能省略
s#显示s的信息
```

```python
#output#
a    25
b    25
c    25
dtype: int64
```

### 用字典创建

#### 例1

```python
#input#
import pandas as pd
d=pd.Series({'a':9,'b':8,'c':7})
d#显示d的信息
```

```python
#output#
a    9
b    8
c    7
dtype: int64
```

#### 例2

```python
#input#
import pandas as pd
e=pd.Series({'a':9,'b':8,'c':7},index=['c','a','b','d'])
e#输出e的信息
```

```python
#output#
c    7.0
a    9.0
b    8.0
d    NaN
dtype: float64
```

> index所对应的值来源于第一个字典参数，c对应7...，d没有对应，默认NaN

### 用ndarray创建

#### 例1

```python
#input#
import pandas as pd
import numpy as np
n=pd.Series(np.arange(5))
n#输出n的信息
```

```python
0    0
1    1
2    2
3    3
4    4
dtype: int32
```

#### 例2

```python
#input#
import pandas as pd
import numpy as np
m=pd.Series(np.arange(5),index=np.arange(9,4,-1))
m#输出m的信息
```

```python
9    0
8    1
7    2
6    3
5    4
dtype: int32
```

## 基本操作

#### 例1

```python
#IPython控制台操作#
import pandas as pd

b=pd.Series([9,8,7,6],['a','b','c','d'])#创建值，指定索引

b
Out[3]: 
a    9
b    8
c    7
d    6
dtype: int64

b.index
Out[4]: Index(['a', 'b', 'c', 'd'], dtype='object')#索引为pandas定义的Index类型

b.values
Out[5]: array([9, 8, 7, 6], dtype=int64)#值为numpy定义的ndarray类型

b['b']
Out[6]: 8

b[1]
Out[7]: 8

b[['c','d',0]]#索引方式需一致，不然就像下面一样报错
Traceback (most recent call last):

  File "<ipython-input-8-9469556e3898>", line 1, in <module>
    b[['c','d',0]]

  File "E:\Anaconda\lib\site-packages\pandas\core\series.py", line 910, in __getitem__
    return self._get_with(key)

  File "E:\Anaconda\lib\site-packages\pandas\core\series.py", line 958, in _get_with
    return self.loc[key]

  File "E:\Anaconda\lib\site-packages\pandas\core\indexing.py", line 1767, in __getitem__
    return self._getitem_axis(maybe_callable, axis=axis)

  File "E:\Anaconda\lib\site-packages\pandas\core\indexing.py", line 1953, in _getitem_axis
    return self._getitem_iterable(key, axis=axis)

  File "E:\Anaconda\lib\site-packages\pandas\core\indexing.py", line 1594, in _getitem_iterable
    keyarr, indexer = self._get_listlike_indexer(key, axis, raise_missing=False)

  File "E:\Anaconda\lib\site-packages\pandas\core\indexing.py", line 1552, in _get_listlike_indexer
    keyarr, indexer, o._get_axis_number(axis), raise_missing=raise_missing

  File "E:\Anaconda\lib\site-packages\pandas\core\indexing.py", line 1654, in _validate_read_indexer
    "Passing list-likes to .loc or [] with any missing labels "

KeyError: 'Passing list-likes to .loc or [] with any missing labels is no longer supported, see https://pandas.pydata.org/pandas-docs/stable/user_guide/indexing.html#deprecate-loc-reindex-listlike'


b[['c','d','a']]#一致的索引
Out[9]: 
c    7
d    6
a    9
dtype: int64
```

#### 例2

```python
#IPython控制台操作#
import pandas as pd

import numpy as np

b=pd.Series([9,8,7,6],['a','b','c','d'])

b
Out[4]: 
a    9
b    8
c    7
d    6
dtype: int64

b[3]
Out[5]: 6

b[:3]#切片结果仍然为Series类型，结果保留自定义索引
Out[6]: 
a    9
b    8
c    7
dtype: int64

b[b>b.median()]#可以使用ndarray的操作
Out[7]: 
a    9
b    8
dtype: int64

np.exp(b)
Out[8]: 
a    8103.083928
b    2980.957987
c    1096.633158
d     403.428793
dtype: float64
```

|                Series类型操作和ndarray类似                 |
| :--------------------------------------------------------: |
|                     索引方式相同，用[]                     |
|          **NumPy中的运算和操作**可用于Series类型           |
|              可以通过自定义索引的列表进行切片              |
| 可以通过自动索引进行切片，如果存在自定义索引，则一同被切片 |

#### 例3

```python
#IPython控制台操作#
import pandas as pd

b=pd.Series([9,8,7,6],['a','b','c','d'])

b['b']
Out[3]: 8

'c' in b	#in判断的是索引，这里为'c'是否在b的索引里面
Out[4]: True

0 in b
Out[5]: False

b.get('f',100)	#如果存在索引'b'，返回索引对应的值；不存在索引'b'的话，返回100
Out[6]: 100
```

| Series类型的操作类似Python字典类型 |
| :--------------------------------: |
|         通过自定义索引访问         |
|            保留字in操作            |
|           使用.get()方法           |

## 对齐操作

### Series+Series

```python
#IPython控制台操作#
import pandas as pd

a=pd.Series([1,2,3],['c','d','e'])

b=pd.Series([9,8,7,6],['a','b','c','d'])

a+b
Out[4]: 
a    NaN
b    NaN
c    8.0
d    8.0
e    NaN
dtype: float64
```

> Series类型在运算中<mark>自动对齐不同索引的数据</mark>

## Series的修改

```python
import pandas as pd

b=pd.Series([9,8,7,6],['a','b','c','d'])

b['a']=15

b.name="Series"

b.index.name="索引"

b
Out[6]: 
索引
a    15
b     8
c     7
d     6
Name: Series, dtype: int64

b.name="New Series"

b['b','c']=20

b
Out[9]: 
索引
a    15
b    20
c    20
d     6
Name: New Series, dtype: int64
```

> + Series可以随时修改，立即生效
> + 可以设置Series.name和Series.index.name属性