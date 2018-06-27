# !/usr/bin/env python
# -*- coding:utf-8 -*-
from django.contrib import admin

from .models import UserProfile
from my_blog.models import IndexArticle


class UserProfileAdmin(admin.ModelAdmin):
    """
        把用户模型注册到后台管理
    """
    list_display = ['username', 'nick_name', 'profession', 'address', 'mobile',
                    'image']
    search_fields = ['nick_name', 'profession', 'address', 'mobile']
    list_filter = ['nick_name', 'profession', 'address', 'mobile', 'image']


class IndexArticleAdmin(admin.ModelAdmin):
    """
         把首页文章模型注册到后台管理
    """
    list_display = ['name', 'title', 'content', 'author',
                    'add_time', 'classify']
    search_fields = ['name', 'title', 'content', 'image', 'url', 'author']

    list_filter = ['name', 'title', 'content', 'image', 'url', 'author', 'add_time']


admin.site.register(IndexArticle, IndexArticleAdmin)
admin.site.register(UserProfile, UserProfileAdmin)
