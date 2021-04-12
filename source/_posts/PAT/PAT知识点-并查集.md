---
title: PAT知识点-并查集
date: 2020-04-29 12:24:12
tags: PAT
---



# PAT知识点-并查集

## 定义

```cpp
const int MAX=1010;
int father[MAX];//father[i]表示节点i的父亲
```

## 初始化

```cpp
void init(int n)
{
    for(int i=1;i<=n;i++)//这里假设节点序号为1到n
    {
        father[i]=i;//规定根节点的父亲是自己
    }
}
```

## 查

```cpp
int findFather(int x)
{
    int a=x;//x的备份，路径压缩时用
    while(x!=father[x])//只要没到根节点，就一直向上查询
    {
        x=father[x];
    }//结束后x为根节点
    
   	/*路径压缩，对于从最底层节点到根节点的所有节点，将其父节点指向根节点*/
    while(a!=father[a])
    {
        int z=a;//a的备份，下面它有了个新父亲，这个用来找它的老父亲
        father[a]=x;//给a个新父亲
        a=father[z];//向上走，下一个处理的也就是老父亲
    }
}
```

## 并

```cpp
void Union(int a,int b)
{
    int fa=findFather(a);
    int fb=findFather(b);
    if(fa!=fb)//如果不属于同一个集合
        father[fa]=fb;
}
```

## 应用

### 分类

根据题目要求，将一些元素归到特定集合里。比如有元素a,b，在符合给定的条件下，将a,b归到同一集合。用``Union(a,b)``

### 表示图

并查集可以用来表示图，一个例子如下：

```cpp
/*给定若干边的信息构造图*/
int n;//边的个数
scanf("%d",&n);
int a,b;//a,b为边的两端
for(int i=0;i<n;i++)//构造图。当然，这里的例子中构造图没什么限制条件，给定两端，两端所在集合之间合并就行了
{
    scanf("%d%d",&a,&b);
    Union(a,b);
}
```

### 统计图的连通分量个数

<mark>在并查集表示的图当中，根节点的个数就是连通分量的个数</mark>

```cpp
const int MAXN=10010;//最大节点个数
bool isRoot[MAXN];//isRoot[i]代表编号为i的节点是否为根节点
/*
省略并查集部分的代码
*/
int main()
{
    /*
    省略用并查集构造图部分的代码
    */
    for(int i=1;i<=n;i++)//节点编号1-n
    {
        isRoot[findFather[i]]=true;
    }
    int count=0;//连通分量个数
    for(int i=1;i<=n;i++)
    {
        count+=isRoot[i];
    }
    printf("图的连通分量个数为：%d",count);
    return 0;
}
```