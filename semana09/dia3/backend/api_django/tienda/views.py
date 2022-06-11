from rest_framework.views import APIView
from rest_framework.response import Response

from .models import (
    Categoria,Producto,Cliente
    )
from .serializers import (
        CategoriaSerializer,ProductoSerializer,
        CategoriaProductoSerializer,
        UsuarioSerializer
    )

from django.contrib.auth.models import User

class IndexView(APIView):

    def get(self,request):
        context = {
            'status':True,
            'content':'api django activa'
        }
        return Response(context)

class CategoriaView(APIView):

    def get(self,request):
        dataCategoria = Categoria.objects.all()
        serCategoria = CategoriaSerializer(dataCategoria,many=True)
        context = {
            'status':True,
            'content':serCategoria.data
        }
        return Response(context)

class ProductoView(APIView):

    def get(self,request):
        dataProducto = Producto.objects.all()
        serProducto = ProductoSerializer(dataProducto,many=True)
        context = {
            'status':True,
            'content':serProducto.data
        }
        return Response(context)

class CategoriaProductoView(APIView):

    def get(self,request,categoria_id):
        dataCategoria = Categoria.objects.get(pk=categoria_id)
        serCategoriaProducto = CategoriaProductoSerializer(dataCategoria)
        context = {
            'status':True,
            'content':serCategoriaProducto.data
        }
        return Response(context)

class UsuarioView(APIView):
    
    def get(self,request,usuario_id):
        dataUsuario = User.objects.get(pk=usuario_id)
        serUsuario = UsuarioSerializer(dataUsuario)
        context = {
            'status':True,
            'content':serUsuario.data
        }
        return Response(context)
