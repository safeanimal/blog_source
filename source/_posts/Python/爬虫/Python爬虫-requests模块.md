---
title: Python爬虫-requests模块
date: 2021-04-08 21:09:47
categories:
- [编程, Python, 爬虫]
tags: 爬虫

---

> requests模块参考网站：https://docs.python-requests.org/zh_CN/latest/user/quickstart.html

## 在Pycharm中安装requests模块

<kbd>File</kbd> --> <kbd>Settings</kbd> --> <kbd>Projects:[name]</kbd> --> <kbd>Python Interpreter</kbd> --> 下方<kbd>+</kbd> --> 搜索requests模块并安装

## 实例一

​	**目标**：抓取目标URL的HTML源码。

```python
import requests

if __name__ == '__main__':
    # 1. 指定url
    url = 'https://www.taobao.com'
    # 2. 请求数据
    # 此步返回一个响应对象
    response = requests.get(url)
    # 3. 获取响应数据
    # response.text为响应的字符串数据
    page_text = response.text
    # 4. 存储数据
    with open('output/taobao.html', 'wt', encoding='utf-8') as file:
        file.write(page_text)

    print("爬取数据完成")
```

## 实例二

​	**目标**：实现UA伪装。

> ​	**UA伪装**：一些目标网站会使用==反爬虫机制==，它们根据HTML请求header中的User-Agent内容来判断该请求是否为一个浏览器请求。对于非浏览器请求，目标网站可能将其视为爬虫程序的请求，而阻碍爬虫。这时便需要对User-Agent进行伪装，来顺利爬虫。
>
> ​	**User-Agent值的选取**：打开浏览器-->F12-->网络-->打开一个网页-->选取一个信息包-->找到并复制User-Agent项的内容

```python
import requests

if __name__ == '__main__':
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36"
    }
    url = 'https://www.sogou.com/web'

    keyword = input("输入要查询的关键字：")
    params = {
        'query': keyword
    }
    # url中携带参数，并指定header
    # https://cn.bing.com/search?q=python（q=python表示关键字为python）
    response = requests.get(url=url, params=params, headers=headers)

    page_text = response.text

    filename = 'output/' + keyword + '.html'
    with open(filename, 'w', encoding='utf-8') as file:
        file.write(page_text)

    print("爬取数据完成！")

```

## 实例三

​	**目标**：使用爬虫获取百度翻译的数据。

> ​	**百度翻译页面**：https://fanyi.baidu.com
> ​	**Ajax**：在浏览器与 Web 服务器之间使用异步数据传输（HTTP 请求），这样就可使网页从服务器请求少量的信息，而不是整个页面。在其页面翻译一个单词时，会出现网页的局部刷新，则判定使用了Ajax技术。

1. 打开浏览器控制台-->打开网络选项卡-->点击XHR。

2. 输入一个单词，例如dog，则可以发现有数据包为POST请求，请求url在其中，且请求表单数据参数内容为dog，则可判定该数据包为要模拟发送的数据包。
3. 在该数据包中，可从响应头中看到content-type，在响应选项中可看到具体响应内容，至此可根据响应数据类型来决定如何存储该数据。

```python
import requests
import json

if __name__ == "__main__":
    post_url = "https://fanyi.baidu.com/sug"
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36"
    }
    keyword = input("输入你想翻译的句子或单词：")

    # POST请求的表单数据参数为kw
    data = {
        "kw": keyword
    }
    # UA伪装后向指定url发送POST请求，并携带参数data
    response = requests.post(url=post_url, data=data, headers=headers)
    # 获取响应的json数据
    json_dic = response.json()

    filename = 'output/translation.json'
    with open(filename, 'w', encoding='utf-8') as file:
        # 保存json数据，汉字不可使用ASCII编码
        json.dump(json_dic, fp=file, ensure_ascii=False)


    print("爬虫结束！")
```

## 实例四

​	**目标**：爬取豆瓣top-100电影。

> ​	发现高分电影的加载使用的是Ajax技术，则可以从控制台XHR中找到高分电影的数据包。
>
> 从数据包中可知：
>     **目标url**：https://movie.douban.com/j/search_subjects?type=movie&tag=%E8%B1%86%E7%93%A3%E9%AB%98%E5%88%86&sort=rank&page_limit=20&page_start=20，其中?后面为参数，
>     **请求方法**：GET
>     **content-type**：json
>     **查询字符串参数**：
>         type: movie
>         tag: 豆瓣高分
>         sort: rank
>         page_limit: 20
>         page_start: 20

```python
import requests
import json

if __name__ == "__main__":
    url = "https://movie.douban.com/j/search_subjects"
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36"
    }

    params = {
        "type": "movie",
        "tag": "豆瓣高分",
        "sort": "rank",
        "page_limit": "100",
        "page_start": "0"
    }

    response = requests.get(url=url,params=params, headers=headers)
    json_dic = response.json()

    filename = 'output/douban-movie-top100.json'
    with open(filename, 'w', encoding='utf-8') as file:
        # 保存json数据，汉字不可使用ASCII编码
        json.dump(json_dic, fp=file, ensure_ascii=False)


    print("爬虫结束！")
```

## 实例五

​	**目标**：给定图片URL，爬取并存储该图片。

```python
import requests

if __name__ == "__main__":
    img_url = "https://w.wallhaven.cc/full/pk/wallhaven-pkkm6p.png"
    # content属性为响应对象的二进制型数据
    img_binary = requests.get(url=img_url).content

    # wb表示写+二进制，表示写入二进制数据
    with open('output/example.png', 'wb') as file:
        file.write(img_binary)

    print("爬取图片结束！")

```

