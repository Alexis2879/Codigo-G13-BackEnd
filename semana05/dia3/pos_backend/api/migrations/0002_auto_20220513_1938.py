# Generated by Django 3.2 on 2022-05-14 00:38

import cloudinary.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='categoria',
            name='categoria_nom',
            field=models.CharField(max_length=100, verbose_name='nombre'),
        ),
        migrations.AlterField(
            model_name='plato',
            name='plato_img',
            field=cloudinary.models.CloudinaryField(default='', max_length=255, verbose_name='image'),
        ),
    ]
