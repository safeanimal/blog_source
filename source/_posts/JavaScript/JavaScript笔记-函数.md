---
title: JavaScript笔记-函数
date: 2020-04-26 21:34:32
tags: JavaScript

---

# JavaScript笔记-函数

https://www.liaoxuefeng.com/wiki/1022910821149312基于廖雪峰老师的教程所做的笔记。

<!--more-->

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>函数基本操作展示</title>
</head>
<body>

<script>

    /*函数的定义*/

    /*方式1*/
    function abs(x){
        if(x>0){
            return x;
        }
        else{
            return -x;
        }
    }
    console.log(abs(-1));

    /*方式2，函数也是一个对象，以变量的方式出现*/
    var square=function(x){
        return x*x;
    };//由于是赋值语句，要补一个分号
    console.log(square(2));

    /*返回值问题*/
    function add(a,b){
        //这里没有写返回值，返回的结果为Undefined
    }
    console.log(add(1,2));

    /*参数问题*/

    /*调用的时候，参数多余*/
    function show(){
        console.log("Show Time!")
        for(var val of arguments){//arguments代表这个函数所接受到的所有参数，为一个数组
            console.log(val);
        }
    }
    show("We","are","arguments!")

    /*调用的时候，参数不够*/
    function sub(a,b){
        return a-b;
    }
    console.log(sub(1));//只给了a，那么b就会以Undefined默认给出，结果为NaN

    function sum(a,b,...rest){//把...rest放到最后，表示除了a,b以外的多出来的参数
        var ans=0;
        ans=a+b;
        for(var val of rest){//如果有多出来的值，也加进去
            ans+=val;
        }
        return ans;
    }
    console.log(sum(1,2));//结果为3
    console.log(sum(1,2,3,4))//结果为10

    /*一个需要注意的事项，js会在每行行末自动添加分号*/
    function get(){
        return{        //return后面的这个{不能放到下一行，否则，return会被自动补上一个;导致什么也没有返回
            name:"Sang"
        };
    }
</script>
</body>
</html>
```