from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.views.decorators.http import require_POST

from .models import Perfil


def iniciar_sesion(request):

    if request.method == 'POST':

        username = request.POST.get('username')
        password = request.POST.get('password')

        usuario = authenticate(
            request,
            username=username,
            password=password
        )

        if usuario is not None:

            perfil = Perfil.objects.filter(usuario=usuario).first()

            if perfil is not None:

                login(request, usuario)

                if perfil.rol == 'admin':
                    return redirect('panel_admin')

                elif perfil.rol == 'guia':
                    return redirect('panel_guia')

                elif perfil.rol == 'turista':
                    return redirect('panel_turista')

            else:
                messages.error(request, 'El usuario no tiene un perfil asignado.')

        else:
            messages.error(request, 'Usuario o contraseña incorrectos.')

    return render(request, 'cuentas/login.html')


@login_required
def panel_admin(request):

    perfil = Perfil.objects.filter(
        usuario=request.user,
        rol='admin'
    ).first()

    if perfil is None:
        return redirect('login')

    return render(request, 'cuentas/panel_admin.html')


@login_required
def panel_guia(request):

    perfil = Perfil.objects.filter(
        usuario=request.user,
        rol='guia'
    ).first()

    if perfil is None:
        return redirect('login')

    return render(request, 'cuentas/panel_guia.html')


@login_required
def panel_turista(request):

    perfil = Perfil.objects.filter(
        usuario=request.user,
        rol='turista'
    ).first()

    if perfil is None:
        return redirect('login')

    return render(request, 'cuentas/panel_turista.html')


@login_required
def cerrar_sesion(request):

    logout(request)

    return redirect('login')



def es_administrador(usuario):
    return Perfil.objects.filter(
        usuario=usuario,
        rol='admin'
    ).exists()


@login_required
def listar_usuarios(request):

    if not es_administrador(request.user):
        return redirect('login')

    usuarios = User.objects.select_related('perfil').all().order_by('username')

    return render(
        request,
        'cuentas/usuarios/listar.html',
        {'usuarios': usuarios}
    )


@login_required
def crear_usuario(request):

    if not es_administrador(request.user):
        return redirect('login')

    if request.method == 'POST':

        username = request.POST.get('username', '').strip()
        first_name = request.POST.get('first_name', '').strip()
        last_name = request.POST.get('last_name', '').strip()
        email = request.POST.get('email', '').strip()
        password = request.POST.get('password', '')
        rol = request.POST.get('rol', 'turista')

        if not username or not password:
            messages.error(request, 'El usuario y la contraseña son obligatorios.')

        elif User.objects.filter(username=username).exists():
            messages.error(request, 'Ese nombre de usuario ya existe.')

        elif rol not in dict(Perfil.ROLES):
            messages.error(request, 'El rol seleccionado no es válido.')

        else:
            usuario = User.objects.create_user(
                username=username,
                password=password,
                first_name=first_name,
                last_name=last_name,
                email=email
            )

            Perfil.objects.create(
                usuario=usuario,
                rol=rol
            )

            messages.success(request, 'Usuario creado correctamente.')
            return redirect('listar_usuarios')

    return render(request, 'cuentas/usuarios/formulario.html', {
        'accion': 'Crear',
        'roles': Perfil.ROLES
    })


@login_required
def editar_usuario(request, usuario_id):

    if not es_administrador(request.user):
        return redirect('login')

    usuario = get_object_or_404(User, id=usuario_id)
    perfil, creado = Perfil.objects.get_or_create(usuario=usuario)

    if request.method == 'POST':

        username = request.POST.get('username', '').strip()
        first_name = request.POST.get('first_name', '').strip()
        last_name = request.POST.get('last_name', '').strip()
        email = request.POST.get('email', '').strip()
        password = request.POST.get('password', '')
        rol = request.POST.get('rol', 'turista')

        if not username:
            messages.error(request, 'El nombre de usuario es obligatorio.')

        elif User.objects.filter(username=username).exclude(id=usuario.id).exists():
            messages.error(request, 'Ese nombre de usuario ya está ocupado.')

        elif rol not in dict(Perfil.ROLES):
            messages.error(request, 'El rol seleccionado no es válido.')

        elif usuario.id == request.user.id and rol != 'admin':
            messages.error(request, 'No puedes quitarte tu propio rol de administrador.')

        else:
            usuario.username = username
            usuario.first_name = first_name
            usuario.last_name = last_name
            usuario.email = email

            if password:
                usuario.set_password(password)

            usuario.save()

            perfil.rol = rol
            perfil.save()

            messages.success(request, 'Usuario actualizado correctamente.')
            return redirect('listar_usuarios')

    return render(request, 'cuentas/usuarios/formulario.html', {
        'accion': 'Editar',
        'usuario_editado': usuario,
        'perfil': perfil,
        'roles': Perfil.ROLES
    })


@login_required
@require_POST
def eliminar_usuario(request, usuario_id):

    if not es_administrador(request.user):
        return redirect('login')

    usuario = get_object_or_404(User, id=usuario_id)

    if usuario.id == request.user.id:
        messages.error(request, 'No puedes eliminar tu propia cuenta.')
        return redirect('listar_usuarios')

    usuario.delete()

    messages.success(request, 'Usuario eliminado correctamente.')
    return redirect('listar_usuarios')
