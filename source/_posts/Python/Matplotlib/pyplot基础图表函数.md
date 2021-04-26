---
title: pyplot基础图表函数
date: 2020-04-26 21:53:47
categories:
- [编程, Python]
tags: Matplotlib

---

# pyplot基础图表函数

| 函数                              | 说明          | 函数                                | 说明       |
| --------------------------------- | ------------- | ----------------------------------- | ---------- |
| plt.plot(x,y,fmt,...)             | 坐标图        | plt.boxplot(data,notch,position)    | 箱图       |
| plt.bar(left,height,width,bottom) | 条形图        | plt.barch(width,bottom,left,height) | 横向条形图 |
| plt.polar(theta,r)                | 极坐标图      | plt.pie(data,explode)               | 饼图       |
| plt.psd(x,NFFT=256,pad_to,Fs)     | 功率谱密度图  | plt.specgram(x,NFFT=256,pad_to,F)   | 谱图       |
| plt.cohere(x,y,NFFT=256,Fs)       | X-Y相关性函数 | plt.scatter(x,y)                    | 散点图     |
| plt.step(x,y,where)               | 步阶图        | plt.hist(x,bins,normed)             | 直方图     |
| plt.contour(X,Y,Z,N)              | 等值图        | plt.vlines()                        | 垂直图     |
| plt.stem(x,y,linefmt,markerfmt)   | 柴火图        | plt.plot_date()                     | 数据日期   |

