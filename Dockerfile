#
# This file is part of GEO Knowledge Hub.
# Copyright 2020-2021 GEO Secretariat.
#
# GEO Knowledge Hub is free software; you can redistribute it and/or modify it
# under the terms of the MIT License; see LICENSE file for more details.
#

# Dockerfile that builds a fully functional image of your app.
#
# This image installs all Python dependencies for your application. It's based
# on CentOS 7 with Python 3 (https://github.com/inveniosoftware/docker-invenio)
# and includes Pip, Pipenv, Node.js, NPM and some few standard libraries
# Invenio usually needs.
#
# Note: It is important to keep the commands in this file in sync with your
# bootstrap script located in ./scripts/bootstrap.

FROM inveniosoftware/centos8-python:3.8

#
# Base Dependencies
#
COPY Pipfile Pipfile.lock ./
RUN pipenv install --deploy --system --pre 

#
# Auxiliary files
#
COPY ./docker/uwsgi/ ${INVENIO_INSTANCE_PATH}
COPY ./invenio.cfg ${INVENIO_INSTANCE_PATH}
COPY ./templates/ ${INVENIO_INSTANCE_PATH}/templates/
COPY ./app_data/ ${INVENIO_INSTANCE_PATH}/app_data/
COPY ./ .

#
# Configuring Invenio
#

# Creating the base webpack
RUN cp -r ./static/. ${INVENIO_INSTANCE_PATH}/static/ \
    && cp -r ./assets/. ${INVENIO_INSTANCE_PATH}/assets/ \
    && invenio collect --verbose \
    && invenio webpack create \
    && invenio webpack install --unsafe

RUN mkdir ${INVENIO_INSTANCE_PATH}/assets/build-components \
    && cd ${INVENIO_INSTANCE_PATH}/assets/build-components \
    && for i in \
        geo-components-react,master \
        react-invenio-deposit,b-1.0 \
        geo-deposit-react,master; \
    do IFS=","; set -- $i; \
        git clone --branch $2 https://github.com/geo-knowledge-hub/$1 \
        && cd ${PWD}/$1 \
        && npm install \
        && npm run-script build \
        && npm run-script link-dist \
        && cd ${INVENIO_INSTANCE_PATH}/assets/ \
        && npm link ${INVENIO_INSTANCE_PATH}/assets/build-components/$1 \
        && cd ${INVENIO_INSTANCE_PATH}/assets/build-components; \
    done

# Building
RUN invenio collect --verbose \
    && invenio webpack create \
    && invenio webpack build \
    && pip install ipython_genutils

ENTRYPOINT [ "bash", "-c" ]
