# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2018-06-24 15:46
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('my_blog', '0004_coursecomments'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='CourseComments',
            new_name='ArticleComments',
        ),
    ]