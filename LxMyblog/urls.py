# !/usr/bin/env python
# -*- coding:utf-8 -*-
"""LxMyblog URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Import the include() function: from django.conf.urls import url, include
    3. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import url, include
from django.contrib import admin
from django.views.generic import TemplateView
from django.views.static import serve

from my_users.views import LoginView, RegisterView, LogoutView
from LxMyblog.settings import MEDIA_ROOT
from my_blog.views import IndexView

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url('^$', IndexView.as_view(), name="index"),
    url(r'^blog/', include('my_blog.urls', namespace='index')),
    url(r'^users/', include('my_users.urls', namespace='users')),
    url(r'media/(?P<path>.*)$', serve, {'document_root': MEDIA_ROOT}),
    # url(r'static/(?P<path>.*)$', serve, {'document_root': STATIC_ROOT}),


    # 登录
    url(r'^login/', LoginView.as_view(), name='login'),
    # 退出
    url(r'^logout/', LogoutView.as_view(), name='logout'),
    # 注册
    url(r'^register/', RegisterView.as_view(), name='register'),

]
