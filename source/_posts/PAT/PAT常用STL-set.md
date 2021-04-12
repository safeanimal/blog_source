---
title: PAT常用STL-set
date: 2020-04-29 12:20:54
tags: PAT
---

# PAT常用STL-set

------

set容器内部不包含重复元素并且自动排序。

------

# set常用操作

```cpp
#include<cstdio>
#include<set>//vector类型头文件
using namespace std;//使用STL容器必须添加此句 

int main()
{
	set<int> a;
	
	a.insert(3);
	a.insert(3);
	a.insert(1);
	a.insert(5);
	a.insert(2);
	a.insert(2);
	a.insert(9);
	a.insert(-1);
	
	for(set<int>::iterator it=a.begin();it!=a.end();it++)
		printf("%d ",*it);
		
	if(a.find(8)==a.end())//没找到
		printf("\n没找到！\n");
	if(a.find(2)!=a.end())
		printf("我找到了！\n");
	
	printf("大小：%d",a.size());
	
	a.erase(1);//根据值删除
	a.erase(a.begin());
	set<int>::iterator it=a.find(5);
	a.erase(a.begin(),it);	
	
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
-1 1 2 3 5 9
没找到！
我找到了！
大小：6
--------------------------------
Process exited after 3.353 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)