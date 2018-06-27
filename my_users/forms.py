# !/usr/bin/env python 
# -*- coding:utf-8 -*-
__author__ = '_X.xx_'
__date__ = '2018/6/22 17:48'


from django import forms
from .models import UserProfile


class LoginForm(forms.Form):
    username = forms.CharField(required=True)
    password = forms.CharField(min_length=6, required=True)


class RegisterForm(forms.Form):
    email = forms.EmailField(required=True)
    mobile = forms.CharField(min_length=11, required=True)
    password = forms.CharField(min_length=6, required=True)


class UploadImageForm(forms.ModelForm):
    """
        处理用户上传头像
    """
    class Meta:
        model = UserProfile
        fields = ['image']


class ModifyPwdForm(forms.Form):
    """
        用户修改密码
    """
    password1 = forms.CharField(required=True, min_length=5)
    password2 = forms.CharField(required=True, min_length=5)


class UserInfoForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['nick_name', 'profession', 'gender',  'address', 'mobile']