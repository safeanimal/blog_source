---
title: Python爬虫-数据解析-bs4
date: 2021-04-13 11:05:22
categories:
- [编程, Python, 爬虫]
tags: 爬虫

---

## 准备

在Pycharm中安装`lxml`和`bs4`模块。

**lxml**：是一个<mark>HTML/XML的解析器</mark>，主要的功能是如何解析和提取 HTML/XML 数据

**bs4**：[Beautiful Soup](http://www.crummy.com/software/BeautifulSoup/) 是一个可以<mark>从HTML或XML文件中提取数据的Python库</mark>.它能够通过你喜欢的转换器实现惯用的文档导航,查找,修改文档的方式.Beautiful Soup会帮你节省数小时甚至数天的工作时间.

## 常用方法

|                 方法                 |                             参数                             |              返回值               |
| :----------------------------------: | :----------------------------------------------------------: | :-------------------------------: |
|     BeautifulSoup(file, 'lxml')      |   file要么为requests回来的HTML文本，要么为本地open后的文件   |              bs对象               |
|                 bs.a                 |                           a为tag名                           |        bs中第一个a标签文本        |
|    bs.find(tagName, class_=None)     |              tagName为HTML标签名，class_为类名               |     符合条件的第一个标签文本      |
|  bs.find_all(tagName, class_=None)   |                             同上                             |      所有指定标签组成的列表       |
| bs.select(".className > tagName li") | 字符串表示一个层级关系，此示例表示类className下的tagName的li标签。单词间>表示下一级，空格表示下面任意级 |    返回所有指定标签组成的列表     |
|            tag_text.text             |                                                              |     标签tag中的包含的所有文本     |
|           tag_text.string            |                                                              |     标签tag下方一级包含的文本     |
|        tag_text["attri_name"]        |                      attri_name为属性名                      | 获取标签tag下属性attri_name的内容 |



## 爬虫示例

**目标**：从豆瓣某本书下爬取100条用户及其评分、评论。

**输出**：JSON

```json
{
	"userID": "50794898",
	"itemID": "300105475",
	"rate": "5",
	"comment": "石黑一雄迄今为止最温柔的一本书。比起电影，更适合改编成戏剧，那些关于太阳位置变幻的段落简直就是天然的舞台灯光提示，虽然故事处理的还是记忆和时间，但橱窗、瀑布、谷仓……又是多好的舞台空间啊。那个喜欢无厘头肥皂情节曾经给BBC投稿过辣鸡广播剧，在《小夜曲》里塞了无数失败短剧案例的文学青年，终于成了真正厉害的剧作大师，无论读几遍，都有被满足到，克拉拉的故事里，就好像尤内斯库的演员演着演着获得了意义，田纳西·威廉斯的角色捱过了最痛苦的时光依然没有陷入绝望，契诃夫挂在墙上的猎枪最后飞出了奔赴未来的白鸽，没有比这更好的了。",
	"timestamp": "2021-03-04"
}
```



```python
import requests
import json
from bs4 import BeautifulSoup

if __name__ == "__main__":
    # start为评论起始编号，limit为评论数
    url = "https://book.douban.com/subject/35315153/comments/?start={:d}&limit=20&status=P&sort=new_score"
    # 用于UA伪装
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36"
    }
    # 设定起始评论编号
    start = 0
    # 设定读取评论的页数
    page_num = 5
    # 设定存储的文件
    file = open('output/comments.json', 'a', encoding= 'utf-8')

    # 循环依次处理页面
    for i in range(page_num):
        print("处理第{:d}页数据".format(i + 1))
        # 爬取该页评论数据
        url_temp = url.format(start)
        page_text = requests.get(url=url_temp, headers=headers).text

        soup = BeautifulSoup(page_text, 'lxml')
        comment_contents_html = soup.select(".comment-content > span")
        user_hrefs_html = soup.select(".comment-info > a")
        rates_and_dates_html = soup.select(".comment-info > span")
        rates_html = rates_and_dates_html[::2]
        dates_html = rates_and_dates_html[1::2]

        # 循环处理每条爬取的评论数据
        for j in range(20):
            userID = user_hrefs_html[j]["href"].split('/')[-2]
            rate = rates_html[j]["class"][1][-2]
            comment = comment_contents_html[j].string
            date = dates_html[j].string
            dic = {
                "userID": userID,
                "itemID": "300105475",
                "rate": rate,
                "comment": comment,
                "timestamp": date,
            }
            json.dump(dic, fp=file, ensure_ascii=False)
        start += 20

    file.close()
    print("爬虫结束！")
```





