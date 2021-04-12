---
title: PAT常用STL-map
date: 2020-04-29 12:16:57
categories:
- [编程]
tags: PAT
---

PAT常用STL-map

map作为存储**<键-值>**映射关系的容器，可以很方便地根据键提取值，或者根据值来查找键。

------

# map的常用操作

```cpp
#include<cstdio>
#include<map>//map类型头文件
#include<vector>//vector容器 
using namespace std;//使用STL容器必须添加此句 
 
int main()
{
	/*
	声明形式：map<value,key> mp 
	key/value既可以是普通数据类型，也可以是STL容器 
	*/
	map<int,int> a;
	map<int,vector<int> > b;//>>之间加空格防止被识别为移位符
	/******************************************/
	
	/*
	添加键值对：mp[key]=value 
	*/
	a[1]=-1;
	
	/*
	mp[key] 
	功能：根据键，访问对应值
	*/
	printf("%d的对应值为%d\n",1,a[1]);
	
	/*
	mp.find(value)
	功能：根据值，访问键
	参数：value为值 
	返回值：对应位置的迭代器 
	备注：要访问对应内容需要在前面加上* 
	*/
	printf("%d的对应键为%d\n",-1,*a.find(-1));
	if(a.find(-2)==a.end())//find返回末地址的下一位则没找到 
		printf("没找到\n");
	
	/*
	可根据迭代器访问键和值 
	*/
	for(map<int,int>::iterator it=a.begin();it!=a.end();it++)
		printf("<%d,%d>",it->first,it->second);
	
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)



```
输出：
1的对应值为-1
-1的对应键为1
没找到
<1,-1>
--------------------------------
Process exited after 0.2512 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

------

根据目前做的为数不多的题目，map主要当做哈希表来用，但是区别于普通的数组构成的哈希表的是：哈希表一般用于<小整数,值>的存储，而map可以用于<大整数/string，值>的存储，因为它自动计算大整数对应的哈希值，多舒服啊！

```cpp
#include<cstdio>
#include<map>//map类型头文件
using namespace std;//使用STL容器必须添加此句 
 
int main()
{
	map<int,int> a;//第一个存键数据，第二个代表该数据出现的次数 
	int key;
	for(int i=0;i<5;i++)//输入五组数据
	{
		scanf("%d",&key);
		if(a.find(key)==a.end())//改数据出现第一次
			a[key]=1;//该数据出现次数记为1
		else//非第一次出现 
			a[key]++;//原来的情况上面+1 
	}
	
	for(map<int,int>::iterator it=a.begin();it!=a.end();it++)
		printf("%d出现了%d次\n",it->first,it->second);
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
输入：
12345678 12345678 666666 555555 666666
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
输出：
555555出现了1次
666666出现了2次
12345678出现了2次

--------------------------------
Process exited after 16.38 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)