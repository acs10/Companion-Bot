from django.db import models
from django.utils.safestring import mark_safe

class Text(models.Model):
    body = models.TextField(blank=True, null=True)
    texto = models.TextField(blank=True, null=True)

    def __str__(self):
        return self.body
