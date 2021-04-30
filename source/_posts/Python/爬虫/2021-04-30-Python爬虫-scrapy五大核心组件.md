---
title: Python爬虫-scrapy五大核心组件
date: 2021-04-30 16:07:22
categories:
- [编程, Python]
tags:
- scrapy
---

![scrapy五大核心组件及之间的交互](https://docs.scrapy.org/en/latest/_images/scrapy_architecture_02.png)

从中可以看出Engine类似于总指挥。

1. Spiders向Engine提交Requests。
2. Engine将Requests交给Scheduler进行过滤重复请求等操作。
3. Scheduler返回新的Requests给Engine。
4. Engine将Requests交给Downloader
5. Downloader从网上下载好内容封装成Response返回给Engine。
6. Engine将Response交给Spiders进行数据解析处理，得到Item或进一步提交Requests。但最终是要yield item交给Engine。
7. Engine将item交给Item Piplines进行数据持久化存储。

{% note info %}

图中有两个Middlewares，从④⑤⑥中可看出Requests和Responses会经过Middleware，则<mark>可在Middleware中对Requests或Responses进行修改</mark>。如Requests中修改headers或者添加代理IP等。

{% endnote %}

![项目中能看到并修改逻辑的组件](https://raw.githubusercontent.com/safeanimal/PicGo/main/img/image-20210430162316891.png)

