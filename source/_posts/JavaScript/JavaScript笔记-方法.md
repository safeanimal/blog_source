---
title: JavaScript笔记-方法
date: 2020-04-26 21:35:10
tags: JavaScript

---

# JavaScript笔记-方法

https://www.liaoxuefeng.com/wiki/1022910821149312基于廖雪峰老师的教程所做的笔记。

<!--more-->

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>方法的操作展示</title>
</head>
<body>

<script>

    /*对象内部定义的函数叫做方法*/
    var obj={
        name:"Sang",
        age:20,
        show:function(){//show就是obj的一个方法
            console.log(this.name,this.age);//用this访问这个对象的数据
        }
    }
    obj.show();//调用show()，要想show()中的this指的对，必须这么调用

    /*误区*/
    var student={
        name:"Sang",
        school:"Hainan University",
        show:function(){
            var that=this;//捕获this
            function showName() {//内嵌的方法无法用this访问对象的数据，需要在上层方法中捕获this
                console.log(that.name);
            }
            showName();
            console.log(this.school);
        }
    }
    student.show();//调用show()，要想show()中的this指的对，必须这么调用

    /*apply（绑定一个对象的调用）*/

    /*先在外部定义方法*/
    var tell=function () {
        console.log(this.name+", how are you?");
    }

    tell.apply(student,[]);//student为绑定的对象，那么tell()里面的this指定student，[]表示参数为空

    /*小技巧----用apply实现装饰器*/

    //统计代码调用了多少次parseInt，可以装饰parseInt函数
    var count=0;
    var oldParseInt=parseInt;//保留原函数
    window.parseInt=function(){//重新定义parseInt
        count+=1;
        return oldParseInt.apply(null,arguments);//调用原函数
    }
    parseInt('10');
    parseInt('20');
    parseInt('30');
    console.log('count=',count);//结果为3
</script>
</body>
</html>
```