---
title: CUDA与cuDNN
date: 2021-04-16 10:38:20
categories:
- [编程, 环境配置]
tags: 
- CUDA
- cuDNN
---

## 介绍

**CUDA:** NVIDIA® CUDA® 工具包提供了<mark>开发环境</mark>，可供<mark>创建经 GPU 加速的高性能应用</mark>。借助 CUDA 工具包，您可以在经 GPU 加速的嵌入式系统、台式工作站、企业数据中心、基于云的平台和 HPC 超级计算机中开发、优化和部署应用。

**cuDNN:** NVIDIA® CUDA® Deep Neural Network library™ (cuDNN) is a <mark>GPU-accelerated library</mark> of primitives for deep neural networks. It provides <mark>highly tuned implementations</mark> of <mark>routines arising frequently</mark> in DNN applications.

安装这两样之后会自动拥有**NVIDIA® Nsight™ Compute：** It is an <mark>interactive kernel profiler</mark> for CUDA applications. It provides <mark>detailed performance metrics and API debugging</mark> via a user interface and command line tool. In addition, its baseline feature allows users to compare results within the tool. Nsight Compute provides a customizable and data-driven user interface and metric collection and can be extended with analysis scripts for post-processing results.

## 安装

Pytorch官网上目前最新配套配置：

**Pytorch1.8**: https://pytorch.org/get-started/locally/

**CUDA11.1**: https://developer.nvidia.com/zh-cn/cuda-downloads

**cuDNN8.04**: https://developer.nvidia.com/rdp/cudnn-archive

### CUDA和cuDNN配置步骤

{% gallery %}

![1](https://raw.githubusercontent.com/safeanimal/PicGo/main/img/1.png)

![2](https://raw.githubusercontent.com/safeanimal/PicGo/main/img/2.png)

![3](https://raw.githubusercontent.com/safeanimal/PicGo/main/img/3.png)

![4](https://raw.githubusercontent.com/safeanimal/PicGo/main/img/4.png)

![5](https://raw.githubusercontent.com/safeanimal/PicGo/main/img/5.png)

![6](https://raw.githubusercontent.com/safeanimal/PicGo/main/img/6.png)

{% endgallery %}

<mark>上面CUDA安装中若当前版本比要求的低需要装它提供最新的版本！！否则可能不能正常使用！！</mark>

最后一步环境变量：

`C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.1\bin`

`C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.1\include`

`C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.1\lib`

`C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.1\libnvvp`

> 参考博客：https://blog.csdn.net/shuiyixin/article/details/99935799?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-2.nonecase&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-2.nonecase