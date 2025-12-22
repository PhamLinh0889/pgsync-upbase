FROM python:3
WORKDIR /code
RUN apt-get update && apt-get install -y vim \
    && rm -rf /var/lib/apt/lists/*
COPY . .
RUN pip install -e .

COPY ./docker/wait-for-it.sh wait-for-it.sh
ARG EXAMPLE_NAME=oms
ENV EXAMPLE_NAME=$EXAMPLE_NAME
# COPY ./docker/runserver.sh runserver.sh
RUN chmod +x wait-for-it.sh
# RUN chmod +x runserver.sh
