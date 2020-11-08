ARG PYTHON_VERSION

FROM python:${PYTHON_VERSION}-alpine as build

WORKDIR /usr/src/dupekiller

COPY ./main.py ./
COPY ./dupekiller/*.py ./dupekiller/

CMD ["python", "./main.py"]
