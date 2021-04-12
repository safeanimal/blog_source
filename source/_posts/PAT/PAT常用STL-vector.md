---
title: PAT常用STL-vector
date: 2020-04-29 12:19:15
tags: PAT

---



# PAT常用STL-vector

vector一般用作变成数组，可以方便地实现PAT中结果最后一个地方不许有空格的要求。

------

# vector常用操作

```cpp
#include<cstdio>
#include<vector>//vector类型头文件
using namespace std;//使用STL容器必须添加此句 
 
int main()
{
	vector<int> a;
	vector<vector<int> > b;
	
	a.push_back(2);//从后面添加元素
	
	printf("%d\n",a[0]);//通过下标访问元素 
	
	printf("%d\n",a.size());//获取元素个数
	
	a.pop_back();//从后面删除元素
	 
	a.insert(a.begin(),5);//在迭代器指向的位置上添加元素5
	a.insert(a.begin(),2);
	a.insert(a.begin(),4);
	
	a.erase(a.begin());//删除a.begin()所指的元素 
	a.erase(a.begin(),a.end());//删除[a.begin(),a.end())间的元素
	
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
输出：
2
1

--------------------------------
Process exited after 0.2462 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)