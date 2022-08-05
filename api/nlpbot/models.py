from django.db import models
from django.utils.safestring import mark_safe
# from uuid import uuid4

class Text(models.Model):
    # id = models.UUIDField(primary_key=True, default=uuid4, editable=False)
    body = models.TextField(blank=True, null=True)

    def __str__(self):
        return self.body
