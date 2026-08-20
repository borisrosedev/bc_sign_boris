#!/usr/bin/bash


git checkout --orphan dev-django
git rm -rf .
python3 -m venv .venv
source .venv/Scripts/activate
check_venv_on=$(which pip | grep ".venv")
if [ -z "$check_venv_on" ]; then
    echo "⚠️ No in venv mode"
    exit 1
fi
pip install Django
pip freeze > requirements.txt
is_django_installed=$(cat requirements | grep -E "Django|django")
if [ -n "$is_django_installed" ]; then
    echo "✅ Django installed successfully"
else
    echo "🛑 Django failted to be installted"
    exit 1
fi
mkdir app
django-admin startproject shop app
if [ -d "app/shop" ]; then
    echo "✅ Project created successfully"
else
    echo "🛑 Project failted to be created"
    exit 1
fi
cd app
python manage.py startapp boutique
if [ -d "boutique" ]; then
    echo "✅ Boutiquecreated successfully"
else
    echo "🛑 Boutique failted to be created"
    exit 1
fi
cd boutique
mkdir -p templates/boutique
touch urls.py
{
    echo "from django.urls import path

    from . import views

    urlpatterns = [
        path("", views.index, name="index"),
    ]"

} > urls.py
{
    echo "from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def index(request):
    return HttpResponse("Hello World")
"
} > views.py

cd ..
python manage.py runserver
