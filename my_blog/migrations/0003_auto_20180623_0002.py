# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2018-06-23 00:02
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('my_blog', '0002_remove_indexarticle_comment'),
    ]

    operations = [
        migrations.AlterField(
            model_name='indexarticle',
            name='classify',
            field=models.CharField(choices=[('rj', '\u65e5\u8bb0'), ('bk', '\u4e2a\u4eba\u64ad\u5ba2'), ('xd', '\u5fc3\u5f97\u7b14\u8bb0')], default='bk', max_length=10, verbose_name='\u6587\u7ae0\u5206\u7c7b'),
        ),
    ]
