#!/bin/bash
cd /code
python manage.py migrate
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('${ADMIN_USERNAME}', '${ADMIN_EMAIL}', '${ADMIN_PASSWORD}')" | python manage.py shell
