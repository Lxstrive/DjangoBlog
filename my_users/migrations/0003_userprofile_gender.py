# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2018-06-24 12:37
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('my_users', '0002_auto_20180623_0002'),
    ]

    operations = [
        migrations.AddField(
            model_name='userprofile',
            name='gender',
            field=models.CharField(choices=[('male', '\u7537'), ('female', '\u5973')], default='female', max_length=6),
        ),
    ]
