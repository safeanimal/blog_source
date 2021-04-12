---
title: PAT中常用STL-string
date: 2020-07-24 10:35:17
tags: PAT
---

## 常用操作

### 输入

```cpp
#include<iostream>
#include<string>
using namespace std;
 
int main()
{
    string a;
    cin>>a;//不读空字符
    cout<<"a="<<a<<endl;
    
    string b;
    getline(cin,b);//读空字符
    cout<<"b="<<b<<endl;
    return 0;
}
```

```cpp
ab cde f
a=ab
b= cde f

--------------------------------
Process exited after 12.92 seconds with return value 0
请按任意键继续. . .
```

<!--more-->

### 常用函数

#### length()

​	获取字符的长度。

#### substring()

+ **substring(pos,length)** 从pos开始返回长度为length的子串

#### insert()

​	插入字符串。

+ **insert(pos,string)** 在pos位置插入string
+ **insert(itst1,itst2,ited2)** 迭代器itst1指向的位置插入[itst2,ited2)代表的字符串

```cpp
#include<iostream>
#include<string>
using namespace std;

int main()
{
    string a,b;
    cin>>a>>b;
    a.insert(1,"插入");
    cout<<a<<endl;
//    a.insert(a.begin()+3,"又插入"); 没有这种写法！ 
    a.insert(a.begin(),b.begin(),b.begin()+2);
    cout<<a<<endl;
    return 0;
}
```

```cpp
12345 6789
1插入2345
671插入2345

--------------------------------
Process exited after 2.419 seconds with return value 0
请按任意键继续. . .
```



#### erase()

删除字符串。

+ **erase(it)** 删去迭代器it指向的字符
+ **erase(pos,length)** 从pos下标，删去length个字符
+ **erase(itst,ited)** 删去迭代器[itst,ited)代表的内容

```cpp
#include<iostream>
#include<string>
using namespace std;

int main()
{
    string a;
    cin>>a;
    a.erase(a.begin());//删去a.begin()指向的字符，也就是首字符 
    cout<<"a="<<a<<endl;
    
    string b;
    cin>>b;
    b.erase(1,2);//从位置1删去2个字符 
    cout<<"b="<<b<<endl;
    
    string c;
    cin>>c;
    c.erase(c.begin()+1,c.begin()+3);//删去[1,3)内字符 
    cout<<"c="<<c<<endl;
    
    return 0;
}
```

```cpp
0123
a=123
0123
b=03
0123
c=03

--------------------------------
Process exited after 7.606 seconds with return value 0
请按任意键继续. . .
```

#### clear()

清空字符串（变为空串）。

#### find()

查找字符串。

+ **find(string)** 返回string头一次出现的位置，若没找到返回**string::npos**​(-1/4294967295)
+ **find(string,pos)** 和上面一样，只不过是从pos位置开始找

#### replace()

替换字符串。

+ **replace(pos,len,str)** 从pos开始长度为len的子串替换为str
+ **replace(itst,ited,str)** [itst,ited)代表的子串替换为str

### 比较

string可直接用比较符来比较两字符的字典序。