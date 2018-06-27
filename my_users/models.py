# !/usr/bin/env python
# -*- coding:utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import AbstractUser


class UserProfile(AbstractUser):
    """
        用户模型
    """
    nick_name = models.CharField(max_length=50, verbose_name=u'昵称')
    profession = models.CharField(max_length=50, verbose_name=u'职业')
    gender = models.CharField(choices=(('male', u'男'), ('female', u'女')),
                              default='female', max_length=6)
    address = models.CharField(max_length=100, default=u'', verbose_name='籍贯')
    mobile = models.CharField(max_length=11, null=True, blank=True, verbose_name=u'手机号')
    image = models.ImageField(upload_to='image/%Y/%m', verbose_name=u'头像',
                              default=u'image/default.png', max_length=100)

    class Meta:
        verbose_name = u'用户表'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.username
