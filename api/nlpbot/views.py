from .models import Text
from rest_framework import status
from .serializers import TextSerializer
from rest_framework.response import Response
from rest_framework.views import APIView
from processText.receiverText import ProcessText


class Send(APIView):
    def get(self, request):
        query = Text.objects.order_by('id').reverse()[:1]
        serializer = TextSerializer(query, many=True)
        instance = ProcessText(serializer.data)
        return Response(instance.processReceiver()) 

    def post(self, request):
        serializer = TextSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)

    



