FROM python:3.8.6-alpine as builder
WORKDIR /usr/src/dupekiller
RUN pip install pipenv
COPY ./Pipfile ./Pipfile.lock ./
RUN pipenv install --dev
COPY ./dupekiller/*.py ./dupekiller/
COPY ./tests/* ./tests/
COPY ./main.py ./
RUN pipenv run pytest

FROM python:3.8.6-alpine
WORKDIR /usr/src/dupekiller
COPY ./dupekiller/*.py ./dupekiller/
COPY ./main.py ./
CMD ["python", "./main.py"]
