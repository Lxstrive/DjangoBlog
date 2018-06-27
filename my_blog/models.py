# !/usr/bin/env python
# -*- coding:utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from datetime import datetime
from my_users.models import UserProfile


class IndexArticle(models.Model):
    """
        首页文章模型
    """
    name = models.ForeignKey(UserProfile, verbose_name=u'用户名')
    title = models.CharField(max_length=20, verbose_name=u'文章标题')
    content = models.TextField(verbose_name=u'文章内容')
    image = models.ImageField(upload_to='article/%Y/%m', max_length=100,
                              verbose_name=u'文章图片')
    url = models.URLField(max_length=200, verbose_name=u'访问地址')
    author = models.CharField(max_length=20, verbose_name=u'文章作者')
    classify = models.CharField(max_length=10, verbose_name=u'文章分类', choices=(
        ('rj', u'日记'), ('bk', u'个人播客'), ('xd', u'心得笔记')), default='bk')
    click_num = models.IntegerField(default=0, verbose_name=u'浏览量')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'首页文章'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.title


class ArticleComments(models.Model):
    """
        文章评论
    """

    user = models.ForeignKey(UserProfile, verbose_name=u'用户')
    article = models.ForeignKey(IndexArticle, verbose_name=u'文章')
    comments = models.CharField(max_length=200, verbose_name=u'评论')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'文章评论'
        verbose_name_plural = verbose_name


class ReadArticle(models.Model):
    """
        阅读书籍
    """
    title = models.CharField(max_length=20, verbose_name=u'文章标题')
    content = models.TextField(verbose_name=u'文章内容')
    image = models.ImageField(upload_to='article/%Y/%m', max_length=100,
                              verbose_name=u'文章图片')
    url = models.URLField(max_length=200, verbose_name=u'访问地址')
    author = models.CharField(max_length=20, verbose_name=u'文章作者')
    classify = models.CharField(max_length=10, verbose_name=u'文章分类', choices=(
        ('rj', u'日记'), ('xs', u'欣赏'), ('cx', u'程序人生'), ('jd', u'经典语录'),),
                                default='xs')
    click_num = models.IntegerField(default=0, verbose_name=u'浏览量')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'阅读书籍'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.title
