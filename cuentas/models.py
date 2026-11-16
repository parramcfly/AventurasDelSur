from django.db import models
from django.contrib.auth.models import User


class Perfil(models.Model):

    ROLES = [
        ('admin', 'Administrador'),
        ('guia', 'Guia / Operador'),
        ('turista', 'Turista / Cliente'),
    ]

    usuario = models.OneToOneField(
        User,
        on_delete=models.CASCADE
    )

    rol = models.CharField(
        max_length=20,
        choices=ROLES,
        default='turista'
    )

    def __str__(self):
        return self.usuario.username

# Create your models here.
