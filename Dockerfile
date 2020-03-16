FROM python:3
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        default-mysql-client default-libmysqlclient-dev
WORKDIR /usr/src/app
ARG BUILD_ENV=prod
ADD config/requirements ./requirements
RUN pip3 install --upgrade pip; \
    pip3 install -r requirements/$BUILD_ENV.txt
RUN django-admin startproject myproject .; \
    mv ./myproject ./origproject