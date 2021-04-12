---
title: PAT中常用基本操作
date: 2020-04-29 11:41:32
tags: PAT
---

# PAT中常用基本操作

在刷了100道题后，发现有些操作真的是反反复复被用到，在此总结一下，把这些基操练习足够熟，相信对编程基本能力提升有帮助。

# 数组的操作

- ## 寻找最大/最小值其下标

```cpp
#include<cstdio>

int main()
{
	int a[5]={4,88,-12,1999,0};
	//最大值的初始要尽量小，最小值的初始要尽量大 
	int max=-(1<<31),maxi;//max为最大值，maxi为最大值对应的下标 
	int min=(1<<31)-1,mini;//min为最小值，mini为最小值对应的下标 
	
	for(int i=0;i<5;i++)
	{
		if(a[i]>max)//如果有多个最大值，>筛出第一个，>=筛出最后一个 
		{
			max=a[i];
			maxi=i;
		}
		if(a[i]<min)
		{
			min=a[i];
			min=i;
		}
	}
	printf("数组中的最大值及其下标：%d %d\n",max,maxi);
	printf("数组中的最小值及其下标：%d %d\n",min,mini);
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
输出：
数组中的最大值及其下标：1999 3
数组中的最小值及其下标：4 0

--------------------------------
Process exited after 1.063 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)



- ## 统计最大/最小值个数

可以按照上面步骤先求得最大最小值，再和每一个元素比较，得到最大最小值个数，也可以使用algorithm里面的函数来帮助更快地统计，如下：

```cpp
#include<cstdio>
#include<algorithm>
using namespace std;

int main()
{
	int a[8]={4,88,-12,1999,0,1999,-12,-12};
	int max=*max_element(a,a+8);//求得[a,a+8)范围内的最大值 
	int min=*min_element(a,a+8);
	
	int maxc=0,minc=0;
	for(int i=0;i<8;i++)
	{
		if(a[i]==max)
			maxc++;
		if(a[i]==min)
			minc++;
	}
	printf("数组中的最大值及其个数为：%d %d\n",max,maxc);
	printf("数组中的最小值及其个数为：%d %d\n",min,minc);
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
数组中的最大值及其个数为：1999 2
数组中的最小值及其个数为：-12 3

--------------------------------
Process exited after 3.533 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)



- ## 按照特定条件排序

```cpp
#include<cstdio>
#include<algorithm>
using namespace std;

bool cmp(int a,int b)//比较函数 
{
	return a>b;//大的排在前面 
}

void print(int a[],int n)
{
	for(int i=0;i<n;i++)
		printf("%d ",a[i]);
	printf("\n");
}

int main()
{
	int a[8]={3,1,2,4,5,8,6,7};
	sort(a,a+8);//升序
	print(a,8);
	sort(a,a+8,cmp);//降序，cmp为比较函数 
	print(a,8);
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
输出：
1 2 3 4 5 6 7 8
8 7 6 5 4 3 2 1

--------------------------------
Process exited after 3.509 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)



```cpp
#include<cstdio>
#include<cstring>
#include<algorithm>
using namespace std;
const int N=10;

struct Student
{
	int grade;
	char name[10];
}stu[N];

bool cmp(Student s1,Student s2)//比较函数 
{
	//以下操作为，先按成绩从大到小排序，成绩相等，再按照
	//名字的字典序排序 
	if(s1.grade!=s2.grade) 
		return s1.grade>s2.grade;
	else
		return strcmp(s1.name,s2.name)<0;
}


int main()
{
	for(int i=0;i<4;i++)
		scanf("%s%d",stu[i].name,&stu[i].grade);
	
	sort(stu,stu+4,cmp);//按照比较函数cmp指定的排序规则对[stu,stu+4)排序 
	for(int i=0;i<4;i++)
	{
		printf("Name:%s Grade:%d\n",stu[i].name,stu[i].grade);
	}
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
输入：
David 99
Chandler 32
Monica 88
Alice 99
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)



```
输出：
Name:Alice Grade:99
Name:David Grade:99
Name:Monica Grade:88
Name:Chandler Grade:32

--------------------------------
Process exited after 30.51 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

- ## 查找特定元素

一般的查找特定元素是遍历一遍，这个不需要多讲，这里介绍二分查找特定元素的方法（数组已排序）。

- **查找值等于特定元素的位置**

```cpp
#include<cstdio>

int binarySearch(int a[],int left,int right,int key)
{
	int mid;
	while(left<=right)
	{
		mid=(left+right)/2;
		if(a[mid]==key)
			return mid;
		if(a[mid]>key)
			right=mid-1;
		if(a[mid]<key)
			left=mid+1;
	}
	return -1;//没找到 
}

int main()
{
	int a[6]={0,1,2,3,4,5};
	int key=5;
	int pos=binarySearch(a,0,5,key);
	printf("%d的所在下标是：%d",key,pos);
	return 0;
} 
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
输出：
5的所在下标是：5
--------------------------------
Process exited after 5.387 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

-  **查找第一个大于特定元素的值的位置**

```cpp
#include<cstdio>

/*夹出（第一个满足）大于key的元素的位置*/
int upper_bound(int a[],int left,int right,int key)
{
	int mid;
	while(left<right)//left==right的时候夹出来最终位置 
	{
		mid=(left+right)/2;
		if(a[mid]>key)
			right=mid;
		else
			left=mid+1;
	}
	return left;//没找到返回的则是末地址
}

int main()
{
	int a[6]={0,1,3,3,4,5};
	int key1=3;
	int key2=7;
	int pos1=upper_bound(a,0,5,key1);
	int pos2=upper_bound(a,0,5,key2);
	printf("第一个大于%d的元素的所在下标是：%d\n",key1,pos1);
	printf("第一个大于%d的元素的所在下标是：%d",key2,pos2);
	return 0;
} 
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)



```
第一个大于3的元素的所在下标是：4
第一个大于7的元素的所在下标是：5
--------------------------------
Process exited after 3.663 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

- **查找第一个满足大于等于特定元素的值的位置**

```cpp
#include<cstdio>

/*夹出（第一个满足）大于等于key的元素的位置*/
int lower_bound(int a[],int left,int right,int key)
{
	int mid;
	while(left<right)//left==right的时候夹出来最终位置 
	{
		mid=(left+right)/2;
		if(a[mid]>=key)
			right=mid;
		else
			left=mid+1;
	}
	return left;//没找到返回的则是末地址
}

int main()
{
	int a[6]={0,1,3,3,4,5};
	int key1=3;
	int key2=7;
	int pos1=lower_bound(a,0,5,key1);
	int pos2=lower_bound(a,0,5,key2);
	printf("第一个大于等于%d的元素的所在下标是：%d\n",key1,pos1);
	printf("第一个大于等于%d的元素的所在下标是：%d",key2,pos2);
	return 0;
} 
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
第一个大于等于3的元素的所在下标是：2
第一个大于等于7的元素的所在下标是：5
--------------------------------
Process exited after 3.442 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)



- ## 初始化为特定值

- **使用memset**

```cpp
#include<cstdio>
#include<cstring>

void print(int a[],int n)
{
	for(int i=0;i<5;i++)
		printf("%d ",a[i]);
	printf("\n");
}

int main()
{
	/*这种初始化是根据字节赋值，效率比较高*/
	int a[5];
	memset(a,0,sizeof(a));	
	print(a,5);

	memset(a,-1,sizeof(a));
	print(a,5);
	
	memset(a,1,sizeof(a));
	print(a,5);
	return 0;
} 
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
输出：
0 0 0 0 0
-1 -1 -1 -1 -1
16843009 16843009 16843009 16843009 16843009

--------------------------------
Process exited after 3.469 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

-  **使用fill**

```cpp
#include<cstdio>
#include<algorithm>
using namespace std;//用algorithm要加上这个 

void print(int a[],int n)
{
	for(int i=0;i<5;i++)
		printf("%d ",a[i]);
	printf("\n");
}

int main()
{
	/*这种初始化是根据字节赋值，效率比较高*/
	int a[5];
	fill(a,a+5,0);	
	print(a,5);

	fill(a,a+5,-1);
	print(a,5);

	fill(a,a+5,1);
	print(a,5);
	return 0;
} 
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
输出：
0 0 0 0 0
-1 -1 -1 -1 -1
1 1 1 1 1

--------------------------------
Process exited after 3.404 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)



# 字符串的操作

- ## 字符串逆序

- **自定义函数**

```cpp
#include<cstdio>
#include<cstring>

void reverse(char s[])
{
	int len=strlen(s);
	for(int i=0;i<len/2;i++)
	{
		char temp=s[i];
		s[i]=s[len-i-1];
		s[len-i-1]=temp;
	}
}

int main()
{
	char s[10]="123456";
	reverse(s);
	printf("%s",s);	
	return 0;
} 
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
654321
--------------------------------
Process exited after 3.431 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

-  **使用reverse函数**

```cpp
#include<cstdio>
#include<algorithm>
using namespace std;

int main()
{
	char s[10]="123456";
	reverse(s,s+6);//[s0,s6)逆转 
	printf("%s",s);	
	return 0;
} 
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
654321
--------------------------------
Process exited after 3.383 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)



- ## 字符串转数字

- **自定义函数**（通常用作字符串转整型，因为自定义起来简单）

```cpp
#include<cstdio>
#include<cstring>
using namespace std;

int main()
{
	char s[10]="123456";
	int len=strlen(s);
	int value=0;
	for(int i=0;i<len;i++)
		value=value*10+s[i]-'0';
	printf("%d",value);
	return 0;
} 
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

-  使用强大的**库函数**

```cpp
#include<cstdio>
#include<stdlib.h>
using namespace std;

int main()
{
	char s1[20]="123456";
	int value1=atoi(s1);
	printf("%d\n",value1);
	
	char s2[20]="12.132452";
	double value2=atof(s2);
	printf("%f\n",value2);
	
	char s3[20]="-1.24531";
	double value3=atof(s3);
	printf("%f\n",value3);
	
	char s4[20]="+1.2e-3";
	double value4=atof(s4);
	printf("%f\n",value4);
	
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)



```
输出：
123456
12.132452
-1.245310
0.001200

--------------------------------
Process exited after 3.596 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

# 数学相关操作

- ## 最大公约数求法（欧几里得算法）

```cpp
#include<cstdio>

int gcd(int a,int b)
{
	return !b?a:gcd(b,a%b);
}

int main()
{	
	int a=32,b=4;
	printf("%d\n",gcd(a,b));
	
	a=13;
	b=5;
	printf("%d\n",gcd(a,b));
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
输出：
4
1

--------------------------------
Process exited after 3.61 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)



- ## 判断质数

```cpp
#include<cstdio>
#include<cmath>

bool isPrime(int n)
{
	if(n<=1)
		return false;
	for(int i=2;i<sqrt(n);i++)
	{
		if(n%i==0)
			return false;
	}
	return true;
}

int main()
{	
	int a=1,b=2,c=7;
	printf("%d是质数？%d\n",a,isPrime(a));
	printf("%d是质数？%d\n",b,isPrime(b));
	printf("%d是质数？%d\n",c,isPrime(c));
	
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
1是质数？0
2是质数？1
7是质数？1

--------------------------------
Process exited after 3.445 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)



- ## 筛选质数

```cpp
#include<cstdio>
const int MAX=1000;//选[0,1000]中的质数 

bool prime[MAX+1];

int main()
{	
	for(int i=2;i<=MAX;i++)
	{
		if(prime[i]==false)
			printf("%d ",i);
		for(int j=i+i;j<=MAX;j+=i)
			prime[j]=true;
	}
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
输出：
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103 107 109 113 127 131 137 139 149 151 157 163 167 173 179 181 191 193 197 199 211 223 227 229 233 239 241 251 257 263 269 271 277 281 283 293 307 311 313 317 331 337 347 349 353 359 367 373 379 383 389 397 401 409 419 421 431 433 439 443 449 457 461 463 467 479 487 491 499 503 509 521 523 541 547 557 563 569 571 577 587 593 599 601 607 613 617 619 631 641 643 647 653 659 661 673 677 683 691 701 709 719 727 733 739 743 751 757 761 769 773 787 797 809 811 821 823 827 829 839 853 857 859 863 877 881 883 887 907 911 919 929 937 941 947 953 967 971 977 983 991 997
--------------------------------
Process exited after 3.438 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)



- ## 数字转字符串

- **自己写过程**

```cpp
#include<cstdio>

int main()
{
	int a=123456;
	char ans[10];
	int count=0;
	do
	{
		ans[count++]=a%10+'0';//注意要加上'0'转成对应字符 
		a/=10;
	}while(a!=0);
	for(int i=0;i<count;i++)//这样输出是倒序的
		printf("%c",ans[i]);
		 
	return 0;
} 
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
输出：
654321
--------------------------------
Process exited after 3.398 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

-  利用强大的**库函数**

```cpp
#include<cstdio>

int main()
{
	char ans[10];
	int a=12345;
	sprintf(ans,"%d",a);
	printf("%s\n",ans);
	
	double b=-1.345;
	sprintf(ans,"%.1f",b);
	printf("%s\n",ans);
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
12345
-1.3

--------------------------------
Process exited after 3.795 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)



- ## 进制转换

```cpp
#include<cstdio>

int main()
{
	int a=11,radix=2;//a转换成radix进制 
	char ans[10];
	int count=0;
	do
	{
		ans[count++]=a%radix+'0';
		a/=radix;
	}while(a!=0);
	for(int i=0;i<count;i++)//这样输出是倒序 
		printf("%c",ans[i]);
	return 0;
} 
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
输出：
1101
--------------------------------
Process exited after 0.4383 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)





# 基础算法

- ## 插入排序

```cpp
#include<cstdio>

void insertionSort(int a[],int n)
{
	for(int i=1;i<n;i++)
	{
		int j=i;
		int temp=a[i];
		while(j>0&&temp<a[j-1])
		{
			a[j]=a[j-1];
			j--;
		}
		a[j]=temp;
	}
}
 
int main()
{
	int a[5]={4,1,3,8,2};
	insertionSort(a,5);
	for(int i=0;i<5;i++)
		printf("%d ",a[i]);
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
1 2 3 4 8
--------------------------------
Process exited after 0.6706 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)



- ## 归并排序

- **递归写法**

```cpp
#include<cstdio>

void merge(int a[],int left1,int right1,int left2,int right2)
{
	int temp[100];//最大排序量为100
	int l1=left1,l2=left2;
	int p=0;
	while(l1<=right1&&l2<=right2)
	{
		if(a[l1]<=a[l2])
			temp[p++]=a[l1++];
		else
			temp[p++]=a[l2++];
	}
	while(l1<=right1)
		temp[p++]=a[l1++];
	while(l2<=right2)
		temp[p++]=a[l2++];
	for(int i=0;i<p;i++)
		a[left1+i]=temp[i];
}

void mergeSort(int a[],int left,int right)
{
	if(left<right)
	{
		int mid=(left+right)/2;
		mergeSort(a,left,mid);
		mergeSort(a,mid+1,right);
		merge(a,left,mid,mid+1,right);
	}
}

int main()
{
	int a[5]={4,1,3,8,2};
	mergeSort(a,0,5);
	for(int i=0;i<5;i++)
		printf("%d ",a[i]);
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
1 2 3 4 8
--------------------------------
Process exited after 0.6761 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

-  **非递归写法**

```cpp
#include<cstdio>
#include<algorithm>
using namespace std;

void merge(int a[],int left1,int right1,int left2,int right2)
{
	int temp[100];//最大排序量为100
	int l1=left1,l2=left2;
	int p=0;
	while(l1<=right1&&l2<=right2)
	{
		if(a[l1]<=a[l2])
			temp[p++]=a[l1++];
		else
			temp[p++]=a[l2++];
	}
	while(l1<=right1)
		temp[p++]=a[l1++];
	while(l2<=right2)
		temp[p++]=a[l2++];
	for(int i=0;i<p;i++)
		a[left1+i]=temp[i];
}

void mergeSort(int a[],int n)
{
	for(int step=2;step/2<=n;step*=2)//每step个元素一组 
	{
		for(int i=0;i<n;i+=step)//对每一组 
		{
			int mid=i+step/2-1;//中间位置的下标 
			if(mid+1<n)//右区间存在元素 
				merge(a,i,mid,mid+1,min(i+step-1,n-1));//最大下标为n-1 
		}
	}
}

int main()
{
	int a[5]={4,1,3,8,2};
	mergeSort(a,5);
	for(int i=0;i<5;i++)
		printf("%d ",a[i]);
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

- ## 快速排序

```cpp
#include<cstdio>
#include<cstdlib>
#include<ctime>
#include<algorithm>
using namespace std;

/*分割并使数组满足枢纽元素左边的都小于它，枢纽元素右边的都大于它*/
int partition(int a[],int left,int right)
{
	srand(unsigned(time(NULL)));//生成随机数的种子，需要头文件ctime和cstdlib
	int n=rand()%(right-left+1)+left;//生成[left,right-1]间的随机数
	swap(a[left],a[n]);//交换枢纽元素，保证枢纽元素是随机的，一定程度上防止最坏情况的出现
	
	int temp=a[left];
	while(left<right)
	{
		while(left<right&&a[right]>=temp) right--;
		a[left]=a[right];
		while(left<right&&a[left]<=temp) left++;
		a[right]=a[left];
	}
	a[left]=temp;
	return left;
}

int quickSort(int a[],int left,int right)
{
	if(left<right)
	{
		int pos=partition(a,left,right);
		quickSort(a,left,pos-1);//左区间快速排序
		quickSort(a,pos+1,right);//右区间快速排序
	}
}

int main()
{
	int a[4]={3,1,4,2};
	quickSort(a,0,3);
	for(int i=0;i<4;i++)
		printf("%d",a[i]);
	return 0;
} 
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
输出：
1234
--------------------------------
Process exited after 0.3472 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)



暂时想到这么多，在实现的过程中难免会有些错误，如若发现，恳请指出。

\(^o^)/~