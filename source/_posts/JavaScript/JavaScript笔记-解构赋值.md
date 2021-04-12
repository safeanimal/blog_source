---
title: JavaScript笔记-解构赋值
date: 2020-04-26 21:34:25
tags: JavaScript

---

# JavaScript笔记-解构赋值

https://www.liaoxuefeng.com/wiki/1022910821149312基于廖雪峰老师的教程所做的笔记。

<!--more-->

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>解构赋值操作展示</title>
</head>
<body>

<script>

    /*解构赋值*/

    /*解构数组*/
    console.log("解构数组：");
    var [a,b,c]=["我是a","我是b","我是c"];//var [v1,v2,...]=[c1,c2,...]
    console.log(a);
    console.log(b);
    console.log(c);

    var [d,e,f]=[,,"我是f"];//前两个不赋值，最后一个赋值
    console.log(d);
    console.log(e);
    console.log(f);

    /*解构对象*/

    /*一般的对象*/
    console.log("解构一般对象：");
    var obj={
        name:"Sang",
        age:20,
        city:"Guoyang"
    };

    var {name,age,city}=obj;//var {属性1,属性2,...}=对象
    console.log(name);
    console.log(age);
    console.log(city);

    /*含有对象的对象*/
    console.log("解构含有对象的对象：")
    var person={
        lastName:"Sang",
        address:{
            city:"Guoyang",
            town:"Chengxi"
        }
    }

    var {lastName,address:{city,town}}=person;//这里address不是变量，只是通过它给city,town赋值而已
    console.log(lastName);
    console.log(city);
    console.log(town);


    /*解构赋值的使用小技巧*/

    /*变量迅速交换*/
    console.log("变量交换：")
    var x=1,y=2;
    [x,y]=[y,x];
    console.log(x);
    console.log(y);

    /*获取当前页面域名、路径*/
    console.log("获取当前页面域名、路径：")
    var{hostname:domain,pathname:path}=location;
    console.log(domain);
    console.log(path);

    /*函数传入对象*/
    function display({lastname,firstname="Guorui"}){
        console.log(lastname+firstname);
    }

    display({lastname:"Sang"});
    display({lastname:"Sang",firstname:"haha"});

</script>
</body>
</html>
```