# Generated by Django 3.2 on 2022-05-13 03:54

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Categoria',
            fields=[
                ('categoria_id', models.AutoField(primary_key=True, serialize=False)),
                ('categoria_nom', models.CharField(max_length=100, verbose_name='nonmbre')),
            ],
        ),
        migrations.CreateModel(
            name='Mesa',
            fields=[
                ('mesa_id', models.AutoField(primary_key=True, serialize=False)),
                ('mesa_nro', models.CharField(max_length=10, verbose_name='Nro Mesa')),
                ('mesa_cap', models.IntegerField(default=0, verbose_name='Capacidad')),
            ],
        ),
        migrations.CreateModel(
            name='Plato',
            fields=[
                ('plato_id', models.AutoField(primary_key=True, serialize=False)),
                ('plato_nom', models.CharField(max_length=200, verbose_name='nombre')),
                ('plato_img', models.CharField(max_length=255)),
                ('plato_pre', models.DecimalField(decimal_places=2, default=0, max_digits=10, verbose_name='precio')),
                ('categoria_id', models.ForeignKey(db_column='categoria_id', on_delete=django.db.models.deletion.RESTRICT, related_name='Platos', to='api.categoria', verbose_name='categoria')),
            ],
        ),
    ]