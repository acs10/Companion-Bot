from django.contrib import admin
from .models import Text

class TextAdmin(admin.ModelAdmin):
    fields = ('body')
    list_display = ['body']


admin.site.register(Text)
