---
title: 小程序美化-自定义navigationBar
date: 2022-04-22 9:17:26
categories:
- [编程, 微信小程序]
tags: 微信小程序
---



设页面名为user

## 在页面的user.json配置文件中设置取消navigationBar

![image-20220422092129095](https://raw.githubusercontent.com/safeanimal/PicGo/main/img/image-20220422092129095.png)

## 自定义一个导航栏组件c-navigation-bar

自定义组件看个人情况，但导航栏的高度要在`app.js`进行获取并在`user.js`中使用`const app=getApp()`和`app.globalData.navigationBarHeight`来引用。

```js
/*app.js*/

//单位px
        wx.getSystemInfo().then(res => {
            this.globalData.statusBarHeight = res.statusBarHeight //状态栏高度
            const menuButtonInfo = wx.getMenuButtonBoundingClientRect();//胶囊栏位置信息
            this.globalData.navigationBarHeight = (menuButtonInfo.top - res.statusBarHeight) * 2 + menuButtonInfo.height + res.statusBarHeight; //导航栏高度
        }).catch(err => {
            console.log(err)
        })
```



## 设置组件的样式

先在`app.json`中对组件全局引用，再在`app.wxss`中写样式。

```css
/*app.wxss*/
/*导航栏位置固定*/
c-navigation-bar{
    position: fixed;/*保证位置总是固定不变*/
    z-index: 1;/*保证总是显示在第一层*/
}
```

在`user.wxml`文件中，将`c-navigation-bar`放在最前方。

```html
<!--要设置导航栏的高度，其余内容要往下移动navigationBarHeight px-->
<c-navigation-bar height="{{navigationBarHeight}}"></c-navigation-bar>
<view style="{{'margin-top:'+navigationBarHeight+'px;'}}">
</view>
```

