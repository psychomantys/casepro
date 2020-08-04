#!/usr/bin/env bash

until nc -z ${POSTGRES_HOST}:${POSTGRES_PORT}; do
	echo "Waiting for ${POSTGRES_HOST}:${POSTGRES_PORT}"
	sleep 2
done

python manage.py migrate

if [ "${DJANGO_SUPERUSER_USER}" -a "${DJANGO_SUPERUSER_PASSWORD}" ] ; then
	python manage.py createsuperuser --no-input
fi

exec "$@"

