from rest_framework import generics
from .models import Text
from .serializers import TextSerializer
from rest_framework import viewsets, permissions
#PUT
class TextList(viewsets.ModelViewSet):
    queryset = Text.objects.all()
    serializer_class = TextSerializer

#GET
class TextList2(viewsets.ModelViewSet):
    queryset = Text.objects.all()
    serializer_class = TextSerializer
