---
title: Python爬虫-scrapy反爬策略
date: 2021-05-02 11:30:22
categories:
- [编程, Python, 爬虫]
tags:
- scrapy
---

### UA伪装和Cookie设置

1. 在`DownloaderMiddleware`的`process_request`中设置`request.headers['User-Agent']`和`request.cookies`
2. 在`setting.py`中设置

### 代理IP设置

1. 在`DownloaderMiddleware`的`process_request`和`process_exception`中设置`request.meta['proxy']`。
2. 在`setting.py`中设置

### Download时延

{% note info %}

对目标网站的爬取速度不应太快，否则很容易被封IP。所以要设置时延。

{% endnote %}

1. `settings.py`中设置`DOWNLOAD_DELAY`（运行时默认使用0.5*DOWNLOAD_DELAY到1.5*DOWNLOAD_DELAY之间的值）。并开启`AUTOTHROTTLE_ENABLED`根据网站负载动态调整下载速度。



> **AutoThrottle extension Design goals**:
>
> 1. be nicer to sites instead of using default download delay of zero
> 2. **automatically adjust Scrapy to the optimum crawling speed**, so the user doesn’t have to tune the download delays to find the optimum one. The user only needs to specify the maximum concurrent requests it allows, and the extension does the rest.