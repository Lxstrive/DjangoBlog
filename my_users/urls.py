# !/usr/bin/env python 
# -*- coding:utf-8 -*-
__author__ = '_X.xx_'
__date__ = '2018/6/21 23:07'

from django.conf.urls import url
from .views import UserInfoView, UploadImageView, UpdatePwdView, UserinfoView

urlpatterns = [
    # 用户个人资料页
    url(r'^info/$', UserInfoView.as_view(), name='user_info'),
    # 用户修改头像
    url(r'^image/up_load$', UploadImageView.as_view(), name='up_load'),
    # 用户修改密码
    url(r'^update/pwd/$', UpdatePwdView.as_view(), name='update_pwd'),
    # 用户修改资料
    url(r'^update/user_info/$', UserinfoView.as_view(), name='user_info'),
]