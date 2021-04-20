---
title: Flask-使用前端框架Bootstrap
date: 2021-04-20 20:18:42
categories:
- [编程, Python, Flask]
tags:
- Flask
---

## 介绍

**Bootstrap**是Twitter开发的一个<mark>开源Web框架</mark>，它提供的<mark>用户界面组件</mark>可用于快速创建简洁的网页。

**Flask-Bootstrap**：集成到Flask框架中的Bootstrap模块。（可惜已停止维护，凑活使用吧！）

## 安装

在Flask项目的虚拟环境下：

`pip install flask-bootstrap`

## 预备知识

### 基模板与衍生模板

​	**基模板**中可定义一些用于复用的区块`block`。**衍生模板**是继承了基模板的模板，其可直接使用并扩展基模板中的`block`。

```html
<!--base.html-->
<html>
    <head>
        <!--定义head区块-->
        {% block head %}
        	<title>Application</title>
        {% endblock %}
    </head>
</html>
```

```html
<!--衍生模块-->
{% extends "base.html" %}<!--继承基模块-->

<!--1. 覆盖基模块中同名block的内容-->
{% block head %}
	自己定义的内容
{% endblock %}

<!--2. 继承基模块内容并扩展-->
{% block head %}
	{{ super() }}
	<p>扩展内容</p>
{% endblock %}
```

## 使用Flask-Bootstrap示例

> **更改bootstrap的样式**可自定义css或js文件，然后向如下一样添加进衍生模板。
>
> **bootstrap组件**：https://v3.bootcss.com/components/#btn-groups-single

```html
<!--继承Bootstrap提供的基模板，这个模板是一个通用的网页骨架-->
<!--该基模板中已包含了必要的css和javascript文件-->
{% extends "bootstrap/base.html" %}

<!--在原有css基础上添加css文件，文件放在static文件夹里
	url_for('static', filename='name')自动生成static文件	  夹下name文件的路径-->
{% block scripts %}
    {{super()}}
    <script type="text/javascript" src="{{url_for('static', filename='js/star.js')}}"></script>>
{% endblock %}

<!--网页导航栏-->
{% block navbar %}
{% endblock %}

<!--网页内容-->
{% block content %}
	自己设计的内容，尽情使用各种bootstrap提供的组件
{% endblock %}

<!--在原基础上添加javascript文件-->
{% block scripts %}
    {{super()}}
    <script type="text/javascript" src="{{url_for('static', filename='js/star.js')}}"></script>>
{% endblock %}
```

