---
title: PAT中测试数据的输入技巧
date: 2020-04-29 11:39:25
tags: PAT
---

# PAT中测试数据的输入技巧

把测试数据给正确的输入程序中，是做题的开始。有时候在输入测试数据就费了很长时间，所以在此总结一些麻烦的地方及输入技巧。

**1.空格的麻烦**

在此说明几个知识点

- 用scanf输入int、long、long long、float、double忽略空格、回车

```cpp
#include<cstdio>

int main()
{
	int a;
	scanf("%d",&a);
	printf("a = %d",a);
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
输入：
      2
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```cpp
输出：
2
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

- 用scanf输入char[]、string，遇到空格和回车便结束，要想输入带空格的字符串可以如下

```cpp
#include<iostream>
#include<string>
using namespace std;

int main()
{
	string a;
	getline(cin,a);
	cout<<a;
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
输入：
wo ai ni ?
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
输出：
wo ai ni ?
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```cpp
#include<cstdio>
#include<cstring>

int main()
{
	char a[100];
	fgets(a,100,stdin);//如果输入字符长度不够100（包括回车），后面的位置系统自动补'\0'
	int len=strlen(a);//遇到回车结束，但该方法会吸收回车 
	a[len-1]='\0';//把处于末端的回车字符替换成'\0'形成字符串 
	printf("%s",a);
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
输入：
ai ni wo?
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```cpp
输出：
ai ni wo?
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

**2.多余字符的麻烦**

```cpp
#include<cstdio>

int main()
{
	int a;
	getchar();
	scanf("%d",&a);
	printf("%d",a);
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
输入：
*2
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)



```
输出：
2
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

**3.有规律的干扰字符的麻烦**

根据干扰字符规律，利用scanf来提取数据

```cpp
#include<cstdio>

int main()
{
	int hh,mm,ss;
	scanf("%d:%d:%d",&hh,&mm,&ss);
	printf("%d时%d分%d秒",hh,mm,ss);
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
输入：
2:10:33
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
输出：
2时10分33秒
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

**4.没有明确要输入多少组测试数据的麻烦**

有的题目没有明确会有多少组测试数据，这样就不能简单的指定循环次数来输入测试数据，这时需要如下的方法

```cpp
#include<cstdio>

int main()
{
	int a[10];
	int count=0;
	while(scanf("%d",&a[count])!=EOF)
	{
		count++;
	}
	printf("读入了%d个数字",count);
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
输入：
1 2 3 4 5
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
输出：
读入了5个数字
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

自己输入测试数据的时候，要在测试数据后面加上回车+ctrl z+回车，才能达到EOF的效果。

{% note info %}

建议使用以下这种方式

{% endnote %}

```python
#include<iostream>
using namespace std;

int main()
{
    int a;
    while(cin>>a)#读入所有int
    {
        #处理
    }
    return 0;
}

```

