# !/usr/bin/env python 
# -*- coding:utf-8 -*-
__author__ = '_X.xx_'
__date__ = '2018/6/21 22:10'

from django.conf.urls import url
from .views import AboutView, ArticleView, AddCommentsView, ProjectView, \
    ProjectDetailView, TemplateView

urlpatterns = [
    # 关于我页面
    url(r'^about$', AboutView.as_view(), name='about'),
    # 图片显示页
    url(r'^template$', TemplateView.as_view(), name='template'),
    # 点击阅读全文跳转页面
    url(r'^detail/(?P<article_id>\d+)/$', ArticleView.as_view(), name='detail'),
    # 添加文章评论
    url(r'^add_comment/(?P<article_id>\d+)$', AddCommentsView.as_view(),
        name="add_comment"),
    # 项目简介
    url(r'^project$', ProjectView.as_view(), name='project'),
    # 点击阅读全文跳转页面
    url(r'^project_detail/(?P<project_id>\d+)/$', ProjectDetailView.as_view(),
        name='project_detail'),

]
