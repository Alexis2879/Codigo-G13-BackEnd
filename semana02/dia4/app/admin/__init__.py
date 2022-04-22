from flask import Blueprint

admin = Blueprint('admin',__name__,url__prefix='/admin')  

from . import views
