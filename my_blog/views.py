# !/usr/bin/env python
# -*- coding:utf-8 -*-

from django.shortcuts import render
from django.views.generic import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from .models import IndexArticle, ArticleComments, ReadArticle
from django.http import HttpResponse
from utils.mixin_utils import LoginRequiredMixin
from my_users.models import UserProfile


class IndexView(View):
    """
        首页文章
    """

    def get(self, request):
        # 取出首页文章
        articles_index = IndexArticle.objects.all()
        # 根据添加时间排序
        article_news = IndexArticle.objects.all().order_by('add_time')[:10]
        # 根据点击量排序
        article_clicks = IndexArticle.objects.all().order_by('-click_num')[:10]
        # 分类显示文章
        bj_articles = request.GET.get('ct', '')
        if bj_articles:
            articles_index = articles_index.filter(classify=bj_articles)
        # 对文章进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(articles_index, 2, request=request)
        articles = p.page(page)

        # 对文章数统计
        article_num = articles_index.count()
        return render(request, 'my_blog/index.html', {
            'articles_index': articles,
            'article_news': article_news,
            'article_clicks': article_clicks,
            'bj_articles': bj_articles,
            'article_num': article_num
        })


class AboutView(View):
    """
        关于我
    """

    def get(self, request):
        return render(request, 'my_blog/about.html')


class ProjectView(View):
    """
        项目简介
    """

    def get(self, request):
        all_read = ReadArticle.objects.all()
        click_read = ReadArticle.objects.all().order_by('-click_num')
        # 分类显示文章
        fl_articles = request.GET.get('ct', '')
        if fl_articles:
            all_read = all_read.filter(classify=fl_articles)
        # 对文章进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_read, 3, request=request)
        reads = p.page(page)
        return render(request, 'my_blog/newlist.html', {
            'all_read': reads,
            'classify': fl_articles,
            'click_read': click_read

        })


class TemplateView(View):
    """
        显示页
    """
    def get(self, request):
        return render(request, 'my_blog/share.html')


class ProjectDetailView(View):
    """
        详情页
    """
    def get(self, request, project_id):
        all_reads = ReadArticle.objects.get(id=int(project_id))
        all_reads.click_num += 1
        all_reads.save()
        return render(request, 'my_blog/project.html', {
            'all_reads': all_reads
        })


class ArticleView(View):
    """
        浏览量点击自增
    """

    def get(self, request, article_id):
        articles = IndexArticle.objects.get(id=int(article_id))
        # 点击量自增
        articles.click_num += 1
        articles.save()
        all_comments = ArticleComments.objects.filter(article_id=articles).order_by('-add_time')
        # 根据评论时间排序
        new_comments = ArticleComments.objects.filter(
            article_id=articles).order_by('-add_time')[:6]
        # 取出访客用户
        all_user = UserProfile.objects.all()
        # 对文章进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_comments, 3, request=request)
        comment_page = p.page(page)
        return render(request, 'my_blog/detail.html', {
            'articles': articles,
            'all_comments': comment_page,
            'new_comments': new_comments,
            'all_user': all_user
        })


class AddCommentsView(LoginRequiredMixin, View):
    """
        添加文章评论
    """

    def post(self, request, article_id):
        if not request.user.is_authenticated():
            # 判断用户登录状态
            return HttpResponse('{"status":"fail", "msg":"用户未登录"}',
                                content_type='application/json')

        comments = request.POST.get('comments', '')
        if comments:
            article_comments = ArticleComments()
            article = IndexArticle.objects.get(id=int(article_id))
            article_comments.article = article
            article_comments.comments = comments
            article_comments.user = request.user
            article_comments.save()
            return HttpResponse('{"status":"success", "msg":"添加成功"}',
                                content_type='application/json')
        else:
            return HttpResponse('{"status":"fail", "msg":"添加失败"}',
                                content_type='application/json')


