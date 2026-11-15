from django.urls import path
from . import views

urlpatterns = [
    path('login/', views.iniciar_sesion, name='login'),
    path('logout/', views.cerrar_sesion, name='logout'),

    path('admin-panel/', views.panel_admin, name='panel_admin'),
    path('guia-panel/', views.panel_guia, name='panel_guia'),
    path('turista-panel/', views.panel_turista, name='panel_turista'),
]
