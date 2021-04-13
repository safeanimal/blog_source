---
title: Python爬虫-数据解析-正则方法
date: 2021-04-13 09:52:32
categories:
- [编程, Python, 爬虫]
tags: 爬虫

---

**目标**：从当当网的图书排行榜中，爬取全部25页的图书名。

> 技巧：
>
> + 通过翻页查看网页URL变化，推断<mark>页数和URL的关系</mark>。
> + 通过所要爬取内容<mark>周围HTML文本</mark>的特点，写正则表达式提取特定内容。

> 使用正则表达式需要引入`re`模块

```python
import requests
import re

"""
<div class="name"><a href="http://product.dangdang.com/29168581.html" target="_blank" title="医路向前巍子给中国人的救护指南">医路向前巍子给中国人的救护指南</a></div>
"""
if __name__ == "__main__":
    url = "http://bang.dangdang.com/books/bestsellers/01.00.00.00.00.00-recent30-0-0-1-{:d}"
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36"
    }

    # 定义正则表达式
    ex = '<div class="name">.*?target="_blank".*?>(.*?)<'
    # 总页号
    page_num = 25
    # 存储所有图书名的列表
    top_book_names = []
    # 循环处理所有页面
    for i in range(1, page_num + 1):
        # 生成页面URL
        url_temp = url.format(i)
        page_text = requests.get(url=url_temp, headers=headers).text
        # 用ex定义的模式在page_text中进行匹配，re.S先不求甚解。返回一个列表
        book_names_temp = re.findall(ex, page_text, re.S)
        top_book_names.extend(book_names_temp)
        print("爬取第{:d}页成功".format(i), book_names_temp)

    with open('output/top_book_names.txt', 'at', encoding='utf-8') as file:
        for i in range(len(top_book_names)):
            file.write(str(i + 1) + '. ' + top_book_names[i] + '\n')
```

