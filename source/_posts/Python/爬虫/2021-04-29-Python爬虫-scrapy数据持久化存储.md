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

## 基于管道的持久化存储

​	**前提**：创建工程`project2`并创建爬虫文件`spider2`。

![项目结构](https://raw.githubusercontent.com/safeanimal/PicGo/main/img/image-20210429211125038.png)

### spyder2.py

```python
import scrapy
from project2.items import Project2Item

class Spider2Spider(scrapy.Spider):
    name = 'spider2'
    # 允许爬取的域名列表
    allowed_domains = ['www.bilibili.com']
    # 要爬取的URL列表
    start_urls = ['https://www.bilibili.com/v/popular/rank/all']

    def parse(self, response):
        # 返回内容封装在selector中，其返回所有符合条件的selector对象组成的列表。
        selector_list = response.xpath('//li//div[@class="info"]/a/@href')
        # 将selector中封装的data提取出来
        data = selector_list.extract()

        # 创建item对象
        item = Project2Item()
        item["rank_list"] = ' '.join(data)

        # yield会将item发给管道
        yield item

```

### items.py

```python
# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy


class Project2Item(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    rank_list = scrapy.Field()

```

### piplines.py

​	**前提**：`setting.py`中解注释`ITEM_PIPELINES`。

```python
# 300代表管道的优先级，数值越小越优先。可能会有多个管道
ITEM_PIPELINES = {   'project2.pipelines.Project2Pipeline': 300,
#可继续添加管道类优先级
}
```

```python
# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html


# useful for handling different item types with a single interface
from itemadapter import ItemAdapter


class Project2Pipeline:
    fp = None
    # 对父类方法重写。本方法在爬虫之前启动。
    def open_spider(self, spider):
        print("开始爬虫")
        self.fp = open('./bilibili_rank.txt', 'w', encoding='utf-8')

    # 对item封装的数据进行持久化存储
    def process_item(self, item, spider):
        data = item["rank_list"]
        self.fp.write(data)
        return item#此时的item会传给下一个执行的管道

    # 对父类方法重写。本方法在爬虫结束时启动。
    def close_spider(self, spider):
        print("结束爬虫")
        self.fp.close()

# 定义另外一个管道类
#class DatabasePipline:
#	...
```

`scrapy crawl spider2`开始爬取数据。

{% note success %}

相比较于终端指令持久存储方式，使用管道方式存储方式更灵活。可以存在<mark>任何类型文件或者数据库中</mark>。

{% endnote %}