from rest_framework import generics
from .models import Text
from .serializers import TextSerializer
from rest_framework import viewsets, permissions

class TextList(viewsets.ModelViewSet):
    queryset = Text.objects.all()
    serializer_class = TextSerializer

class TextList2(viewsets.ModelViewSet):
    queryset = Text.objects.all()
    serializer_class = TextSerializer


