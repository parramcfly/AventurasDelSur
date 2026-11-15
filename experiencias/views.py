from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.http import HttpResponseForbidden
from .models import Categoria, Experiencia, Inscripcion
from django.views.decorators.http import require_POST
from cuentas.models import Perfil


def es_administrador(usuario):
    return hasattr(usuario, 'perfil') and usuario.perfil.rol == 'admin'


@login_required
def listar_categorias(request):

    if not es_administrador(request.user):
        return HttpResponseForbidden('No tienes permiso para acceder.')

    categorias = Categoria.objects.all()

    return render(request, 'experiencias/categorias.html', {
        'categorias': categorias
    })


@login_required
def crear_categoria(request):

    if not es_administrador(request.user):
        return HttpResponseForbidden('No tienes permiso para acceder.')

    if request.method == 'POST':

        nombre = request.POST.get('nombre')
        descripcion = request.POST.get('descripcion')
        estado = request.POST.get('estado') == 'on'

        if nombre and descripcion:

            Categoria.objects.create(
                nombre=nombre,
                descripcion=descripcion,
                estado=estado
            )

            messages.success(request, 'Categoria creada correctamente.')
            return redirect('listar_categorias')

    return render(request, 'experiencias/form_categoria.html')


@login_required
def editar_categoria(request, id):

    if not es_administrador(request.user):
        return HttpResponseForbidden('No tienes permiso para acceder.')

    categoria = get_object_or_404(Categoria, id=id)

    if request.method == 'POST':

        categoria.nombre = request.POST.get('nombre')
        categoria.descripcion = request.POST.get('descripcion')
        categoria.estado = request.POST.get('estado') == 'on'

        categoria.save()

        messages.success(request, 'Categoria actualizada correctamente.')
        return redirect('listar_categorias')

    return render(request, 'experiencias/form_categoria.html', {
        'categoria': categoria
    })


@login_required
def eliminar_categoria(request, id):

    if not es_administrador(request.user):
        return HttpResponseForbidden('No tienes permiso para acceder.')

    categoria = get_object_or_404(Categoria, id=id)

    if request.method == 'POST':
        try:
            categoria.delete()
            messages.success(request, 'Categoria eliminada correctamente.')
        except Exception:
            messages.error(
                request,
                'No se puede eliminar porque tiene experiencias asociadas.'
            )

    return redirect('listar_categorias')



def obtener_rol(usuario):
    perfil = Perfil.objects.filter(usuario=usuario).first()

    if perfil:
        return perfil.rol

    return None


@login_required
def listar_experiencias(request):

    rol = obtener_rol(request.user)

    if rol == 'admin':
        experiencias = Experiencia.objects.all()

    elif rol == 'guia':
        experiencias = Experiencia.objects.filter(creador=request.user)

    elif rol == 'turista':
        experiencias = Experiencia.objects.filter(estado='activa')

    else:
        return HttpResponseForbidden('No tienes permiso para acceder.')

    return render(request, 'experiencias/experiencias.html', {
        'experiencias': experiencias,
        'rol': rol
    })


@login_required
def crear_experiencia(request):

    rol = obtener_rol(request.user)

    if rol not in ['admin', 'guia']:
        return HttpResponseForbidden('No tienes permiso para crear experiencias.')

    categorias = Categoria.objects.filter(estado=True)

    if request.method == 'POST':

        try:
            from django.utils.dateparse import parse_datetime
            from django.utils import timezone

            fecha = parse_datetime(request.POST.get('fecha_hora'))

            if fecha and timezone.is_naive(fecha):
                fecha = timezone.make_aware(fecha)

            categoria = get_object_or_404(
                Categoria,
                id=request.POST.get('categoria'),
                estado=True
            )

            if not fecha:
                raise ValueError('Fecha incorrecta')

            Experiencia.objects.create(
                titulo=request.POST.get('titulo'),
                descripcion=request.POST.get('descripcion'),
                precio=request.POST.get('precio'),
                cupo_maximo=request.POST.get('cupo_maximo'),
                fecha_hora=fecha,
                categoria=categoria,
                creador=request.user,
                estado=request.POST.get('estado', 'activa')
            )

            messages.success(request, 'Experiencia creada correctamente.')
            return redirect('listar_experiencias')

        except (ValueError, TypeError):
            messages.error(request, 'Revisa los datos ingresados.')

    return render(request, 'experiencias/form_experiencia.html', {
        'categorias': categorias
    })


@login_required
def editar_experiencia(request, id):

    rol = obtener_rol(request.user)

    if rol not in ['admin', 'guia']:
        return HttpResponseForbidden('No tienes permiso para editar.')

    experiencia = get_object_or_404(Experiencia, id=id)

    if rol == 'guia' and experiencia.creador != request.user:
        return HttpResponseForbidden('No puedes editar experiencias de otros guias.')

    categorias = Categoria.objects.filter(estado=True)

    if request.method == 'POST':

        try:
            from django.utils.dateparse import parse_datetime
            from django.utils import timezone

            fecha = parse_datetime(request.POST.get('fecha_hora'))

            if fecha and timezone.is_naive(fecha):
                fecha = timezone.make_aware(fecha)

            if not fecha:
                raise ValueError('Fecha incorrecta')

            categoria = get_object_or_404(
                Categoria,
                id=request.POST.get('categoria'),
                estado=True
            )

            experiencia.titulo = request.POST.get('titulo')
            experiencia.descripcion = request.POST.get('descripcion')
            experiencia.precio = request.POST.get('precio')
            experiencia.cupo_maximo = request.POST.get('cupo_maximo')
            experiencia.fecha_hora = fecha
            experiencia.categoria = categoria
            experiencia.estado = request.POST.get('estado')

            experiencia.save()

            messages.success(request, 'Experiencia actualizada correctamente.')
            return redirect('listar_experiencias')

        except (ValueError, TypeError):
            messages.error(request, 'Revisa los datos ingresados.')

    return render(request, 'experiencias/form_experiencia.html', {
        'experiencia': experiencia,
        'categorias': categorias
    })


@login_required
def eliminar_experiencia(request, id):

    rol = obtener_rol(request.user)

    if rol != 'admin':
        return HttpResponseForbidden('Solo el administrador puede eliminar experiencias.')

    experiencia = get_object_or_404(Experiencia, id=id)

    if request.method == 'POST':
        experiencia.delete()
        messages.success(request, 'Experiencia eliminada correctamente.')

    return redirect('listar_experiencias')


@login_required
def listar_inscripciones(request):

    rol = obtener_rol(request.user)

    if rol == 'admin':
        inscripciones = Inscripcion.objects.select_related(
            'usuario', 'experiencia'
        ).all()

    elif rol == 'guia':
        inscripciones = Inscripcion.objects.filter(
            experiencia__creador=request.user
        ).select_related('usuario', 'experiencia')

    elif rol == 'turista':
        inscripciones = Inscripcion.objects.filter(
            usuario=request.user
        ).select_related('experiencia')

    else:
        return HttpResponseForbidden('No tienes permiso para acceder.')

    return render(request, 'experiencias/inscripciones.html', {
        'inscripciones': inscripciones,
        'rol': rol
    })


@login_required
@require_POST
def inscribirse(request, id):

    if obtener_rol(request.user) != 'turista':
        return HttpResponseForbidden('Solo los turistas pueden inscribirse.')

    experiencia = get_object_or_404(
        Experiencia,
        id=id,
        estado='activa'
    )

    existe = Inscripcion.objects.filter(
        usuario=request.user,
        experiencia=experiencia
    ).exists()

    if existe:
        messages.warning(request, 'Ya estas inscrito en esta experiencia.')
        return redirect('listar_experiencias')

    inscritos = Inscripcion.objects.filter(
        experiencia=experiencia
    ).count()

    if inscritos >= experiencia.cupo_maximo:
        messages.error(request, 'No quedan cupos disponibles.')
        return redirect('listar_experiencias')

    Inscripcion.objects.create(
        usuario=request.user,
        experiencia=experiencia
    )

    messages.success(request, 'Inscripcion realizada correctamente.')

    return redirect('listar_inscripciones')

@login_required
@require_POST
def confirmar_pago(request, id):

    if obtener_rol(request.user) != 'admin':
        return HttpResponseForbidden('Solo el administrador puede confirmar pagos.')

    inscripcion = get_object_or_404(Inscripcion, id=id)

    inscripcion.estado_pago = 'confirmado'
    inscripcion.save()

    messages.success(request, 'Pago confirmado correctamente.')

    return redirect('listar_inscripciones')

# Create your views here.
