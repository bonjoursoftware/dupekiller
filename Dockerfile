FROM python:3.8-slim
WORKDIR /usr/src/dupekiller
RUN pip install pipenv
COPY ./Pipfile.lock ./
RUN pipenv sync
COPY ./dupekiller/*.py ./dupekiller/
COPY ./main.py ./
CMD ["python", "./main.py"]
