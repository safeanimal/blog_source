---
title: Flask-视图函数处理HTTP请求
date: 2021-04-20 16:00:35
categories:
- [编程, Python, Flask]
tags:
- Flask

---

**request模块：**request中封存了<mark>客户端</mark>的一些信息。可<mark>将request当全局变量</mark>使用。(P16)

**指定视图函数接受的HTTP请求类型：**`@app.route('path', methods=[type1, type2, ...])`

```python
from flask import Flask, redirect, url_for, request
app = Flask(__name__)

@app.route('/success/<name>')
def success(name):
	return 'welcome {}'.format(name)

@app.route('/login', methods = ['POST', 'GET'])
def login():
	if request.method == 'POST':#用POST方法请求
		user = request.form['nm']#从表单中提取数据
		return redirect(url_for('success', name = user))
	else:#用GET方法请求
		user = request.args.get('nm')#args为字典，包含所有表单参数与其对应值
		return redirect(url_for('success', name = user))

if __name__ == '__main__':
	app.run(debug = True)
```

