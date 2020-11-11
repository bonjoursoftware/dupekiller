ARG PYTHON_VERSION
FROM python:${PYTHON_VERSION}-alpine
RUN addgroup -S python \
    && adduser -S python -G python
USER python
RUN mkdir /home/python/dupekiller
WORKDIR /home/python/dupekiller
COPY --chown=python:python ./dupekiller/*.py ./
ENTRYPOINT ["./dupekiller.py"]
