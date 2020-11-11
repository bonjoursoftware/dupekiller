ARG PYTHON_VERSION
FROM python:${PYTHON_VERSION}-alpine
RUN apk add --no-cache \
    make~=4.3 \
    build-base~=0.5
RUN addgroup -S python \
    && adduser -S python -G python
USER python
RUN mkdir /home/python/dupekiller
WORKDIR /home/python/dupekiller
ENV PATH=$PATH:/home/python/.local/bin
RUN pip install --user pipenv
COPY --chown=python:python ./Pipfile ./Pipfile.lock ./
RUN pipenv install --dev
COPY --chown=python:python ./dupekiller/*.py ./
COPY --chown=python:python ./tests/* ./tests/
ENTRYPOINT ["pipenv", "run"]
