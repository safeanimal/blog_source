---
title: Python爬虫-scrapy中使用CrawlSpider进行全站数据爬取
date: 2021-05-01 13:41:32
categories:
- [编程, Python, 爬虫]
tags:
- scrapy
---

{% note info %}

目标：爬取豆瓣图书科普分类下的若干页图的书名。

{% endnote %}

**CrawlSpider**：为Spider的一个子类，可以很方便地<mark>提取页面中的链接</mark>并<mark>对请求内容进行解析</mark>。

**使用CrawlSpider**：创建好scrapy工程后，输入`scrapy genspider -t crawl CrawlSpiderName www.xxx.com`。

### 使用CrawlSpider

**前提**：`setting.py`中设置好`LOG_LEVEL`，`ROBOTSTXT_OBEY`，`DOWNLOADER_MIDDLEWARES`，`ITEM_PIPELINES`。

#### 介绍

**LinkExtractor**：**链接提取器**，可以<mark>将start_urls中的页面满足特定正则表达式的链接</mark>提取出来。

**Rules**：**规则解析器**。规则解析器<mark>由链接提取器创建</mark>，可以将链接提取器<mark>提取的链接交给callback指定的解析函数进行解析</mark>。Rules中的<mark>follow参数指定是否进行迭代提取</mark>，也就是是否在LinkExtractor提取出的链接所对应的页面中，继续应用rules进行解析。

> **Rules**:
>
> Which is **a list of** one (or more) [`Rule`](https://docs.scrapy.org/en/latest/topics/spiders.html#scrapy.spiders.Rule)bjects. Each [`Rule`](https://docs.scrapy.org/en/latest/topics/spiders.html#scrapy.spiders.Rule)efines a certain behaviour for crawling the site. Rules objects are described below. **If multiple rules match the same link, the first one will be used**, according to the order they’re defined in this attribute.

{% note danger %}

链接提取器中的正则表达式**只需要匹配链接的部分内容即可**，完整的URL会被scrapy自动拼接上。（因为完整的链接可能包含正则表达式当中的符号，影响匹配规则。）

{% endnote %}

![提取链接位置与细节](https://raw.githubusercontent.com/safeanimal/PicGo/main/img/image-20210501145604997.png)

```python
import scrapy
from scrapy.linkextractors import LinkExtractor
from scrapy.spiders import CrawlSpider, Rule


class Spider4Spider(CrawlSpider):
    name = 'spider4'
    # 注释掉此处表示allow爬取所有URL
    #allowed_domains = ['www.xxx.com']
    # 此处为科普分类的第一页
    start_urls = ['https://book.douban.com/tag/%E7%A7%91%E6%99%AE?start=0&type=T']

    # 第一页中包含其他页的URL。在链接提取器中通过正则表达式进行提取，并交给parse_item对提取到的URL进行数据解析。
    rules = (
        Rule(LinkExtractor(allow='start=[0-9]*&type=T'), callback='parse_item', follow=True),
    )

    # 解析出当前链接对应页面内的所有书的名字
    def parse_item(self, response):
        print(response)
        name_list = response.xpath('//*[@id="subject_list"]/ul/li[2]/div[2]/h2/a/@title').extract()
        print(name_list)

```

结果部分如下：

```python
['疫苗竞赛', '网络是怎样连接的', '大图景', '世界观(原书第2版)', '万物皆数', '苏菲的世界', '人类大瘟疫', '性的进化', '半小时漫画经济学2：
金融危机篇', '公式之美', '自私的基因', '永不停歇的时钟', '看不见的森林', '照护', '暗淡蓝点', '荒诞医学史', '起源：NASA天文学家的万物解答
', '对伪心理学说不', '刑罚的历史', '你看起来好像……我爱你']
['有限与无限的游戏', '史前人类简史', '简单的逻辑学', '寂静的春天', '人性中的善良天使', '万物：创世', '植物知道生命的答案', '哲学·科学·
常识', '[知乎出品]《猫、爱因斯坦和密码学》', '语言学的邀请', '中国鸟类观察手册', '怪奇事物所', '斯坦福抗疲劳法', '认识电影', '昆虫记', '
全球科技通史', '优雅的守卫者', '骨骼之美', '为什么', '你不懂咖啡']
```

