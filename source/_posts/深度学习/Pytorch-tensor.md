---
title: Pytorch-tensor
date: 2021-04-15 10:27:26
categories:
- [编程, 深度学习]
tags: Pytorch
---

## 快速开始

### 创建tensor

```python
import torch
import numpy as np

data = [[1, 2], [3, 4]]
x_data = torch.tensor(data)

np_array = np.array(data)
x_np = torch.from_numpy(np_array)
```

### 创建特殊tensor

```python
import torch

# 返回结果默认保持原数据的类型，可显示指定dtype
x_ones = tensor.ones_like(x_data)
x_rand = tensor.rand_like(x_data, dtype=torch.float)

# 先声明shape
shape (2, 3, )
rand_tensor = torch.rand(shape)
ones_tensor = torch.ones(shape)
zeros_tensor = torch.zeros(shape)

# 直接传入shape
tensor = torch.rand(3, 4)
```

### tensor运算

```python
import torch

torch.cat([tensor1, tensor2, tensor3], dim=1)# 横轴拼接
tensor1 * tensor2 # element-wise相乘
tensor1.mul(tensor2) # element-wise相乘
tensor.T # 转置
tensor1.matmul(tensor2) # 矩阵相乘
tensor.add_(5) #带_的方法都是就地的操作，会更改所操作tensor的值
```

### 切片

```python
tensor = torch.ones(4, 4)
tensor[:,1] = 0 # 第一列置0
```

