---
title: JavaScript笔记-基本语法
date: 2020-04-26 21:30:51
tags: JavaScript

---



# JavaScript笔记-基本语法

​	本文主要是看了廖雪峰老师的教程，跟着敲，给自己看的笔记了。教程地址：https://www.liaoxuefeng.com/wiki/1022910821149312

<!--more-->

## 基本数据类型

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>数据类型的展示</title>
</head>
<body>

<script>
    var num=12;//Number类型
    var str="我是string"//String类型
    var nll=null;//Object类型，空
    var obj=new Object()//Object类型
    var bol=true;//boolean类型
    var undef;//未定义的为Undefined类型

    //展示这些数据
    console.log(typeof num);
    console.log(typeof str);
    console.log(typeof nll);
    console.log(typeof obj);
    console.log(typeof bol);
    console.log(typeof undef);

    //Number类型数据
    console.log("Number类型数据的运算：");
    console.log(3+2);
    console.log(3*2);
    console.log(3/2);
    console.log(3%2);
    console.log(3.5%2);//这点和其他的编程语言有些区别哈

    //Object类型的数据
    console.log("Object类型的数据：");
    //第一种定义方式，直接地用大括号括起来
    var obj1={
        name:'John',//键：值加逗号
        age:20//最后一行不用加逗号
    };
    console.log(obj1.age);//访问数据

    //第二种定义方式，先创建再定义
    var obj2=new Object();
    obj2.home="Beijing";//原来没有home键，直接创建并赋值"Beijing"
    console.log(obj2.home);

    //NaN的判断
    var x;//x为Undefined类型
    var y=1;
    console.log(isNaN(x+y));//Undefined+Number显示为NaN(Not a Number)

    //Array类型
    //第一种方式，new Array(ele1,ele2,...,elen)
    var arr1=new Array(1,2.1,3,'haha');//数据可以存储任意的类型
    console.log(arr1[0]);
    console.log(arr1[1]);
    console.log(arr1[2]);
    console.log(arr1[3]);
    console.log(arr1[4]);//越界了，显示为Undefined

    //第二种方式，=[ele1,ele2,...,elen]直接定义
    var arr2=[2,3,"hehe"];
    console.log(arr2[0]);
    console.log(arr2[1]);
    console.log(arr2[2]);
</script>
</body>
</html>
```

## 数组

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Array类型的操作展示</title>
</head>
<body>

<script>
    /*Array的length属性*/
    console.log("Length:")
    var arr1=[1,2,3,4];
    console.log(arr1.length);

    arr1.length=2;//改变length，arr真的会被改变
    console.log(arr1);
    arr1.length=4;//不足的地方为Undefined
    console.log(arr1);

    /*Array的push、pop操作（都是从最后面加入）*/
    console.log("push/pop:")
    var arr2=[];
    arr2.push(1);
    arr2.push(2,3);
    console.log(arr2)//push/pop过后，这样显示Array好像有点问题啊
    console.log(arr2[0],arr2[1],arr2[2]);

    arr2.pop();//返回3
    console.log(arr2[0],arr2[1]);

    arr2.pop();//返回2
    arr2.pop();//返回1
    arr2.pop();//弹光了，但是会返回Undefined

    /*Array的unshift和shift*/
    console.log("unshift/shift")
    arr2=[2,3,4,5];
    arr2.unshift(0,1);//在头部添加元素
    console.log(arr2);

    arr2.shift();//删除头部的一个元素
    console.log(arr2[0]);

    /*Array的slice操作，和String的substring操作一样*/
    console.log("slice")
    var arr3=[0,1,2,3,4];
    console.log(arr3.slice(2));
    console.log(arr3.slice(0,2));

    /*利用slice来复制Array*/
    console.log("用slice复制：")
    var arr4=arr3.slice();//什么参数都不要填就行
    console.log(arr4);

    /*Array元素的查找，和String一样*/
    console.log("查找元素：")
    var arr5=[5,4,3,2,1,0]
    console.log(arr5.indexOf(3))
    console.log(arr5.indexOf(99))//查找不到，返回-1

    /*Array的sort排序*/
    var arr6=[6,5,4,3];
    console.log("sort:");
    console.log(arr6.sort());

    /*Array的reverse反转*/
    console.log("reverse:")
    var arr7=[3,4,1];
    console.log(arr7.reverse())

    /*splice（先删后填）*/
    console.log("splice:");
    var arr8=[4,5,6];
    arr8.splice(0,0,"haha");//从0删0个，添加"haha"
    console.log(arr8[0]);

    arr8.splice(0,1,"hehe");//从0删1个，添加"hehe"
    console.log(arr8);

    arr8.splice(0,1);//删了不加

    /*concat*/
    var arr9=[0,1];
    var arr10=[2,3];
    console.log(arr9.concat(arr10))

    /*join，连接元素，加入字符拼成字符串再返回*/
    var arr11=[1,2,'3'];
    console.log(arr11.join('-'));
</script>
</body>
</html>
```

## 字符串

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>String类型操作的展示</title>
</head>
<body>

<script>
    /*String的拼接*/

    //第一种，用+
    var name="桑";
    var age=20;
    console.log(name+age+"岁了！");

    //第二种，模板字符串:`${str1}${str2}...`
    console.log(`${name}${age}岁了！`);

    /*字符串的索引*/
    var word="Hello,world!"
    console.log(word[0])
    console.log(word[1])
    word[0]='G'//字符串可以索引特定字符，但修改是无效的
    console.log(word[0])

    /*查找字符*/
    console.log(word.indexOf("Hello"))//"Hello"开始的下标
    console.log(word.indexOf("w"))//"w"开始的下标

    /*子字符串*/
    console.log(word.substring(3))//从下标3到最后
    console.log(word.substring(0,6))//[0,5]

    /*大小写的转换*/
    console.log(word.toUpperCase())//转大写
    console.log(word.toLowerCase())//转小写
</script>
</body>
</html>
```

## 对象

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Object对象操作展示</title>
</head>
<body>

<script>

    /*Object对象的定义*/
    var obj1={
        name:"Sang",
        "goal-city":"Shenzhen"//有特殊字符的，用""括起来
    };

    /*Object内数据的访问*/
    console.log(obj1.name);
    console.log(obj1["goal-city"]);//特殊字符的键的访问需要[]括起来
    console.log(obj1.age);//不存在的对象，返回Undefined

    /*判断是否含有某属性*/
    console.log("name" in obj1);//判断name属性是否在obj1中
    console.log("toString" in obj1);//判断toString是否在obj1中（obj1包括继承的属性）
    console.log(obj1.hasOwnProperty("toString"))//除去了继承的内容

    /*删除某项数据*/
    delete obj1.name;
    console.log(obj1.name);
</script>
</body>
</html>
```

## 条件判断

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>条件判断操作展示</title>
</head>
<body>

<script>

    var a=10;
    if(a>10)
    {
        alert("我比10大！");
    }
    else if(a==10)
    {
        alert("我和10一样大！");
    }
    else
    {
        alert("我没有10大！");
    }

</script>
</body>
</html>
```

## 循环

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>循环操作展示</title>
</head>
<body>

<script>

    /*while*/
    var i=0;
    while(i<10)
    {
        console.log(i)
        i++;
    }

    /*do-while*/
    do {
        console.log(i);
        i--;
    }while(i>=0);

    /*for循环*/
    var sum=0;
    for(i=0;i<100;i++)
    {
        sum+=i;
    }
    console.log(sum);

    /*for循环遍历数组*/
    var arr=[0,1,2,3,4,5];
    for(var i=0;i<arr.length;i++)
    {
        console.log(arr[i]);
    }

    /*for循环遍历对象属性*/
    var obj={
        name:"Sang",
        age:20,
        city:"Guoyang"
    }

    for(var key in obj)//var 键 in 对象
    {
        console.log(key,obj[key]);//这种会把包括继承属性在内的属性都遍历
    }

    for(var key in obj)
    {
        if(obj.hasOwnProperty(key))
            console.log(key,obj[key]);//不遍历继承的属性
    }

</script>
</body>
</html>
```

## Map

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>map操作展示</title>
</head>
<body>

<script>

    /*map的创建，键和值可以是任意的类型*/
    var mp=new Map([[1,"haha"],["speak","hengheng"]]);

    /*根据键访问值.get*/
    console.log(mp.get(1));
    console.log(mp.get("speak"));

    /*判断是否含有某个键.has*/
    console.log(mp.has(1));
    console.log(mp.has(2));

    /*添加某个键.set*/
    mp.set("jump","You jump! I jump!");
    console.log(mp.get("jump"))

    /*删除某个键*/
    mp.delete("jump")
    console.log(mp.has("jump"))
</script>
</body>
</html>
```

## Set

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>set操作展示</title>
</head>
<body>

<script>

    /*set的创建*/
    var st=new Set([5,3,2,1]);

    /*添加值.add*/
    st.add(10);

    /*删除值.delete*/
    st.delete(10);
</script>
</body>
</html>
```

## iterable对象

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>iterable对象的遍历操作的展示</title>
</head>
<body>

<script>

    /*
    Array、Set、Map都属于iterable对象，都可以用下面操作遍历
    注意：里面的是of
    */

    //Array的遍历
    var arr=[1,2,3,4];
    for(var key of arr)
    {
        console.log(key);
    }

    //Set的遍历
    var st=new Set([2,1,4,5,3]);
    for(var val of st)
    {
        console.log(val);//事实证明js的Set并不像C++当中的那样会自动地排序
    }

    //Map的遍历
    var mp=new Map([[1,"Haha"],[2,"HeiHei"]]);
    for(var val of mp)
    {
        console.log(val[0],val[1]);//val[0]是键，val[1]是值
    }
</script>
</body>
</html>
```