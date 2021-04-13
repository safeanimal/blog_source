---
title: Python爬虫-数据解析-xpath
date: 2021-04-13 21:00:12
categories:
- [编程, Python, 爬虫]
tags: 爬虫

---

## 准备

**xpath语法**：https://www.w3school.com.cn/xpath/xpath_syntax.asp

**预安装**：`lxml模块`

**目标**：爬取豆瓣里某本书的若干页评论信息，并将评论信息存储为json文件。

**JSON格式**：

```json
{
	"userID":"rivocky",
	"itemID":"1",
	"rate":"4",
	"comment":"我读加缪第一本书，上来他就讨论自杀，让我觉得不是很high，然而在我看过了第二本，反与正之后，我改变了对他的看法——是要怀着对世界多大的爱才能勇敢的讨论这个问题，加缪是一个从心底到表面都善良的货",
	"timestamp":"2015-09-24"
}
```

## 实例 

> 引入并以HTML文本生成etree，使用etree.xpath()方法进行数据解析。etree相当于把HTML文本抽象成一个由若干文本节点组成的树，通过xpath指定目标的路径及属性等内容来锁定目标节点。

```python
import requests
import json
from lxml import html # 用于引入etree

if __name__ == "__main__":
    # etree对象由注入HTML数据而生成，用于数据解析
    etree = html.etree
    # 目标URL
    url = "https://book.douban.com/subject/24257403/comments/?start={:d}&limit=20&status=P&sort=new_score"
    # 用于UA伪装
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36"
    }
    # 设定起始评论编号
    start = 0
    # 设定读取评论的页数
    page_num = 3
    # 设定存储的文件
    file = open('output/comments.json', 'a', encoding="utf-8")
    dic = {
        "all": []
    }
    for i in range(page_num):
        url_temp = url.format(start)
        html = requests.get(url=url_temp, headers=headers).text
        # 此处加载从互联网获取的HTML源码，etree.parse(url)为加载本地HTML文件
        tree = etree.HTML(html)
        # 评论信息藏在li里面，则获取所有指定的li
        li_list = tree.xpath('//li[@class="comment-item"]')
        # 遍历每个li，提取数据
        for li in li_list:
            try:
                # ./表示从当前位置开始，往下一个层级，.//表示从当前位置开始，往下任意层级，/表示往下一个层级，最后的@href表示取属性href的值
                userID = li.xpath('.//span[@class="comment-info"]/a/@href')[0].split('/')[-2]
                # 默认设为1
                itemID = '1'
                # span[@title]表示选取带有属性title的span标签，@class表示取属性class的值
                # 此处返回的属性值为"user-stars allstar40 rating"这种形式
                rate = li.xpath('.//span[@title]/@class')[0].split()[-2][-2]
                # span[@class="short"]表示取属性class值为short所对应的span标签，最后的text()表示取其文本
                comment = li.xpath('.//span[@class="short"]/text()')[0]
                # 原理同上
                date = li.xpath('.//span[@class="comment-time"]/text()')[0]
            except IndexError:
                # 有越界的情况说明有些数据是不存在的，这种情况则跳过
                continue
            else:
                # 将上述数据封装为字典并加入到dic中
                dic["all"].append({
                    "userID": userID,
                    "itemID": itemID,
                    "rate": rate,
                    "comment": comment,
                    "timestamp": date
                })

        start += 20

    # 写数据
    json.dump(dic, fp=file, ensure_ascii=False)
    file.close()
    print("爬虫结束！")

```

