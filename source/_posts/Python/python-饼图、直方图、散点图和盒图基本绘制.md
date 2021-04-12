---
title: python 饼图、直方图、散点图和盒图基本绘制
date: 2020-04-26 21:56:03
tags: Python

---

# python 饼图、直方图、散点图和盒图基本绘制

## 饼图

```python
import matplotlib.pyplot as plt

labels='Frogs','Hogs','Dogs','Logs'#对应扇块的标签
sizes=[15,30,45,10]#对应扇块的尺寸
explode=(0,0.1,0,0)#对应扇块突出的比例

plt.pie(sizes,explode=explode,labels=labels,autopct='%1.1f%%',shadow=False,startangle=90)#autopct为显示百分比的格式，shadow为是否带阴影，startangle为起始角度

plt.axis('equal')#让饼图变圆
plt.show()
```

![pyplot绘制的饼图](https://img-blog.csdnimg.cn/20200410191429792.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70#pic_center)

<!--more-->

## 直方图

### 使用pygal

```python
from random import randint

class Die():

    def __init__(self,num_sides=6):
        self.num_sides=num_sides

    def roll(self):
        return randint(1,self.num_sides)

```

```python
import pygal
from die import Die
die=Die()

results=[]
for roll_num in range(100):
    result=die.roll()
    results.append(result)

frequencies=[]
for value in range(1,die.num_sides+1):
    frequency=results.count(value)
    frequencies.append(frequency)

print(frequencies)

hist=pygal.Bar()

hist.title="Results of rooling one D6 100 times."
hist.x_labels=[str(x) for x in range(1,7)]#x轴标签
hist._x_title="Result"
hist._y_title="Frequency of Result"

hist.add('D6',frequencies)#增加要显示的数据
hist.render_to_file('die_visual.svg')
```

![pygal绘制的直方图效果](https://img-blog.csdnimg.cn/20200410191840550.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70#pic_center)

### 使用pyplot

```python
import numpy as np
import matplotlib.pyplot as plt
#下面随机生成数据
np.random.seed(0)
mu,sigma=100,20
a=np.random.normal(mu,sigma,size=100)

plt.hist(a,20,normed=1,histtype='stepfilled',facecolor='b',alpha=0.75)#20表示生成的图形有20个直方（数据取值区间被20等分）
#normed=1表示将个数（y轴值）归一化
plt.title('Histogram')
plt.show()
```

![pyplot生成的直方图](https://img-blog.csdnimg.cn/20200410192754170.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70#pic_center)

## 散点图

### 例1

```python
#散点图
import matplotlib.pyplot as plt

#plt.scatter(2,4,s=200) #绘制单个点
x_values=list(range(1,11))
y_values=[x**2 for x in x_values]
plt.scatter(x_values,y_values,s=100)
plt.title("Square Numbers",fontsize=24)
plt.xlabel("Value",fontsize=14)
plt.ylabel("Square of Value",fontsize=14)
plt.tick_params(axis='both',which='major',labelsize=14)
plt.show()
```

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200410193107308.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70#pic_center)

### 例2

```python
import matplotlib.pyplot as plt

x_values=list(range(1,1001))
y_values=[x**2 for x in x_values]

#plt.scatter(x_values,y_values,s=10)
plt.scatter(x_values,y_values,c=y_values,cmap=plt.cm.Blues,edgecolors='none',s=10)
plt.axis([0,1100,0,1100000])
plt.show()
```

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200410193214808.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70#pic_center)

### 例3

```python
import matplotlib.pyplot as plt

x=list(range(0,5001))
y=[value**3 for value in x]

plt.scatter(x,y,c=y,cmap=plt.cm.Blues,edgecolors='none',s=2)
plt.title("sj ci fh",fontsize=20)
plt.xlabel("x")
plt.ylabel("x^3")
plt.axis([0,5000,0,5000*5000*5000])
plt.show()
```

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200410193307473.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70#pic_center)

## 盒图

```python
import matplotlib.pyplot as plt

x=list(range(0,5001))

plt.boxplot(x,labels="x")
plt.title("盒图",fontproperties="SimHei")
```

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200410194133942.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70#pic_center)