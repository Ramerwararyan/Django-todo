FROM python:3
RUN pip install django==3.2

COPY . .
RUN /bin/sh -c python manage.py migrate
EXPOSE 4000
CMD ["gunicorn", "--bind", "0.0.0.0:4000", "myproject.wsgi:application"]
