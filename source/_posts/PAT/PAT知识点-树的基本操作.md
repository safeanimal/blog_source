---
title: PAT知识点-树的基本操作
date: 2020-04-29 12:23:13
tags: PAT
---



# PAT知识点-树的基本操作

## 树的数据结构

### 二叉树

一般的度为2的树是不考虑左右子树的顺序的，也就是说，左右子树交换对该树没影响。但是！<mark>二叉树是规定左右子树顺序的！</mark>左右子树交换后就是另一个二叉树了！左右子树的交换方法下面会讲，就是在后序遍历的时候交换左右子树。

```cpp
struct Node
{
    int data;//数据域
    Node *lchild;//左孩子
    Node *rchild;//右孩子
}
```

一般题目都是给定结点序号，下面的更常用

```cpp
const int MAXN=1000;//假设最大序号为1000
struct Node
{
    int data;
    int lchild;//存放序号，int型
    int rchild;//存放序号,int型
}node[MAXN];//开辟MAXN个结点来存储树
```

### 完全二叉树

完全二叉树指除了<mark>最后一层可以不排满（但必须从左到右排）节点，其他层必须满节点的树</mark>。

性质：如果设根节点的序号为1，那么其左子节点的序号为1*2=2，其由节点的序号为1\*2+1=3。只有<mark>规定了根节点序号为1</mark>，那么对于<mark>任意一个序号为n的节点</mark>，其<mark>左孩子序号为2n</mark>，其<mark>右孩子序号为2n+1</mark>。

由于指定序号，必须用静态方式（数组）存储。

```cpp
const int MAXN=1000;//假设最大序号为1000
struct Node
{
    int data;
    int lchild;//存放序号，int型
    int rchild;//存放序号,int型
}node[MAXN];//开辟MAXN个结点来存储树
```

### 普通的树

```cpp
const int MAXN=1000;
struct Node
{
    int data;
    vector<int> child;//该节点的child的序号全部放入vector数组中
}node[MAXN];
//其实如果这个树的结点不存放其他信息的话，直接写成vector<int> child[MAXN]就行了
```



## 树的建立

一般除了二叉查找树是给一系列数值信息，建立树一般都是给定当前节点序号和该节点的孩子的序号。下面就根据这种常见的建立方式编码。

### 二叉树的建立

```cpp
int lchild,rchild;
for(int i=0;i<n;i++)//给定n个节点和其左右孩子的信息，假设编号为0到n-1
{
    scanf("%d%d",&lchild,&rchild);
    node[i].lchild=lchild;
    node[i].rchild=rchild;
}
```

### 树的建立

```cpp
int child;
for(int i=0;i<n;i++)//给定n个节点和其左右孩子的信息，假设编号为0到n-1
{
    int num;//该节点的孩子数目
    scanf("%d",&num);
    for(int j=0;j<num;j++)
    {
        scanf("%d",&child);
        node[i].push_back(child);//vector存储孩子编号
    }
}
```



## 树的遍历

这里用静态树的遍历说明，思想都是一样的。

这里注意，<mark>无论是什么遍历，都是左子树先遍历</mark>。

### 前序遍历/深度优先遍历DFS

```cpp
/*二叉树*/
void preOrder(int root)
{
    if(root==-1)//没有子节点了，直接返回
        return;
    printf("%d",root);//先遍历根节点，这里的遍历操作就是输出它
    preOrder(node[root].lchild);
    preOrder(node[root].rchild);
}

/*一般的树，其实这个就是一般的树的DFS！！！*/
void preOrder(int root)
{
    printf("%d",root);
    int len=node[root].size();//到叶子结点时，len为0，就不会向下遍历了。这里树的表示为vector<int> node[MAXN]
    for(int i=0;i<len;i++)
    {
        preOrder(node[root].child[i]);
    }
}
```

### 中序遍历

```cpp
void inOrder(int root)
{
    if(root==-1)
        return;
    inOrder(node[root].lchild);
    printf("%d",root);
   	inOrder(node[root].rchild);
}
```

### 后序遍历

```cpp
void postOrder(int root)
{
    if(root==-1)
        return;
    inOrder(node[root].lchild);
   	inOrder(node[root].rchild);
    printf("%d",root);
}
```

### 层序遍历/广度优先遍历BFS

```cpp
/*二叉树*/
void levelOrder(int root)
{
    queue<int> q;
    q.push(root);
    while(!q.empty())
    {
        int front=q.front();
        printf("%d",front);//遍历，这里的遍历是输出信息
        q.pop();
        if(node[front].lchild!=-1)
        {
            q.push(node[front].lchild);
        }
        if(node[front].rchild!=-1)
        {
            q.push(node[front].rchild);
        }
    }
}

/*普通的树*/
void levelOrder(int root)
{
    queue<int> q;
    q.push(root);
    while(!q.empty())
    {
        int front=q.front();
        printf("%d",front);
        q.pop();
        int len=node[front].size();//这里树的表示是vector<int> node[MAXN]
        int child;//表示孩子结点的序号
        for(int i=0;i<len;i++)
        {
            child=node[front][i];
            if(node[child]!=-1)
            {
                q.push(child);
            }
        }
    }
}
```



## 前序/后续遍历+中序遍历还原二叉树

### 前序遍历+中序遍历

```cpp
/*
pre[]:前序遍历序列，存放节点序号
lpre:前序遍历左界
rpre:前序遍历右界
in[]:中序遍历序列，存放节点序号
lin:中序遍历左界
rin:中序遍历右界
*/
void build(int pre[],int lpre,int rpre,int in[],int lin,int rin)
{
    if(lpre>rpre)//序列中没元素了，也就是没子树了，直接返回-1
        return -1;
    
    int root=pre[lpre];//根节点的序号
    int k;//表示中序序列中根节点的位置
    for(k=lin;k<=rin;k++)//遍历中序序列，找到与前序序列最左端相等的元素，该元素即为根节点。注意<=号
    {
        if(root==lin[k])//找到根节点
            return;
    }
 
    int numLeft=k-lin;//左子树节点的个数
    node[root].lchild=build(pre,lpre+1,lpre+1+numLeft-1,in,lin,k-1);//左子树部分递归，左界x，y个元素，那么右界就为x+y-1
    node[root].rchild=build(pre,lpre+1+numLeft-1+1,rpre,in,k+1,rin);//右子树部分递归
    return root;
}
```

### 后序遍历+中序遍历

```cpp
/*
post[]:后序遍历序列，存放节点序号
lpost:后序遍历左界
rpost:后序遍历右界
in[]:中序遍历序列，存放节点序号
lin:中序遍历左界
rin:中序遍历右界
*/
void build(int post[],int lpost,int rpost,int in[],int lin,int rin)
{
    if(lpost>rpost)
    	return -1;
    int root=post[rpost];
    int k;
    for(k=0;k<=rin;k++)
    {
        if(root==in[k])
            return;
    }
    int numLeft=k-lin;
    node[root].lchild=build(post,lpost,rpost-1-numLeft+1-1,in,lin,k-1);
    node[root].rchild=build(post,rpost-1-numLeft+1,rpost-1,in,k+1,rin);
    return root;
}
```