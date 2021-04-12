---
title: JavaScript笔记-箭头函数
date: 2020-04-26 21:34:54
tags: JavaScript

---

# JavaScript笔记-箭头函数

https://www.liaoxuefeng.com/wiki/1022910821149312基于廖雪峰老师的教程所做的笔记。

<!--more-->

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>箭头函数操作展示</title>
</head>
<body>

<script>

    /*原函数——一个参数*/
    function square(x){
        return x*x;
    }
    /*等价的箭头函数*/
    var squareArrow=x=>x*x;

    console.log(square(2));//结果为4
    console.log(squareArrow(2));//结果为4

    /*原函数——多个参数*/
    function add(x,y){
        return x+y;
    }
    /*等价的箭头函数*/
    var addArrow=(x,y)=>x+y;//多个参数要用()括起来

    console.log(add(1,2));//结果为3
    console.log(addArrow(1,2));//结果为3

    /*原函数——返回值为一个对象*/
    function getName(){
        return{
            firstName:"Guorui",
            lastName:"Sang"
        }
    }
    /*等价的箭头函数*/
    var getNameArrow=()=>({//没参数，用()代替；返回的对象用{}括起来，防止和标识函数体的花括号搞混
      firstName: "Guorui",
      lastName: "Sang"
    })

    console.log(getName());//返回如上定义的对象
    console.log(getNameArrow());//返回如上定义的对象

    /*原函数——多条语句*/
    function abs(x){
        if(x>=0)
            return x;
        else
            return -x;
    }

    /*等价的箭头函数*/
    var absArrow=(x)=>{
        if(x>=0)
            return x;
        else
            return -x;
    }

    console.log(abs(-11));//结果为11
    console.log(absArrow(-11));//结果为11

    /*小技巧——使用箭头函数可以避免对象的内嵌方法访问不到对象数据的问题*/
    var obj={
        age:20,
        city:"Shenzhen",
        show:function(){//方法
            console.log(this.age);//this指向obj
            let printCity=()=>{
                console.log(this.city);//用箭头函数，此时this指向obj
            }
            printCity();
        }
    }

    obj.show();//结果为20 Shenzhen


</script>
</body>
</html>
```

