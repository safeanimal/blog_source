---
title: JavaScript笔记-闭包函数
date: 2020-04-26 21:34:49
tags: JavaScript

---

# JavaScript笔记-闭包函数

https://www.liaoxuefeng.com/wiki/1022910821149312基于廖雪峰老师的教程所做的笔记。

<!--more-->

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>闭包函数操作展示</title>
</head>
<body>

<script>

    /*闭包函数：该函数的返回值还是个函数*/
    function add(x){
        var y=100;
        var result=function(){
            return x+y;//看清楚这里有return，把值返回给result
        }
        return result;//返回result函数
    }

    var f=add(10);//f就是result函数，此时f当中运算用的数据是add函数里面的数据
    console.log(f());//调用f，即调用add里的result，结果为10+100=110

    /*闭包函数的误区——谨慎使用循环*/
    function count() {
        var arr=[];
        for(var i=1;i<=3;i++){//看这里循环变量声明用的var
            arr.push(function(){//向arr里添加函数
                return i*i;
            });
        }
        return arr;//arr里存储一系列函数
    }

    var results=count();
    var f1=results[0];
    var f2=results[1];
    var f3=results[2];
    console.log(f1(),f2(),f3());//16 16 16
    /*结果解释——count()运行完才计算闭包函数，f1,f2,f3运行的时候i已经变成4*/

    /*解决方案*/
    /*先介绍立即执行的匿名函数的写法*/
    var ans=(function(x){return x*x})(3);//函数整体用()括起来，最后赋值3立即执行
    console.log(ans);//9

    /*方法：循环变量用let*/
    function countRight() {
        var arr = [];
        for (let i = 1; i <= 3; i++) {//循环变量声明用的let
            arr.push(function () {//向arr里添加函数
                return i * i;
            });
        }
        return arr;
    }
    var resultsRight=countRight();
    var fRight1=resultsRight[0];
    var fRight2=resultsRight[1];
    var fRight3=resultsRight[2];
    console.log(fRight1(),fRight2(),fRight3());//1 4 9

</script>
</body>
</html>
```