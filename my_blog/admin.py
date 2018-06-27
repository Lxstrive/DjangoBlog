# !/usr/bin/env python
# -*- coding:utf-8 -*-
from django.contrib import admin
from .models import ArticleComments, ReadArticle


class ArticleCommentsAdmin(admin.ModelAdmin):
    """
        文章评论
    """
    list_display = ['user', 'article', 'comments', 'add_time']


class ReadArticleAdmin(admin.ModelAdmin):
    """
        文章评论
    """
    list_display = ['title', 'content', 'classify', 'author', 'add_time']


admin.site.register(ArticleComments, ArticleCommentsAdmin)
admin.site.register(ReadArticle, ReadArticleAdmin)
