---
title: JavaScript笔记-变量作用域
date: 2020-04-26 21:33:54
tags: JavaScript

---

# JavaScript笔记-变量作用域

https://www.liaoxuefeng.com/wiki/1022910821149312基于廖雪峰老师的教程所做的笔记。

<!--more-->

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>变量作用域展示</title>
</head>
<body>

<script>

    /*作用域的嵌套*/
    function up(){
        var x=1;
        function down() {//js中函数是可以嵌套的
            var x=2;
            console.log("内层为：",x);
        }
        console.log("外层为：",x);
        down();
    }
    up();

    /*for的局部作用域的声明*/

    /*错误的声明方式*/
    function local(){
        for(var i=0;i<100;i++){

        }
        console.log(i);//还是能访问i的
    }
    local();

    /*正确的声明方式√*/
    function localRight(){
        for(let i=0;i<100;i++){

        }
        //console.log(i);//Uncaught ReferenceError: i is not defined，错了就不能向下面执行了，先注释掉
    }
    localRight();

    /*
    全局变量：不在任何一个函数体内声明的变量（包括最外层的函数）
    */
    var name="Sang";
    function show(){
        console.log("Hello world!");
    }

    console.log("全局变量",name);
    show();

    /*全局变量都是绑定到一个js默认的全局对象window上面的，也可以如下的方式访问*/
    console.log("使用window访问全局变量：",window.name);
    window.show();

    /*常量的声明*/
    const PI=3.14;
    console.log("常量：",PI);

</script>
</body>
</html>
```