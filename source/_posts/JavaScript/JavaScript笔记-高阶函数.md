---
title: JavaScript笔记-高阶函数
date: 2020-04-26 21:34:41
tags: JavaScript

---

# JavaScript笔记-高阶函数

https://www.liaoxuefeng.com/wiki/1022910821149312基于廖雪峰老师的教程所做的笔记。

<!--more-->

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>高阶函数的操作展示</title>
</head>
<body>

<script>

    /*高阶函数：用别的函数（函数也是变量）当参数的函数*/
    function get1() {
        return 1;
    }

    function plus1(x,f) {//这里的f是个函数，plus1就是个高阶函数
        console.log(x+f());//f的调用格式是：f(参数)
    }
    plus1(2,get1);//调用plus1，结果为3

    /*数组的高阶函数：map()*/
    console.log("arr.map()：");
    var num=[1,2,3,4];
    //回调函数function()可以接受3个参数，通常只用一个，第一个参数代表数组中的每个元素，第二个参数代表元素下标
    //第三个参数代表数组本身
    var result=num.map(function(x){//对num中的每个元素，用function处理，其返回值当做该元素的新值
        return x*x;
    });//Array.map(function(){})返回一个新的数组

    for(var val of result){
        console.log(val);
    }//结果为1 4 9 16

    /*数组的高阶函数：reduce()*/
    console.log("arr.reduce()：");
    var newNum=[1,2,3,4];
    var newResult=newNum.reduce(function(x,y){//(((1+2)+3)+4)
        return x+y;
    });//返回一个最终累积的计算结果
    console.log(newResult);//结果为10

    /*数组的高阶函数：filter()*/
    console.log("arr.filter()：");
    var stature=[2,3,6,8,1];
    var statureResult=stature.filter(function(x){//函数筛选>5的元素
       if(x>5)
           return true;
    });
    console.log(statureResult);

    /*数组的高阶函数：sort()*/
    console.log("arr.sort()：");
    /*arr.sort()默认把arr中每个元素当成字符串再排序，所以不明白机制的情况下容易用错
    * 一般用法如下：
    * */
    var order=[2,3,1,5,4];
    var orderResult=order.sort(function(x,y){//比较两两元素大小，根据返回值-1，0，1排序
       if(x<y){//这样是把大的放前面，和C++排序函数写法完全相反！！
           // JS当中true/false貌似和1/0不能转换
           return 1;
       }
       else if(x==y){
           return 0;
       }
       else{
           return -1;
       }
    });
    console.log(orderResult);//结果为[5,4,3,2,1]

    /*数组的高阶函数：every()*/
    console.log("arr.every()：");
    /*arr.every()判断是否每个元素都符合特定条件，返回boolean*/
    var weight=[2,3,8,1,5,9];
    var weightResult=weight.every(function(x){
        if(x>5)
            return true;
    });
    console.log(weightResult);//结果为false

    /*数组的高阶函数:find()*/
    console.log("arr.find()：");
    /*arr.find()查找符合特定条件的第一个元素，再返回这个元素*/
    var height=[5,2,1,2];
    var heightResult=height.find(function (x) {
        if(x===2)//查找===2的元素
            return true;
    });
    console.log(heightResult);//返回2，要是没找到会返回undefined

    /*数组的高阶函数：findIndex()*/
    console.log("arr.findIndex()：");
    /*arr.findIndex()返回第一个符合特定条件元素的下标，没找到的话返回-1*/
    var person=["John","Lucy","Bob","Sang"];
    var personResult=person.findIndex(function(x){
       if(x==="Sang")
           return true;
    });
    console.log(personResult);//结果为3

    /*数组的高阶函数：forEach()*/

    /*arr.forEach()和arr.map()的作用一样，不过前者不返回新的数组*/
</script>
</body>
</html>
```

