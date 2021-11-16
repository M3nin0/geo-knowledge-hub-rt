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
RUN pipenv install --deploy --system --pre \
    # GEO Knowledge Hub extensions (ToDo: Add extension as pipfile dependencies)
    && for g in geo-knowledge-hub geo-vocabularies; do git clone https://github.com/geo-knowledge-hub/${g}.git \
    && pip install -e $g; done

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
RUN cp -r ./static/. ${INVENIO_INSTANCE_PATH}/static/ \
    && cp -r ./assets/. ${INVENIO_INSTANCE_PATH}/assets/ \
    && invenio collect --verbose \
    && invenio webpack create \
    && invenio webpack install --unsafe \
    && invenio webpack build \
    # Temporary: Installing the GEO Custom `react-invenio-deposit`.
    && git clone https://github.com/geo-knowledge-hub/react-invenio-deposit \
    && cd react-invenio-deposit \
    && npm install \
    && npm run-script build \
    # Moving to the invenio webpack `node_module` directory.
    && rm -rf /opt/invenio/var/instance/assets/node_modules/react-invenio-deposit/dist/* \
    && cp -R dist/* /opt/invenio/var/instance/assets/node_modules/react-invenio-deposit/dist/ \
    && invenio webpack build


ENTRYPOINT [ "bash", "-c" ]
