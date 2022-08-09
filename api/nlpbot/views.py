from .models import Text
from rest_framework import status
from .serializers import TextSerializer
from rest_framework.response import Response
from rest_framework.views import APIView


class Send(APIView):
    def get(self, request):
        query = Text.objects.order_by('id').reverse()[:1]
        serializer = TextSerializer(query, many=True)
        print(serializer.data)
        return Response(serializer.data)
        # return Response(['say'])

    def post(self, request):
        serializer = TextSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)

    



