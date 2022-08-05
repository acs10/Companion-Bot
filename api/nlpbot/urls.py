from rest_framework.routers import DefaultRouter
from django.urls import path
from .views import TextList

app_name = 'api'

router = DefaultRouter(trailing_slash=False)
router.register(r'post', TextList)

urlpatterns = router.urls

