from django.db import models
from django.contrib.auth.models import User


class Categoria(models.Model):

    nombre = models.CharField(max_length=100)
    descripcion = models.TextField()
    estado = models.BooleanField(default=True)

    def __str__(self):
        return self.nombre


class Experiencia(models.Model):

    ESTADOS = [
        ('activa', 'Activa'),
        ('inactiva', 'Inactiva'),
    ]

    titulo = models.CharField(max_length=150)
    descripcion = models.TextField()
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    cupo_maximo = models.PositiveIntegerField()
    fecha_hora = models.DateTimeField()

    categoria = models.ForeignKey(
        Categoria,
        on_delete=models.PROTECT
    )

    creador = models.ForeignKey(
        User,
        on_delete=models.CASCADE
    )

    estado = models.CharField(
        max_length=20,
        choices=ESTADOS,
        default='activa'
    )

    def __str__(self):
        return self.titulo


class Inscripcion(models.Model):

    ESTADOS_PAGO = [
        ('pendiente', 'Pendiente'),
        ('confirmado', 'Confirmado'),
    ]

    usuario = models.ForeignKey(
        User,
        on_delete=models.CASCADE
    )

    experiencia = models.ForeignKey(
        Experiencia,
        on_delete=models.CASCADE
    )

    fecha_inscripcion = models.DateTimeField(auto_now_add=True)

    estado_pago = models.CharField(
        max_length=20,
        choices=ESTADOS_PAGO,
        default='pendiente'
    )

    def __str__(self):
        return self.usuario.username + ' - ' + self.experiencia.titulo

# Create your models here.
