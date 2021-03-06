#!/bin/bash
message=$1
book="2020-04-12-my-english-book.md"
book_bak="2020-04-12-my-english-book-bak.md"
#更新自己的分支
echo "更新开始！"
cp my-english-book.md ../hxc.github.io/_posts/$book
git add ./
git commit -m "$message"
git push 

echo "更新完成！"
echo "更新博客开始！"

cd ../hxc.github.io/_posts/
cp $book $book_bak

#添加固定的头
echo "---
layout:     post                    # 使用的布局（不需要改）
title:      英语总结              # 标题 
subtitle:   坚持坚持再坚持      #副标题
date:       2020-04-12              # 时间
author:     hxc                      # 作者
header-img:    #这篇文章标题背景图片
catalog: true                       # 是否归档
tags:                               #标签
    - 学习
---" > $book 
#写入内容
cat $book_bak >> $book
#干掉备份文件
rm -f $book_bak
git add ./
git commit -m "$message"
git push origin master
echo "更新博客结束！"
