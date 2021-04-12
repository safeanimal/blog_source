---
title: Pandas库-统计
date: 2020-04-26 21:56:50
tags: Python

---

# Pandas库-统计

---

|             摘要             |
| :--------------------------: |
|      基本统计(包括排序)      |
|             分布             |
| 数据特征（相关性、周期性等） |
|     数据挖掘（形成知识）     |

<!--more-->

## 数据的基本统计

### 排序

|                      函数                       | 功能                         |
| :---------------------------------------------: | ---------------------------- |
|       .sort_index(axis=0,ascending=True)        | 指定轴然后根据索引排序       |
|    Series.sort_values(axis=0,ascending=True)    | Series指定轴进行排序         |
| DataFrame.sort_values(by,axis=0,ascending=True) | by指定特定索引，按该索引排序 |

排序后，NaN统一放到最后

```python
#IPython控制台操作#
import pandas as pd

import numpy as np

b=pd.DataFrame(np.arange(20).reshape(4,5),index=['c','a','d','b'])

b
Out[4]: 
    0   1   2   3   4
c   0   1   2   3   4
a   5   6   7   8   9
d  10  11  12  13  14
b  15  16  17  18  19

b.sort_index()
Out[5]: 
    0   1   2   3   4
a   5   6   7   8   9
b  15  16  17  18  19
c   0   1   2   3   4
d  10  11  12  13  14

b.sort_index(ascending=False)
Out[6]: 
    0   1   2   3   4
d  10  11  12  13  14
c   0   1   2   3   4
b  15  16  17  18  19
a   5   6   7   8   9

c=b.sort_index(axis=1,ascending=False)

c
Out[8]: 
    4   3   2   1   0
c   4   3   2   1   0
a   9   8   7   6   5
d  14  13  12  11  10
b  19  18  17  16  15

c=b.sort_values(2,ascending=False)#按下标为2的列降序排序

c
Out[10]: 
    0   1   2   3   4
b  15  16  17  18  19
d  10  11  12  13  14
a   5   6   7   8   9
c   0   1   2   3   4

c=c.sort_values('a',axis=1,ascending=False)#按1轴，索引为'a'的数据排序

c
Out[12]: 
    4   3   2   1   0
b  19  18  17  16  15
d  14  13  12  11  10
a   9   8   7   6   5
c   4   3   2   1   0
```

## 数据的基本统计分析

|        方法         |                        说明                        |
| :-----------------: | :------------------------------------------------: |
|       .sum()        |           计算数据总和，按0轴计算，下同            |
|      .count()       |                   非NaN值的数量                    |
|       .mean()       |                计算数据的算术平均值                |
|      .median()      |                计算数据的算术中位数                |
|    .var() .std()    |               计算数据的方差、标准差               |
|    .min() .max()    |              计算数据的最小值、最大值              |
| .argmin() .argmax() |  计算数据最大值、最小值位置的索引位置（自动索引）  |
| .idxmin() .idxmax() | 计算数据最大值、最小值所在位置的索引（自定义索引） |
|     .describe()     |        针对0轴对上面所有的分析进行汇总显示         |

#### 例1

```python
import pandas as pd

a=pd.Series([9,8,7,6],index=['a','b','c','d'])

a
Out[3]: 
a    9
b    8
c    7
d    6
dtype: int64

a.describe()
Out[4]: 
count    4.000000
mean     7.500000
std      1.290994
min      6.000000
25%      6.750000
50%      7.500000
75%      8.250000
max      9.000000
dtype: float64

type(a.describe())	#返回的类型为Series
Out[5]: pandas.core.series.Series

a.describe()['count']	#当做Series来操作
Out[6]: 4.0

a.describe()['max']		#当做Series来操作
Out[7]: 9.0
```

#### 例2

```python
#IPython控制台操作#
import pandas as pd

import numpy as np

b=pd.DataFrame(np.arange(20).reshape(4,5),index=['c','a','d','b'])

b
Out[4]: 
    0   1   2   3   4
c   0   1   2   3   4
a   5   6   7   8   9
d  10  11  12  13  14
b  15  16  17  18  19

b.describe()
Out[5]: 
               0          1          2          3          4
count   4.000000   4.000000   4.000000   4.000000   4.000000
mean    7.500000   8.500000   9.500000  10.500000  11.500000
std     6.454972   6.454972   6.454972   6.454972   6.454972
min     0.000000   1.000000   2.000000   3.000000   4.000000
25%     3.750000   4.750000   5.750000   6.750000   7.750000
50%     7.500000   8.500000   9.500000  10.500000  11.500000
75%    11.250000  12.250000  13.250000  14.250000  15.250000
max    15.000000  16.000000  17.000000  18.000000  19.000000

type(b.describe()) 	#返回的是DataFrame类型
Out[6]: pandas.core.frame.DataFrame

b.describe().loc['max']		#访问行
Out[7]: 
0    15.0
1    16.0
2    17.0
3    18.0
4    19.0
Name: max, dtype: float64

b.describe()[2]		#访问列
Out[8]: 
count     4.000000
mean      9.500000
std       6.454972
min       2.000000
25%       5.750000
50%       9.500000
75%      13.250000
max      17.000000
Name: 2, dtype: float64
```

## 累计统计分析函数

`函数适用于Series和DataFrame`

|    方法    |                   说明                   |
| :--------: | :--------------------------------------: |
| .cumsum()  | 依次给出前1、2、...、n个数的和，下面类似 |
| .cumprod() |                    积                    |
| .cummax()  |                  最大值                  |
| .cummin()  |                  最小值                  |

|          方法           |               说明                |
| :---------------------: | :-------------------------------: |
|    .rolling(w).sum()    | 依次计算相邻w个元素的和，下面类似 |
|   .rolling(w).mean()    |            算术平均值             |
|    .rolling(w).var()    |               方差                |
|    .rolling(w).std()    |              标准差               |
| .rolling(w).min().max() |           最小、最大值            |

#### 例1

```python
#IPython控制台操作#
import pandas as pd

import numpy as np

b=pd.DataFrame(np.arange(20).reshape(4,5),index=['c','a','d','b'])

b
Out[4]: 
    0   1   2   3   4
c   0   1   2   3   4
a   5   6   7   8   9
d  10  11  12  13  14
b  15  16  17  18  19

b.cumsum()
Out[5]: 
    0   1   2   3   4
c   0   1   2   3   4
a   5   7   9  11  13
d  15  18  21  24  27
b  30  34  38  42  46
```

#### 例2

```python
#IPython控制台操作#
import pandas as pd

import numpy as np

b=pd.DataFrame(np.arange(20).reshape(4,5),index=['c','a','d','b'])

b
Out[4]: 
    0   1   2   3   4
c   0   1   2   3   4
a   5   6   7   8   9
d  10  11  12  13  14
b  15  16  17  18  19

b.rolling(2).sum()	#第一行=前一项+此项	前一项=NaN
Out[5]: 
      0     1     2     3     4
c   NaN   NaN   NaN   NaN   NaN
a   5.0   7.0   9.0  11.0  13.0
d  15.0  17.0  19.0  21.0  23.0
b  25.0  27.0  29.0  31.0  33.0

b.rolling(3).sum()
Out[6]: 
      0     1     2     3     4
c   NaN   NaN   NaN   NaN   NaN
a   NaN   NaN   NaN   NaN   NaN
d  15.0  18.0  21.0  24.0  27.0
b  30.0  33.0  36.0  39.0  42.0
```

## 数据相关性分析

**协方差**：$cov(X,Y)=\frac{\sum_{i=1}^n(X_i-\bar{X})(Y_i-\bar{Y})}{n-1}$

+ 协方差>0，X与Y正相关
+ 协方差<0，X与Y负相关
+ 协方差=0，X与Y独立无关

**Pearson相关系数**：$r=\frac{\sum_{i=1}^n(x_i-\bar{x})(y_i-\bar{y})}{\sqrt{\sum_{i=1}^n(x_i-\bar{x})^2} \sqrt{\sum_{i=1}^n(y_i-\bar{y})^2}}$

$r\in[-1,1]$

+ $r\in[0.8,1.0]$ 极强相关
+ $r\in[0.6,0.8]$ 强相关
+ $r\in[0.4,0.6]$ 中等程度相关
+ $r\in[0.2,0.4]$ 弱相关
+ $r\in[0.0,0.2]$ 极弱相关

|  方法   |                    说明                     |
| :-----: | :-----------------------------------------: |
| .cov()  |               计算协方差矩阵                |
| .corr() | 计算相关系数矩阵,Pearson、Spearman、Kendall |

```python
#IPython控制台操作#
import pandas as pd

hprice=pd.Series([3.04,22.93,12.75,22.6,12.33],index=['2008','2009','2010','2011','2012'])

m2=pd.Series([8.18,18.38,9.13,7.82,6.69],index=['2008','2009','2010','2011','2012'])

hprice.corr(m2)
Out[4]: 0.5239439145220387
```

