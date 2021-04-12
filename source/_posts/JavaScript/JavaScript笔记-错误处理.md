---
title: JavaScript笔记-错误处理
date: 2020-04-30 10:37:23
tags: JavaScript
---

# JavaScript笔记-错误处理

​	类似java中的**try,catch,finally**语句，主要是把可能出错（网络错误、访问权限不对、访问数据出错等）的语句放在try里，用catch处理错误，finally为最后要做的操作（**无论是否有错**）

## 错误处理

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>错误处理</title>
</head>
<body>
<script>

    /*常见例子*/
    var un=null;
    try{
        var temp=un.length;
    }catch(e){
        console.log("出错了",e);//出错了 TypeError: Cannot read property 'length' of null
       // at tryCatchFinally.html?_ijt=dfjeqbvjm3ld3nj56lna24mjhj:13
    }finally {
        console.log("这里是finally里面的语句");
    }

    /*也可以try catch  try finally，但只要catch错误了，就要处理一下，不然和不写一样*/

    /*主动抛出错误*/
    try{
        if(!un){
            throw new Error("数据不能为Null");
        }
    }catch(e){
        console.log(e);//Error: 数据不能为Null
        //at tryCatchFinally.html?_ijt=jrfi6rgvtebpi550qp1bh5jic9:26
    };


</script>
</body>
</html>
```

## 错误传播

​	底层函数中的错误会**向上层**函数传播，直到传到JavaScript引擎

```javascript
function down(s){
    console.log("down-begin");
    console.log(s.length);//错误会发生在底层函数
    console.log("down-end");
}

function mid(s) {
    console.log("mid-begin");
    down(s);
    console.log("mid-end");
}

function up(s) {
    console.log("up-begin");
    try{//错误的捕捉在外层函数
        mid(s);
    }catch (e) {
        console.log(e);
    }
    console.log("up-end");
}

up(null);
/*
* 
* up-begin
 mid-begin
down-begin
TypeError: Cannot read property 'length' of null
    at down (tryCatchFinally.html?_ijt=vb1uk0i7rh6q1e12vsdjlekq4e:36)
    at mid (tryCatchFinally.html?_ijt=vb1uk0i7rh6q1e12vsdjlekq4e:42)
    at up (tryCatchFinally.html?_ijt=vb1uk0i7rh6q1e12vsdjlekq4e:49)
    at tryCatchFinally.html?_ijt=vb1uk0i7rh6q1e12vsdjlekq4e:56
up-end
* */

/*由上面的结果可以看得到，down-begin后面发生错误，然后错误就开始向上传播，down-end是没有执行的
，对于mid也一样*/
```

## 异步错误处理

​	JavaScript的代码都是单线程执行的。

​	回调函数这个东西是在一定条件下触发后，再回头调用这个函数。比如

```javascript
function show(){
    throw new Error("There is a error.");
}
try{
    setTimeout(show(),1000);//1s后执行show
}catch(e){//catch不到错误，catch的时候show还没执行，catch了一场空
    console.log(e);
}

```

​	其实这个show函数里面抛出的错误并不会被catch到，因为show是1s后才回头调用，这时候try，catch语句已经执行好了。

​	所以，要注意异步执行的代码的错误处理，在**调用异步执行代码的地方是处理不到错误的**。