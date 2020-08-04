FROM python:3

ENV PYTHONUNBUFFERED 1
RUN mkdir /app
WORKDIR /app

# Copiando arquivos
COPY . /app

# instalar dependencias
RUN pip install -r pip-freeze.txt
RUN apt-get update \
 && apt-get install -y node-less coffeescript netcat

RUN cp casepro/settings.py.docker casepro/settings.py

# Run the application:
CMD ["docker/start.sh", "python", "manage.py", "runserver", "0.0.0.0:8000"]

