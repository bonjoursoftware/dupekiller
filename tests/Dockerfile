ARG PYTHON_VERSION

FROM python:${PYTHON_VERSION}-alpine as test

WORKDIR /usr/src/dupekiller

RUN pip install pipenv

COPY ./Pipfile ./Pipfile.lock ./
RUN pipenv install --dev

COPY ./main.py ./
COPY ./dupekiller/*.py ./dupekiller/
COPY ./tests/* ./tests/

CMD ["pipenv", "run", "pytest"]
