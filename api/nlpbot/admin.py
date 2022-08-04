from django.contrib import admin
from .models import Text

class TextAdmin(admin.ModelAdmin):
    fields = ('body','texto')
    list_display = ['body','texto']


admin.site.register(Text)
