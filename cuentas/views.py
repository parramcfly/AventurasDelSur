from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
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
