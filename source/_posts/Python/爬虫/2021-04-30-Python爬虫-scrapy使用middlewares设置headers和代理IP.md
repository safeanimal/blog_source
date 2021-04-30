---
title: Python爬虫-scrapy使用middlewares设置headers和代理IP
date: 2021-04-30 16:28:52
categories:
- [编程, Python]
tags:
- scrapy
---

{% note info %}

**目标**：爬取豆瓣小说标签页面共计三页图书的信息。

{% endnote %}

**流程**：

1. 在`setting.py`中根据需要设置`LOG_LEVEL`，`ROBOTSTXT_OBEY`，`ITEM_PIPELINES`，`DOWNLOADER_MIDDLEWARES`等项。
2. 在`middlewares.py`中定义`request.headers`，用于UA伪装、IP代理等设置。
3. 在`items.py`中定义数据项，用于封装`spider_name.py`解析到的数据。
4. 在`spider_name.py`文件中定义URL和数据解析的逻辑（可能进行多层解析、不同URL的解析）。
5. 在`piplines.py`中定义数据存储逻辑。

### 项目结构

![项目结构](https://raw.githubusercontent.com/safeanimal/PicGo/main/img/image-20210430164301065.png)

### 项目主要文件的源码

#### settings.py（修改过的部分）

```python
LOG_LEVEL = "ERROR"
ROBOTSTXT_OBEY = False
DOWNLOADER_MIDDLEWARES = {
    'project3.middlewares.Project3DownloaderMiddleware': 543,
}
ITEM_PIPELINES = {
    'project3.pipelines.Project3Pipeline': 300,
}
```

#### middlewares.py

{% note info %}

`process_exception`会在downloader请求数据抛出异常时调用。

**设置代理IP**：

1. 添加语句`request.meta['proxy'] = 'http://Agent_Adress'`（或者https开头的，取决于要爬取的网页类型）。
2. 设定返回值`return request`重新进行request。

{% endnote %}

```python
# Define here the models for your spider middleware
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/spider-middleware.html

from scrapy import signals

# useful for handling different item types with a single interface
from itemadapter import is_item, ItemAdapter


class Project3DownloaderMiddleware:
    # Not all methods need to be defined. If a method is not defined,
    # scrapy acts as if the downloader middleware does not modify the
    # passed objects.

    user_agent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.49'

    def process_request(self, request, spider):
        # Called for each request that goes through the downloader
        # middleware.
        request.headers['User-Agent'] = self.user_agent
        # Must either:
        # - return None: continue processing this request
        # - or return a Response object
        # - or return a Request object
        # - or raise IgnoreRequest: process_exception() methods of
        #   installed downloader middleware will be called
        return None

    def process_response(self, request, response, spider):
        # Called with the response returned from the downloader.

        # Must either;
        # - return a Response object
        # - return a Request object
        # - or raise IgnoreRequest
        return response

    def process_exception(self, request, exception, spider):
        # Called when a download handler or a process_request()
        # (from other downloader middleware) raises an exception.

        # Must either:
        # - return None: continue processing this exception
        # - return a Response object: stops process_exception() chain
        # - return a Request object: stops process_exception() chain
        
        # 设置代理ip
        # request.meta['proxy'] = 'http://Agent_Adress'
        # return request
```

#### items.py

```python
# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy


class Project3Item(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    name = scrapy.Field()
    rate = scrapy.Field()
    comment_num = scrapy.Field()

```

#### spider3.py

{% note success %}

仔细体会如何<mark>深层次爬取网页（网页中的网页...的内容）</mark>以及如何<mark>换页（换URL）爬取内容</mark>的。

{% endnote %}

```python
import scrapy
from project3.items import Project3Item

class Spider3Spider(scrapy.Spider):
    name = 'spider3'
    #allowed_domains = ['https://book.douban.com']
    # 首先parse解析start_urls里的全部url。这里只有一个第一页的URL
    start_urls = ['https://book.douban.com/tag/%E5%B0%8F%E8%AF%B4?start=0&type=T']

    # 自定义的url模板，根据需要自行scrapy.Request()进行发送请求。用于生成第二页及以后页面的URL。
    url_format = 'https://book.douban.com/tag/%E5%B0%8F%E8%AF%B4?start={:d}&type=T'
    start = 20

    def parse_detail(self, response):
        # 取出上一级传过来的item
        item = response.meta["item"]
        # 进一步封装数据
        item["comment_num"] = response.xpath('//*[@id="interest_sectl"]/div/div[2]/div/div[2]/span/a/span/text()').extract_first()
        # yield将item交给管道进行处理
        yield item

    def parse(self, response):
        li_list = response.xpath('//*[@id="subject_list"]/ul/li')
        # 循环处理每一项
        for li in li_list:
            # 每一项产生一个item
            item = Project3Item()
            # 获取数据并将数据封装到item中
            item["name"] = li.xpath('./div[2]/h2/a/@title').extract_first()
            item["rate"] = li.xpath('./div[2]/div[2]/span[2]/text()').extract_first()
            detail_url = li.xpath('./div[2]/h2/a/@href').extract_first()
            # 请求详情页，回调给parse_detail函数进行处理，并将item传过去
            yield scrapy.Request(detail_url, callback=self.parse_detail, meta={"item": item})

        # 爬取3页的数据
        if self.start <= 40:
            next_url = self.url_format.format(self.start)
            self.start += 20

            # 请求下一页
            yield scrapy.Request(next_url, callback=self.parse)

```

#### piplines.py

```python
# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html


# useful for handling different item types with a single interface
from itemadapter import ItemAdapter


class Project3Pipeline:
    def process_item(self, item, spider):
        print("名称：{}，评分：{}，评分人数：{}".format(item["name"], item["rate"], item["comment_num"]))
        return item

```

最后爬取的每条数据格式如下：

名称：夜晚的潜水艇，评分：8.4，评分人数：15926