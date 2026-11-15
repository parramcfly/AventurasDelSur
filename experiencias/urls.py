from django.urls import path
from . import views

urlpatterns = [
    # Categorias
    path('categorias/', views.listar_categorias, name='listar_categorias'),
    path('categorias/crear/', views.crear_categoria, name='crear_categoria'),
    path('categorias/editar/<int:id>/', views.editar_categoria, name='editar_categoria'),
    path('categorias/eliminar/<int:id>/', views.eliminar_categoria, name='eliminar_categoria'),

    # Experiencias
    path('', views.listar_experiencias, name='listar_experiencias'),
    path('crear/', views.crear_experiencia, name='crear_experiencia'),
    path('editar/<int:id>/', views.editar_experiencia, name='editar_experiencia'),
    path('eliminar/<int:id>/', views.eliminar_experiencia, name='eliminar_experiencia'),

    #Inscripciones
    path('inscripciones/', views.listar_inscripciones, name='listar_inscripciones'),
    path('inscribirse/<int:id>/', views.inscribirse, name='inscribirse'),
    path('inscripciones/confirmar/<int:id>/', views.confirmar_pago, name='confirmar_pago'),
]

