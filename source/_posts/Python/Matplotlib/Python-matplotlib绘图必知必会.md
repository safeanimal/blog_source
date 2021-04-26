---
title: Python matplotlib绘图必知必会
date: 2020-04-26 21:54:33
categories:
- [编程, Python]
tags: Matplotlib

---

# Python matplotlib绘图必知必会

## 简介

matplotlib是python的一个<mark>数据可视化库</mark>，matplotlib.pyplot是matplotlib的一个快捷绘图命令字库，使用前要加上<mark>`import matplotlib.pyplot as plt`</mark>。

该教程基于MOOC的北京理工大学嵩天教授的Python数据分析与展示课程。

## 绘图

### 例1

```python
import matplotlib.pyplot as plt
plt.plot([3,1,4,5,2])#一个列表作为参数，该列表默认为y轴的值
plt.title("Test")#标题
plt.xlabel("Time")#x轴标签
plt.ylabel("Grade")#y轴标签
plt.savefig('test',dpi=600)#将图像保存为text，默认格式为png;dpi:每英寸包含多少个点
plt.show()#将图像显示出来
```

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200410134444768.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70#pic_center)

### 例2

```python
import matplotlib.pyplot as plt
plt.plot([0,2,4,6,8],[3,1,4,5,2])#两个列表作为参数，第一个列表当做x轴，第二个列表当做y轴
plt.title("Test")
plt.xlabel("Time")
plt.ylabel("Grade")

plt.show()
```

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200410134553609.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70#pic_center)

### 例3-子绘图

```python
import matplotlib.pyplot as plt
plt.subplot(2,1,1)#将区域分为2行，1列，该子绘图位置放在1
plt.plot([0,2,4,6,8],[3,1,4,5,2])
plt.title("Test")
plt.xlabel("Time")
plt.ylabel("Grade")

plt.subplot(2,1,2)#将区域分为2行，1列，该子绘图位置放在2
plt.plot([0,2,4,6,8],[3,1,4,5,2])
plt.xlabel("Time2")
plt.ylabel("Grade2")
plt.show()
```

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200410134617605.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70#pic_center)

### 例4-多条曲线放在一张图中

> `plt.plot(x,y,format_string,**kwargs)`
>
> + format_string：设置<mark>颜色、风格、标记</mark>。
>
> | 颜色字符  |   说明    | 颜色字符 |     说明     |
> | :-------: | :-------: | :------: | :----------: |
> |    'b'    |   蓝色    |   'm'    |    洋红色    |
> |    'g'    |   绿色    |   'y'    |     黄色     |
> |    'r'    |   红色    |   'k'    |     黑色     |
> |    'c'    |  青绿色   |   'w'    |     白色     |
> | '#008000' | RGB某颜色 |  '0.8'   | 灰度值字符串 |
>
> | 风格字符 |  说明  |
> | :------: | :----: |
> |   '-'    |  实线  |
> |   '--'   | 破折线 |
> |   '-.'   | 点划线 |
> |   ':'    |  虚线  |
> |  '' ' '  | 无线条 |
>
> | 标记字符 | 说明           | 标记字符 | 说明     | 标记字符 | 说明     |
> | -------- | -------------- | -------- | -------- | -------- | -------- |
> | '.'      | 点             | '1'      | 下花三角 | 'h'      | 竖六边形 |
> | ','      | 像素（极小点） | '2'      | 上花三角 | 'H'      | 横六边形 |
> | 'o'      | 实心圈         | '3'      | 左花三角 | '+'      | 十字     |
> | 'v'      | 倒三角         | '4'      | 右花三角 | 'x'      | x        |
> | '^'      | 上三角         | 's'      | 实心方形 | 'D'      | 菱形     |
> | '>'      | 右三角         | 'p'      | 实心五角 | 'd'      | 瘦菱形   |
> | '<'      | 左三角         | '*'      | 星形     | '\|'     | 垂直线   |

#### 无标记

```python
import matplotlib.pyplot as plt
import numpy as np
a=np.arrange(10)#创建数组array([0,1,2,3,4,5,6,7,8,9])
plt.plot(a,a*1.5,a,a*2.5,a,a*3.5,a,a*4.5)#依次按照x=a,y=a*1.5;x=a,y=a*2.5...进行绘图
plt.show()
```

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200410134654221.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70#pic_center)

#### 有标记

```python
import matplotlib.pyplot as plt
import numpy as np
a=np.arange(10)
#第一条曲线绿色，实心圈标记，实线
#第二条曲线红色，x标记
#第三条曲线，*标记
#第四条曲线，蓝色，点划线
plt.plot(a,a*1.5,'go-',a,a*2.5,'rx',a,a*3.5,'*',a,a*4.5,'b-.')
plt.show()
```

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200410134719889.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70#pic_center)

## 显示中文

默认情况下，<mark>pyplot不支持显示中文</mark>，下边为显示中文的方法

### 例1 使用matplotlib.rcParams

```python
import matplotlib.pyplot as plt
import matplotlib#①

matplotlib.rcParams['font.family']='SimHei'#②，字体设为黑体
plt.plot([3,1,4,5,2])
plt.ylabel("纵轴",fontsize=20)#字体大小调到20
plt.show()
```

![](https://img-blog.csdnimg.cn/20200410134800247.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70#pic_center)

> rcParams的属性:
>
> |     属性      |               说明               |
> | :-----------: | :------------------------------: |
> | 'font.family' |             字体名称             |
> | 'font.style'  |   字体风格，'normal'/'italic'    |
> |  'font.size'  | 字体大小，整数/'large'/'x-small' |
>
> 

### 例2 增加属性fontproperties

```python
import numpy as np
import matplotlib.pyplot as plt
a=np.arange(0.0,5.0,0.02)

plt.xlabel('时间',fontproperties='SimHei',fontsize=20)
plt.ylabel('振幅',fontproperties='SimHei',fontsize=20)
plt.plot(a,np.cos(2*np.pi*a),'r--')
plt.show()
```

![在这里插入图片描述](https://img-blog.csdnimg.cn/2020041013485468.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70#pic_center)

## 文本显示

>  文本显示是指在图中特定点增加文本注释
>
>  | 函数           | 说明                     |
>  | -------------- | ------------------------ |
>  | plt.xlabel()   | 对x轴增加文本标签        |
>  | plt.ylabel()   | 对y轴增加文本标签        |
>  | plt.title()    | 图形的标题标签           |
>  | plt.text()     | 在图形任意位置增加文本   |
>  | plt.annotate() | 在图形中增加带箭头的注释 |

### 任意位置标注

```python
import numpy as np
import matplotlib.pyplot as plt

a=np.arange(0.0,5.0,0.02)
plt.plot(a,np.cos(2*np.pi*a),'r--')
#文本中可以插入latex格式的数学公式
plt.xlabel('时间',fontproperties='SimHei',fontsize=15,color='green')
plt.ylabel('振幅',fontproperties='SimHei',fontsize=15)
plt.title('正弦波实例 $y=cos(2\pi x)$',fontproperties='SimHei',fontsize=25)
#在点(2,1)处加入文本
plt.text(2,1,r'$\mu=100$',fontsize=15)#  r'这里为字符' 表示忽略转义字符, r'\'显示出来就是\

plt.axis([-1,6,-2,2])#x轴范围[-1,6]，y轴范围[-2,2]
plt.grid(True)#设置网格
plt.show()
```

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200410134916264.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70#pic_center)

### 任意位置箭头标注

```python
import numpy as np
import matplotlib.pyplot as plt

a=np.arange(0.0,5.0,0.02)
plt.plot(a,np.cos(2*np.pi*a),'r--')

plt.xlabel('时间',fontproperties='SimHei',fontsize=15,color='green')
plt.ylabel('振幅',fontproperties='SimHei',fontsize=15)
plt.title('正弦波实例 $y=cos(2\pi x)$',fontproperties='SimHei',fontsize=25)
#箭头标注，xy：指示的位置，xytext：文本的位置
#arrowprops：箭的属性
#facecolor：箭的颜色 width：箭的宽度
plt.annotate(r'$\mu =100$',xy=(2,1),xytext=(3,1.5),arrowprops=dict(facecolor='black',shrink=0.1,width=2))

plt.axis([-1,6,-2,2])
plt.grid(True)
plt.show()
```

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200410134948153.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70#pic_center)

## 子绘图区域进阶

```python
import matplotlib.gridspec as gridspec
gs=gridspec.GridSpec(3,3)#代表3*3的网格区域

ax1=plt.subplot(gs[0,:])#ax1为从第1行开始，占了所有的列格子
ax2=plt.subplot(gs[1,:-1])#ax2为从第2行开始，占了从第1个到倒数第2个的列格子
ax3=plt.subplot(gs[1:,-1])#ax3为从第2行到最后1行，占了第1个到倒数第2个列格子
ax4=plt.subplot(gs[2,0])#ax4占了第3行的第一列的格子
ax5=plt.subplot(gs[2,1])#ax5占了第3行的第二列的格子
```

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200410135008153.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70#pic_center)