---
title: Anaconda安装TensorFlow
date: 2021-04-02 22:10:27
tags: 环境配置
---

## 安装Anacoda

[Anacoda官网]: https://www.anaconda.com/

![Anaconda官网](img1/1.png)

安装时勾上添加<mark>PATH路径</mark> 和<mark>默认Python的解释器</mark>

安装完成后在PowerShell中输入``conda list``如果显示所有安装的包则安装成功。

## 创建虚拟环境

**虚拟环境：**在虚拟环境中安装各种依赖包可以<mark>隔离系统环境</mark>，防止系统环境被扰乱。<mark>不同的虚拟环境安装不同的一组包</mark>，通过在不同的虚拟环境中运行程序来使用不同的包。

查看已创建环境：`conda info -e`

创建环境：``conda create -n env_name``

删除环境：`conda remove -n env_name --all`

Cmd中激活环境：

``activate env_name``

PowerShell中激活环境需要先执行命令：

``conda install -n root -c pscondaenvs pscondaenvs``

``Set-ExecutionPolicy RemoteSigned``

之后每一次激活只需要：

``activate env_name``

退出环境：

`deactivate`

## 安装与卸载包

在目的虚拟环境中（激活后）：

`conda install package_name`

`conda uninstall package_name`

<mark>不懂的命令一定要查看命令帮助！</mark>

## 安装TensorFlow

这里安装TensorFlow的GPU2.0版本。

<mark>在虚拟环境中</mark>：

``conda install tensorflow-gpu=2.0``

完成后在python解释器中测试（自己创建了一个使用TensorFlow的环境==tf==）：

```python
>>> import tensorflow as tf
2021-04-02 19:50:42.214837: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library cudart64_100.dll
>>> tf.__version__
'2.0.0'
>>> tf.test.is_gpu_available()
2021-04-02 19:51:42.577220: I tensorflow/core/platform/cpu_feature_guard.cc:142] Your CPU supports instructions that this TensorFlow binary was not compiled to use: AVX AVX2
2021-04-02 19:51:42.939544: I tensorflow/stream_executor/platform/default/dso_loader.cc:44] Successfully opened dynamic library nvcuda.dll
2021-04-02 19:51:43.014793: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1618] Found device 0 with properties:
name: GeForce GTX 1050 Ti major: 6 minor: 1 memoryClockRate(GHz): 1.62
pciBusID: 0000:01:00.0
2021-04-02 19:51:43.024101: I tensorflow/stream_executor/platform/default/dlopen_checker_stub.cc:25] GPU libraries are statically linked, skip dlopen check.
2021-04-02 19:51:43.029330: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1746] Adding visible gpu devices: 0
2021-04-02 19:51:43.774476: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1159] Device interconnect StreamExecutor with strength 1 edge matrix:
2021-04-02 19:51:43.776960: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1165]      0
2021-04-02 19:51:43.778307: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1178] 0:   N
2021-04-02 19:51:43.780154: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1304] Created TensorFlow device (/device:GPU:0 with 2998 MB memory) -> physical GPU (device: 0, name: GeForce GTX 1050 Ti, pci bus id: 0000:01:00.0, compute capability: 6.1)
True
```

若虚拟环境中有要使用的包会<mark>先使用虚拟环境的包</mark>，否则会使用系统环境的包。

## 安装IPython和Jupyter notebook

在目的虚拟环境中：

``conda install ipython``

启动：``ipython``

``conda install jupyter notebook``

启动：``jupyter notebook``

在Jupyter notebook中随意切换环境：https://blog.csdn.net/it_xiao_bai/article/details/102765922。<mark>设置好后，在系统环境打开jupyter notebook才可以切换环境！</mark>