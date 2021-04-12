---
title: PAT知识点-二叉查找树
date: 2020-04-29 12:21:57
tags: PAT
---

# PAT知识点-二叉查找树

# 二叉查找树

---

## 定义

~~~cpp
struct Node//代表树的一个结点
{
	int data;//数据域
	Node *lchild;//左孩子
	Node *rchild;//右孩子
};
~~~

## 结点的创建

~~~cpp
Node *newNode(int data)
{
    Node *node=new Node();
    node->data=data;
    node->lchild=NULL;
    node->rchild=NULL;
    
    return node;
}
~~~

## 查找

~~~cpp
void search(Node *root,int data)
{
    if(root==NULL)//递归边界，到达这里表示没有找到
    {
        printf("Not Found!\n");
        return;
    }
    if(data==root->data)//找到了
    {
        printf("Success!\n");
    }
    else if(data>root->data)//data大于根节点值，向右子树查找
    {
        search(root->rchild,data);
    }
    else//data小于根节点值，向左子树查找
    {
        search(root->lchild,data);
    }
}
~~~

## 插入

~~~cpp
void insert(Node *&root,int data)
{
	if(root==NULL)//找到了合适的位置，此时的root就是合适的位置
    {
        root=newNode(data);//这里修改了指针root的值，所以才写成*&root
        return;
    }
    if(data==root->data)//等于根结点的值，表明该值已存在，直接返回
    {
        return;
    }
    else if(data<root->data)//小于根结点的值
    {
        insert(root->lchild,data);
    }
    else//大于根结点的值
    {
        insert(root->rchild,data);
    }
}
~~~

## 二叉树的建立

~~~cpp
Node *create(int a[],int n)
{
	Node *root=NULL;//指针刚开始要初始化为NULL，防止野指针
    for(int i=0;i<n;i++)
    {
        insert(root,a[i]);
    }
    return root;
}
~~~

## 寻找树中的最大值

~~~cpp
Node *findMax(Node *root)
{
    if(root->rchild!=NULL)
    {
        root=root->rchild;
    }
    return root;
}
~~~

## 寻找树中的最小值

~~~cpp
Node *findMin(Node *root)
{
    if(root->lchild!=NULL)
    {
        root=root->lchild;
    }
    return root;
}
~~~

## 根结点的删除

> + 前驱：比根结点值小的最大值，也就是<mark>左子树的最右边的结点</mark>
> + 后继：比根结点值大的最小值，也就是<mark>右子树的最左边的结点</mark>

> 根结点删除后要维持二叉树的特性，需要用<mark>根结点的前驱或者后继覆盖根结点，再前驱/后继删除</mark>

~~~cpp
//删除以root为根节点的树中权值为x的结点
void deleteNode(Node *&root,int x)
{
    if(root==NULL)//不存在权值为x的结点
        return;
    if(root->data==x)//找到了想要删除的结点
    {
        if(root->lchild==NULL&&root->rchild==NULL)//叶子结点直接删除
        {
            root=NULL;//置NULL
        }
        else if(root->lchild!=NULL)//左子树不空
        {
            Node *pre=findMax(root->lchild);//找到root的前驱结点
            root->data=pre->data;//前驱覆盖root
            deleteNode(root->lchild,pre->data);//覆盖完成后将前驱删除
        }
        else//右子树不空
        {
            Node *next=findMin(root->rchild);//找到root的后继结点
            root->data=next->data;//后继覆盖root
            deleteNode(root->rchild,next->data);//在右子树中将后继删除
        }
    }
    else if(root->data>x)
    {
        deleteNode(root->lchild,x);
    }
    else
    {
        deleteNode(root->rchild,x);
    }
}
~~~

## 二叉查找树的性质

对二叉查找树进行<mark>中序遍历</mark>，遍历的结果是<mark>有序的</mark>。