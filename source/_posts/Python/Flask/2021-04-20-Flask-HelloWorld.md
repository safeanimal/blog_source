---
title: Flask-HelloWorld
date: 2021-04-20 15:33:35
categories:
- [编程, Python, Flask]
tags:
- Flask
---

> 基础结构：
>
> 1. 应用**实例化**
> 2. 定义**视图函数**（修饰器、返回值）
> 3. 运行

**视图函数：**修饰器决定了该<mark>函数的URL入口</mark>和在URL中<mark>可传递的参数</mark>。该函数的返回值就是访问URL的结果（HTML）。

```python
@route('path/<type:arg_name>', methods=['type1', ...])
def fun():
	return HTTP_TEXT, Status_Code, Header
# 返回值可选三个，一般只用第一个，返回HTTP源码。第二个为状态码，第三个为HTTP首部。
```

**重定向：**

`redirect(URL)`：需要从`flask`中引入`redirect`模块。

`url_for(fun_name, **args)`：生成视图函数`fun_name`对应的`URL`，并传入参数。

**运行的两种方式：**

```python
if __name__ == '__main__':#运行应用
	app.run(debug = True)#开启调试模式，代码更新则自动更新应用
```

```sh
# powershell中
$env FLASK_APP=hello.py
$env FLASK_DEBUG=1
flask run
```



```python
from flask import Flask, redirect, url_for
app = Flask(__name__)#创建应用实例

@app.route('/')
def hello_world():
	return 'Hello World'

@app.route('/guest/<guest>')#在url中传递字符参数<guest>，也可以<int:guest><float:guest><path:guest>
def hello_guest(guest):
	return 'Hello {} as Guest'.format(guest)

@app.route('/user/<name>')
def hello_user(name):
	if name == 'admain':
		return redirect(url_for('hello_admin'))#重定向到hello_admin函数指定的页面
	else:
		return redirect(url_for('hello_guest', guest = name))#重定向到hello_guest函数指定的页面，并传递参数guest
if __name__ == '__main__':#运行应用
	app.run(debug = True)#开启调试模式，代码更新则自动更新应用
```

