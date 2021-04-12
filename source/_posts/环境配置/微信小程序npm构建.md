---
title: 微信小程序npm构建
date: 2020-04-26 11:32:01
tags: 微信小程序

---

`教程基于windows系统`
1.进入nodejs官网下载nodejs：[nodejs官网](http://nodejs.cn/download/)![在这里插入图片描述](https://img-blog.csdnimg.cn/2020041721064050.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70)

2.打开安装包进行安装，我这里默认安装到C:\Program Files\nodejs里

<!--more-->

3.<mark>接下来用管理员权限启动cmd</mark>![在这里插入图片描述](https://img-blog.csdnimg.cn/20200417210900467.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70)

 4.在cmd中执行`npm config set prefix "C:\Program Files\nodejs\node_global"`

5.执行`npm config set cache "C:\Program Files\nodejs\node_cache"`

6.设置环境变量：`我的电脑`——`属性`——`高级系统设置`——`环境变量`——`新建（系统变量下）`——输入变量名`NODE_PATH`->路径`C:\Program Files\nodejs\node_global\node_modules`

7.cmd输入`npm install express -g`

8.在cmd输`node`进入编辑模式，输入`require('express')`检测是否能正常加载模块：
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/20200417214117514.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70)

 9.用cmd转到小程序的目录下`cd C:\Users\SANG\WeChatProjects\miniprogram-8\miniprogram`(根据你自己的小程序`project.config.json`中的`miniprogramRoot`指示的路径来)


10.执行`npm init`，完成之后一直按<kbd>回车</kbd>直到退出，一定要执行完啊！！！
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200417220113513.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70)
11.输入`npm i @vant/weapp -S --production`
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200417214712987.png)
12.上一步结束后，输入`npm init -y`
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200417214823769.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70)
13.打开微信开发者平台，打开`详情`，勾选`使用npm模块`
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200417212710879.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70)

14.在`工具`菜单栏中点击`构建npm`
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200417212851318.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70)
15.这样就大功告成了！
![在这里插入图片描述](https://img-blog.csdnimg.cn/2020041722053894.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNjc3MzE3,size_16,color_FFFFFF,t_70)
一天开发，十天搭环境，巨真实！