---
title: PAT题目中常用的库函数
date: 2020-04-29 11:40:31
tags: PAT
---

# PAT题目中常用的库函数

# **ctype.h**

- **isdigit(int ch)** 是**数字**返回非零，否则返回0
- **isalpha(int ch)** 是**字母**返回非零，否则返回0
- **isalnum(int ch)** 是**数字或字母**返回非零，否则返回0 
- **islower(int ch)** 是**小写字母**返回非零，否则返回0
- **isupper(int ch)** 是**大写字母**返回非零，否则返回0
- **int tolower(int ch)** 返回大写字母的**小写形式**
- **int toupper(int ch)** 返回小写字母的**大写形式**

# **cstring**

- **int strcmp(const char\*s1,const char \*s2)** 比较字符串s1,s2，s1=s2时返回0，s1<s2时返回负值，s1>s2时返回正值
- **void memset(void \*s,int ch,size_t n)** 用ch填充s中的n个字节，用于对数组的快速初始化，通常初始化为0或1
- **char \*strcpy(char \*dest,const char \*src)** 将含有结束符的字符串src复制到dest中（dest要有足够的空间），并返回指向dest的指针
- **unsigned int strlen(char \*s)** 返回截止到结束符的字符串s的长度

# **algorithm**

- **max(a,b)** 返回a，b中较大的那一个
- **min(a,b)** 返回a，b中较小的那一个
- **abs(a)** 返回a的绝对值，a必须为整型，浮点型需要用math.h下的fabs
- **swap(a,b)** 交换a，b的值
- **reverse(a,a+n)** 将a中元素倒序，一般用于数组，template的方法暂时还不会用-_-，a为数组首地址，n为数组长度
- **fill(a,a+n,value)** 将[a,a+n)的元素填充值value，可用template，memset一般填1或0，这个可以填充其他值
- **sort(a,a+n,f)** 将[a,a+n)中的元素按照比较函数f进行排序，可用template
- **lower_bound(a,a+n,key)** 返回[a,a+n)中第一个大于等于key的位置，如果所有元素小于key，返回末地址，末地址是正好越界的！查找方法为二分查找！
- **upper_bound(a,a+n,key)** 返回[a,a+n)中大于key的第一个位置，没找到返回末地址，末地址正好越界！查找方法为二分查找！
- **max_element(a,a+n)** 查找[a,a+n)最大值所在地址
- **min_element(a,a+n)** 查找[a,a+n)最小值所在地址

# **cmath**

- **ceil(x)** 对x向上取整
- **floor(x)** 对x向下取整
- **fabs(x)** 返回x的绝对值
- **sqrt(x)** 返回x的开方
- **pow(x,y)** 返回x的y次方
- **round(x)** 将x四舍五入**取整** 
- **sin(x),cos(x),tan(x)** x为**弧度制**的角度
- **asin(x),acos(x),atan(x)**
- **log(x)** 返回以**自然指数为底**的x的对数