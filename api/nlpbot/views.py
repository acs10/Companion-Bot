from rest_framework import generics
from .models import Text
from django.urls import reverse, reverse_lazy
from .serializers import TextSerializer
from rest_framework import viewsets, permissions

class TextList(viewsets.ModelViewSet):
    queryset = Text.objects.all()
    serializer_class = TextSerializer

class TextList2(viewsets.ModelViewSet):
    queryset = Text.objects.order_by('id').reverse()[:1]
    serializer_class = TextSerializer




