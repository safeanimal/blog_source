---
title: PAT中常用数据类型及输入输出(C/C++)
date: 2020-04-29 11:35:28
tags: PAT
---

# PAT中常用数据类型及输入输出(C/C++)



## 常用数据类型

bool

int

double

long

long long

## 数据类型范围

![\mathbf{int\in(-2^{31}\to2^{31}-1)}](https://private.codecogs.com/gif.latex?%5Cmathbf%7Bint%5Cin%28-2%5E%7B31%7D%5Cto2%5E%7B31%7D-1%29%7D)最大大概为20亿

![\boldsymbol{long\ long\in(-2^{63}\to2^{63}-1)}](https://private.codecogs.com/gif.latex?%5Cboldsymbol%7Blong%5C%20long%5Cin%28-2%5E%7B63%7D%5Cto2%5E%7B63%7D-1%29%7D)最大大概为![{\color{Red} 10^{18}}](https://private.codecogs.com/gif.latex?%7B%5Ccolor%7BRed%7D%2010%5E%7B18%7D%7D)

```cpp
#include<cstdio>

int main()
{
	int intmax=(1<<31)-1;
	int intmin=-(1>>31);
	
	printf("max of int = %d\n",intmax);
	printf("min of int = %d\n",intmin);
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
结果：
max of int = 2147483647
min of int = 0
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

## 数据的输入

double %lf

float %f

long %ld

long long %lld

## 数据的输出

double/float %f

long %ld

long long %lld

## 数据输出的格式控制

```cpp
#include<cstdio>

int main()
{
	int a=1;
	long b=1;
	printf("%05d  %03ld\n",a,b);//%0x补x个前导0 
	double c=1.234;
	printf("%.2f",c);//%.xf保留x个小数位 
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
结果：
00001  001
1.23
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

注意点：

数据的**输入输出一定要匹配**，不然会出错