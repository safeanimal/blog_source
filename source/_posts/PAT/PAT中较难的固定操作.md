---
title: PAT中较难的固定操作
date: 2020-04-29 11:42:51
tags: PAT
---

# PAT中较难的固定操作

# 大整数的运算

```c++
#include<cstdio>
#include<cstring>

struct Bn//bignumber
{
	int n[50];//最大设为50位
	int len;//数字的长度
	Bn()
	{
		memset(n,0,sizeof(n));//全部设为0，是一个技巧，便于接下来的运算	
	}
};

Bn toBn(char s[])//将字符串转成大数，大数是倒过来的，方便运算
{
	Bn ans;
	int len=strlen(s);
	for(int i=0;i<len;i++)
		ans.n[i]=s[len-i-1]-'0';
	ans.len=len;
	return ans;
}

int cmp(Bn a,Bn b)
{
	for(int i=0;i<a.len||i<b.len;i++)
	{
		if(a.n[i]<b.n[i])
			return -1;//a<b 
		if(a.n[i]>b.n[i])
			return 1;//a>b
	}
	return 0;//相等 
}

Bn add(Bn a,Bn b)//两大整数相加 
{
	Bn ans;//结果 
	int len=a.len>b.len?a.len:b.len;//选取较大的那个长度
	int carry=0;//进位 
	for(int i=0;i<len;i++)
	{
		int temp=a.n[i]+b.n[i]+carry;
		ans.n[ans.len++]=temp%10;
		carry=temp/10;
	}
	if(carry!=0)//运算到最后还有进位，要放在最前面
		ans.n[ans.len++]=carry;
	return ans; 
}

Bn sub(Bn a,Bn b)//两高精度数之间的减法 
{
	Bn ans;
	for(int i=0;i<a.len||i<b.len;i++)
	{
		if(a.n[i]<b.n[i])
		{
			a.n[i+1]--;
			a.n[i]+=10;
		}
		ans.n[ans.len++]=a.n[i]-b.n[i];
	}
	while(ans.len>1&&ans.n[ans.len-1]==0)//去除高位的0，但至少保留一位 
		ans.len--;
	return ans;
}

Bn multiply(Bn a,int b)//高精度与低精度的乘法 
{
	Bn ans;
	int carry=0;
	for(int i=0;i<a.len;i++)
	{
		int temp=a.n[i]*b+carry;
		ans.n[ans.len++]=temp%10;
		carry=temp/10;	
	}
	while(carry!=0)
	{
		ans.n[ans.len++]=carry%10;
		carry/=10;
	}
	return ans;
}

Bn divide(Bn a,int b,int &r)
{
	Bn ans;
	ans.len=a.len;//先令长度相等，因为结果就在对应的位置 
	r=0;//余数 
	for(int i=a.len-1;i>=0;i--)
	{
		r=r*10+a.n[i];
		if(r>=b)
		{
			ans.n[i]=r/b;
			r%=b;
		}
	}
	while(ans.len>1&&ans.n[ans.len-1]==0)//去除前导0，但最少要保留1个 
		ans.len--;
	return ans;
}

void show(Bn a)
{
	for(int i=a.len-1;i>=0;i--)
		printf("%d",a.n[i]);
	printf("\n");
}

int main()
{
	char s1[]="120";
	int r;
	Bn a=toBn(s1);
	show(a);
	Bn ans=divide(a,10,r);
	show(ans);
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

# **分数的运算**

```cpp
#include<cstdio>
#include<algorithm>
using namespace std;

struct Frac
{
	int up,down;
};

int gcd(int a,int b)
{
	return !b?a:gcd(b,a%b);
}

void reduction(Frac &a)
{
	if(a.down<0)
	{
		a.up=-a.up;
		a.down=-a.down;
	}
	if(a.up==0)
		a.down=1;
	else
	{
		int factor=gcd(abs(a.up),abs(a.down));
		a.up/=factor;
		a.down/=factor;
	}	
}

Frac add(Frac a,Frac b)
{
	Frac ans;
	ans.down=a.down*b.down;
	ans.up=a.up*b.down+b.up*a.down;
	reduction(ans);
	return ans;
}

Frac sub(Frac a,Frac b)
{
	Frac ans;
	ans.down=a.down*b.down;
	ans.up=a.up*b.down-b.up*a.down;
	reduction(ans);
	return ans;
}

Frac multiply(Frac a,Frac b)
{
	Frac ans;
	ans.up=a.up*b.up;
	ans.down=a.down*b.down;
	reduction(ans);
	return ans;
}

Frac divide(Frac a,Frac b)
{
	Frac ans;
	ans.up=a.up*b.down;
	ans.down=a.down*b.up;
	reduction(ans);
	return ans;
}

void print(Frac a)//化简后的输出 
{
	if(a.down==1)
		printf("%d",a.up);
	else if(abs(a.up)>a.down)
		printf("%d %d/%d",a.up/a.down,abs(a.up)%a.down,a.down);
	else
		printf("%d/%d",a.up,a.down);
	printf("\n");
}

int main()
{
	Frac a,b;
	a.up=-4;
	a.down=2;
	b.up=4;
	b.down=-6;
	print(add(a,b));
	print(sub(a,b));
	print(multiply(a,b));
	print(divide(a,b));
	return 0;
}
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

```
输出：
-2 2/3
-1 1/3
1 1/3
3

--------------------------------
Process exited after 3.402 seconds with return value 0
请按任意键继续. . .
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)