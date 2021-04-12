# 自动部署使用方法

## 快速开始

`git remote -v`查看远程仓库对不对，这里应该传到github上的blog_source仓库

在对源文件做出更改后（新博客、改主题设置等）后

`git add .`

`git commit -m "这里是注释"`

这时github上的github actions程序已经开始自动deploy了！

**要是搞砸了什么东西要记得版本回退！**

## Github上仓库配置说明

blog_source：存放整个Hexo博客的源码

safeanimal.github.io：存放Hexo生成的静态网页文件，平时不要动它，这里的内容由blog_source+Github Actions的Deploy程序自动更新。

## 自动Deploy设置

根据Hexo博客自动部署项目hexo-action的步骤，对Github Actions进行配置

[sma11black/hexo-action: Hexo CI/CD Action for automating deployment. (github.com)](https://github.com/sma11black/hexo-action)

> + 此步骤中需要生成新的SSH公钥和私钥，需要在cmd中运行`ssh-keygen -t rsa -C "emailname@example.com"`，==之后不要配置密码！！==
> + 生成私钥和公钥后，用记事本打开，必须复制其==全部内容==！！