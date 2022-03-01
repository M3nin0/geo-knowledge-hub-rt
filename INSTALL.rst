..
    This file is part of GEO Knowledge Hub.
    Copyright 2020-2021 GEO Secretariat.

    GEO Knowledge Hub is free software; you can redistribute it and/or modify it
    under the terms of the MIT License; see LICENSE file for more details.


Install GEO Knowledge Hub Digital Library
=========================================


``GEO Knowledge Hub`` depends essentially on `InvenioRDM <https://invenio-software.org/products/rdm/>`_. Please, read the instructions below in order to install ``GEO Knowledge Hub``.


Development installation
------------------------


Pre-Requirements
++++++++++++++++


- `Python <https://www.python.org/>`_ 3.8+

- `nodejs <https://nodejs.org/>`_ 14.0.0+

- `Docker <https://docs.docker.com/>`_ 1.13.0+

- `Docker-Compose <https://docs.docker.com/>`_ 1.17.0+

- `Cairo <https://www.cairographics.org/>`_ graphics library.


.. note::

    On Linux Ubuntu, the Cairo library can be installed with ``apt-get``::

        sudo apt-get install libcairo2-dev


.. note::

    For the development environment, you should have the Python development headers. On Linux Ubuntu, it can be installed with ``apt-get``::

        sudo apt install python3.8-dev


.. note::

    The Anaconda Python version is not currently supported by InvenioRDM. Please, for more details, refer to the section `Pre-Requirements <https://inveniordm.docs.cern.ch/install/#pre-requirements>`_ in InvenioRDM documentation.


Clone the software repository and all GEO Knowledge Hub extensions
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


Use ``git`` to clone the **runtime** software repository::

    git clone https://github.com/geo-knowledge-hub/geo-knowledge-hub-rt.git


Clone also all the extension repositories::

    git clone https://github.com/geo-knowledge-hub/geo-vocabularies.git

    git clone https://github.com/geo-knowledge-hub/geo-knowledge-hub.git

    git clone https://github.com/geo-knowledge-hub/react-invenio-deposit.git


.. tip::

    Let's assume you have cloned the above repositories according to the following structure::

        /path/to/repositories
        ├── geo-knowledge-hub
        ├── geo-knowledge-hub-rt
        ├── geo-vocabularies
        └── react-invenio-deposit


Go to the **runtime** folder::

    cd geo-knowledge-hub-rt


Install the Invenio-CLI
+++++++++++++++++++++++


Via pip::

    pip install invenio-cli


Check the installed version::

    invenio-cli --version


.. note::

    You can use your favorite way to install a Python package. Please, refer to the section `Install the CLI <https://inveniordm.docs.cern.ch/install/#install-the-cli>`_ in the InvenioRDM documentation.


.. note::

    If you want to create a new Python Virtual Environment, please, follow this instruction:

    *1.* Create a new virtual environment linked to Python 3.8::

        python3.8 -m venv /path/to/repositories/venv


    .. tip::

        Please, replace ``/path/to/repositories`` with the correct path in your machine.


    **2.** Activate the new environment::

        source /path/to/repositories/venv/bin/activate


    **3.** Update pip and setuptools::

        pip3 install --upgrade pip setuptools wheel


.. note::

    We are using ``invenio-cli`` version 1.0.0.


Create Instance Configuration File
++++++++++++++++++++++++++++++++++


You will need to create a file named ``.invenio.private`` in the root of the **runtime** repository with the following content::

    echo "[cli]" > .invenio.private
    echo "project_dir = $(pwd)" >> .invenio.private
    echo "instance_path = ${VIRTUAL_ENV}/var/instance" >> .invenio.private
    echo "services_setup = True" >> .invenio.private


.. note::

    If you are not in a virtual environment, please, replace the ``${VIRTUAL_ENV}`` variable by the correct path in your machine, for example: ``/path/to/repositories/venv/var/instance``.


Local Installation
++++++++++++++++++

.. note::

    All commands suppose that you are currently in the **runtime** folder (``/path/to/repositories/geo-knowledge-hub-rt``).


We will run GEO Knowledge Hub locally and the database and other services in Docker containers.


From the GEO Knowledge Hub **runtime** folder, install all the dependencies with the help of ``invenio-cli``::

    invenio-cli install --pre --development


After installing all the dependency libraries, setup the PostgreSQL, Elasticsearch, Redis and RabbitMQ containers::

    invenio-cli services setup --force --no-demo-data


Install the GEO Knowledge Hub **vocabularies**::

    pip install /path/to/repositories/geo-vocabularies


Install the GEO Knowledge Hub InvenioRDM extension::

    invenio-cli packages install /path/to/repositories/geo-knowledge-hub


.. warning::

    You will need to install a special version of ``react-invenio-deposit`` from the GEO Knowledge Hub organization::

        invenio-cli assets install /path/to/repositories/react-invenio-deposit


Run GEO Knowledge Hub
+++++++++++++++++++++


After installing locally and preparing the services, start the GEO Knowledge Hub::

    invenio-cli run


If everything went well, you can open your browser and point to the following address::

    firefox https://localhost:5000


Production installation
-----------------------


**Under Development**
