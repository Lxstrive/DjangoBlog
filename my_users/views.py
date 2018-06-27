# !/usr/bin/env python
# -*- coding:utf-8 -*-
import json

from django.core.urlresolvers import reverse
from django.shortcuts import render
from django.http import HttpResponseRedirect, HttpResponse
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.views.generic import View
from django.contrib.auth.hashers import make_password
from .forms import LoginForm, RegisterForm, UploadImageForm, ModifyPwdForm, \
    UserInfoForm
from utils.mixin_utils import LoginRequiredMixin

from .models import UserProfile


class CustomBackend(ModelBackend):
    """
        自定义登录类型
    """

    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(
                Q(username=username) | Q(email=username) | Q(mobile=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


class RegisterView(View):
    """
        注册功能
    """

    def get(self, request):
        return render(request, 'users_lg/register.html')

    def post(self, request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            user_name = request.POST.get('username', '')
            email = request.POST.get('email', '')
            password = request.POST.get('password', '')
            mobile = request.POST.get('mobile', '')
            user_profile = UserProfile()
            if UserProfile.objects.filter(
                    Q(username=user_name) | Q(mobile=mobile)):
                return render(request, 'users_lg/register.html', {
                    'msg': '用户名或手机号已存在',

                })

            user_profile.username = user_name
            user_profile.email = email
            user_profile.password = make_password(password)
            user_profile.mobile = mobile
            user_profile.save()
            return HttpResponseRedirect(reverse('login'))
        else:
            return render(request, 'users_lg/register.html', {
                'register_form': register_form
            })


class LoginView(View):
    """
        登录功能
    """

    def get(self, request):
        return render(request, 'users_lg/user_login.html')

    def post(self, request):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            user_name = request.POST.get('username', '')
            pass_word = request.POST.get('password', '')
            user = authenticate(username=user_name, password=pass_word)
            if user is not None:
                login(request, user)
                return HttpResponseRedirect(reverse('index'))
            else:
                return render(request, 'users_lg/user_login.html', {
                    'msg': '用户名或密码错误'
                })

        else:
            return render(request, 'users_lg/user_login.html', {
                'msg': '输入有误 请重新输入',
                'login_form': login_form
            })


class LogoutView(View):
    """
        退出功能
    """

    def get(self, request):
        logout(request)
        return HttpResponseRedirect(reverse('index'))


class UserInfoView(View):
    """
        用户修改资料
    """

    def get(self, request):
        return render(request, 'usercenter-info.html')


class UploadImageView(LoginRequiredMixin, View):
    """
        用户修改头像
    """

    def post(self, request):
        image_form = UploadImageForm(request.POST, request.FILES,
                                     instance=request.user)
        if image_form.is_valid():
            image_form.save()
            return HttpResponse('{"status":"success"}',
                                content_type='application/json')
        else:
            return HttpResponse('{"status":"fail"}',
                                content_type='application/json')


class UpdatePwdView(LoginRequiredMixin, View):
    """
        用户修改密码
    """

    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get('password1', '')
            pwd2 = request.POST.get('password2', '')
            if pwd1 != pwd2:
                return HttpResponse('{"status":"fail", "msg": "密码不一致"}',
                                    content_type='application/json')
            user = request.user
            user.password = make_password(pwd2)
            user.save()

            return HttpResponse('{"status":"success"}',
                                content_type='application/json')
        else:
            return HttpResponse(json.dumps(modify_form.errors),
                                content_type='application/json')


class UserinfoView(LoginRequiredMixin, View):
    """
    用户个人信息
    """

    def get(self, request):
        return render(request, 'usercenter-info.html', {})

    def post(self, request):
        user_info_form = UserInfoForm(request.POST, instance=request.user)
        if user_info_form.is_valid():
            user_info_form.save()
            return render(request, 'usercenter-info.html', {
                'msg': '修改成功'
            })
        else:
            return render(request, 'usercenter-info.html', {
                'user_info_form': user_info_form
            })
