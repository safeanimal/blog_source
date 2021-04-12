---
title: JavsScript笔记-标准对象-Date
date: 2020-04-27 13:59:01
tags: JavaScript

---

# JavsScript笔记-标准对象-Date

​	Date是用来表示时间的对象

<!--more-->

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>标准对象-Date</title>
</head>
<body>

<script>
    var d=new Date();//获取现在的时间
    console.log(d);//Mon Apr 27 2020 13:45:29 GMT+0800

    var stamp=new Date().getTime();//获取现在时间的时间戳的表示
    console.log(stamp);//1587966428725
//时间戳也能创建Date
    var d1=new Date("Mon Apr 27 2020 13:45:29 GMT+0800");
    console.log(d1.toLocaleString());//2020/4/27 下午1:45:29
    console.log(d1.toUTCString());//Mon, 27 Apr 2020 05:45:29 GMT

    var d2=new Date(2020,4,17,14,10,26,120);//年月日时分秒毫秒
    /*传入4，但表示的是5月，月份从0开始算的*/
    console.log(d2);//Sun May 17 2020 14:10:26 GMT+0800 (中国标准时间)
    console.log(d2.getFullYear());//2020
    console.log(d2.getMonth());//4
    console.log(d2.getDay());//17
    console.log(d2.getHours());//14
    console.log(d2.getMinutes());//10
    console.log(d2.getSeconds());//26
    console.log(d2.getMilliseconds());//120

</script>
</body>
</html>
```