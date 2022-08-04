from rest_framework.routers import DefaultRouter
from django.urls import path
from .views import TextList
from .views import TextList2

app_name = 'api'

router = DefaultRouter(trailing_slash=False)
router.register('put', TextList)
router.register(r'get', TextList2)

urlpatterns = router.urls

