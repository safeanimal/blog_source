---
title: Anaconda安装TensorFlow
date: 2021-04-02 22:10:27
tags: 环境配置
---

## 安装Anacoda

[Anacoda官网]: https://www.anaconda.com/

![image-20210402195459807](Anaconda安装TensorFlow/image-20210402195459807.png)

安装时勾上添加<mark>PATH路径</mark> 和<mark>默认Python的解释器</mark>

安装完成后在PowerShell中输入``conda list``如果显示所有安装的包则安装成功。

## 创建虚拟环境

虚拟环境：在虚拟环境中安装各种依赖包可以隔离系统环境，防止系统环境被扰乱。

``conda create -n env_name``

Cmd中激活环境：

``activate env_name``

PowerShell中激活环境需：

``conda install -n root -c pscondaenvs pscondaenvs``

``Set-ExecutionPolicy RemoteSigned``

``activate env_name``

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

``conda install ipython``

启动：``ipython``

``conda install jupyter notebook``

启动：``jupyter notebook``