from rest_framework.routers import DefaultRouter
from django.urls import path
from .views import Send

app_name = 'api'

urlpatterns = [
    path(r'send', Send.as_view()),
    ]

