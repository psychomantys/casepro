FROM python:3

ENV PYTHONUNBUFFERED 1
RUN mkdir /app
WORKDIR /app

RUN apt-get update \
 && apt-get install -y node-less coffeescript netcat

# instalar dependencias
ADD pip-freeze.txt /app/
RUN pip install -r pip-freeze.txt

# Copiando arquivos
ADD . /app

RUN cp casepro/settings.py.docker casepro/settings.py

# Run the application:
CMD ["docker/start.sh", "python", "manage.py", "runserver", "0.0.0.0:8000"]

