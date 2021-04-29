---
title: Python爬虫-scrapy数据持久化存储
date: 2021-04-29 13:53:22
categories:
- [编程, Python]
tags:
- scrapy
---

## 基于终端指令的持久化存储

1. 存储数据放到爬虫文件的`parse方法的返回值中`。
2. 存储只能为`json`, `csv`, `xml`等文本类型。
3. `scrapy crawl spider_name -o output_path`。执行`spider_name`，将输出放到`output_path`中。

```python
import scrapy


class Spider1Spider(scrapy.Spider):
    name = 'spider1'
    # 允许爬取的域名列表
    allowed_domains = ['www.bilibili.com']
    # 要爬取的URL列表
    start_urls = ['https://www.bilibili.com/v/popular/rank/all']

    def parse(self, response):
        # 返回内容封装在selector中，其返回所有符合条件的selector对象组成的列表。
        selector_list = response.xpath('//li//div[@class="info"]/a/@href')
        # 将selector中封装的data提取出来
        data = selector_list.extract()

        # 封装为字典存json。经尝试，直接返回str或list都不能成功存储。
        return {"data": data}

```

