---
title: JavaScript笔记-标准对象-JSON
date: 2020-04-27 14:47:10
tags: JavaScript

---

# JavaScript笔记-标准对象-JSON

JSON是一种数据交换格式，JS中的相关函数课用于数据的序列化（变为JSON格式）和反序列化（从JSON格式导入JS变量）

<!--more-->

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>标准对象-JSON</title>
</head>
<body>

<script>
    /*
    * JSON是数据交换的一个格式，JSON中的数据和JavaScript中的数据一一对应
    * */

    /*序列化*/
    var me={
        name:"Sang",
        age:20,
        height:1.72,
        skill:['play','go play','play go go']
    }

    var s=JSON.stringify(me);
    console.log(s);//{"name":"Sang","age":20,"height":1.72,"skill":["play","go play","play go go"]}

    var sPretty=JSON.stringify(me,null,' ');
    console.log(sPretty);
    // {
    //     "name": "Sang",
    //     "age": 20,
    //     "height": 1.72,
    //     "skill": [
    //     "play",
    //     "go play",
    //     "play go go"
    // ]
    // }

    var sSpec=JSON.stringify(me,['name','age'],' ');//筛出name和age两项
    console.log(sSpec);
    // {
    //     "name": "Sang",
    //     "age": 20
    // }

    function convert(key,value) {
        if (typeof value === 'string') {
            return value.toUpperCase();
        }
        return value;//必须写这一句，貌似所有情况的都得返回
    }

    var sUpperCase=JSON.stringify(me,convert,' ');
    console.log(sUpperCase);
    // {
    //     "name": "SANG",
    //     "age": 20,
    //     "height": 1.72,
    //     "skill": [
    //     "PLAY",
    //     "GO PLAY",
    //     "PLAY GO GO"
    // ]
    // }


    var superMe={
        name:"Sang",
        age:20,
        height:1.72,
        skill:['play','go play','play go go'],
        toJSON:function(){//在对象内部定义一个序列化函数
            return {//只返回一部分
                'Name':this.name,//还可以改键
                'age':this.age
            }
        }
    }

    var supers=JSON.stringify(superMe);//还以为是superMe.toJSON调用，结果并不是！！
    console.log(supers);//{"Name":"Sang","age":20}

    /*反序列化*/
    var num=JSON.parse('22');
    console.log(num);//22

    var str=JSON.parse('"哈哈"');
    console.log(str);//哈哈

    var arr=JSON.parse('[1,2,3]');
    console.log(arr);//[1,2,3]

    var obj=JSON.parse('{"name":"guorui","age":20}');//对象里面键好像必须使用双引号
    console.log(obj);//Object{name:"guorui",age:20}

    var bool=JSON.parse('true');
    console.log(bool);//true


</script>
</body>
</html>
```