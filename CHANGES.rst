..
    This file is part of GEO Knowledge Hub.
    Copyright 2020-2021 GEO Secretariat.

    GEO Knowledge Hub is free software; you can redistribute it and/or modify it
    under the terms of the MIT License; see LICENSE file for more details.


Runtime for GEO Knowldege Hub - Changes
=======================================


Version 1.0.0 (2022-04-25)
--------------------------

- Based on `InvenioRDM 8.0 <https://inveniordm.docs.cern.ch/releases/versions/version-v8.0.0/>`_;

- Repository organization

- AWS CodePipeline Disabled;

- Dockerfile build reviewed to support the custom react libraries for the GEO Knowledge Hub;

- Compatible with `GEO Knowledge Hub Extenson 1.0.0 <https://github.com/geo-knowledge-hub/geo-knowledge-hub/tree/b-1.0>`_.

Version 0.8.0 (2021-11-24)
--------------------------

- Renamed repository from ``geo-knowledge-hub`` to ``geo-knowledge-hub-rt``;

- Moved vocabularies for a separate extension named `geo-vocabularies <https://github.com/geo-knowledge-hub/geo-vocabularies>`_;

- Updated Pipfile.lock versions;

- Compatible with:
 - `GEO Knowledge Hub Package Loader 0.8.0 <https://github.com/geo-knowledge-hub/geo-package-loader/tree/b-0.8>`_;
 - `GEO Knowledge Hub Extenson 0.8.0 <https://github.com/geo-knowledge-hub/geo-knowledge-hub/tree/b-0.8>`_;
 - `GEO Knowledge Hub Vocabularies 0.8.0 <https://github.com/geo-knowledge-hub/geo-vocabularies/tree/b-0.8>`_;

Version 0.6.0 (2021-10-07)
---------------------------

- Based on `InvenioRDM 6.0 <https://inveniordm.docs.cern.ch/releases/versions/version-v6.0.0/>`_.

- Add user actions;

- Frontpage customization;

- Compatible with `GEO Knowledge Hub Package Loader 0.6.0 <https://github.com/geo-knowledge-hub/gkh-package-loader/tree/b-0.6>`_ and `GEO Knowledge Hub Extension 0.6.0 <https://github.com/geo-knowledge-hub/geo-knowledge-hub-ext/tree/b-0.6>`_.


Version 0.3.0 (2021-06-21)
--------------------------


- Based on `InvenioRDM 4.0 <https://inveniordm.docs.cern.ch/releases/versions/version-v4.0.0/>`_.

- Compatible with `GEO Knowledge Hub Package Loader 0.3.0 <https://github.com/geo-knowledge-hub/gkh-package-loader/tree/b-0.3>`_ and `GEO Knowledge Hub Extenson 0.3.0 <https://github.com/geo-knowledge-hub/geo-knowledge-hub-ext/tree/b-0.3>`_.

- Enhanced Jinja templates.

- Added GEO Knowledge Hub Extension.


Version 0.1.0 (2020-09-01)
--------------------------


- Customization of InvenioRDM pages:

  - frontpage.
  - record search page.
  - record visualization page.

- Basic documentation of repository organization, how to install and deploy the system.

- Data model ``0.1.0`` is based on InvenioRDM ``0.10.0``.

- Prepared test ecosystem on Travis CI.

- Continuous CI/CD with Travis CI and AWS with CodeDeploy.

- EC2 instance for showcase.

- Prepared use case with GEOGLAM and Sen2-Agri.

- Scripts for automatic ingestion of resources in the Digital Library.

- Main InvenioRDM dependencies: ``invenio-app-rdm 0.10.1``, ``invenio-rdm-records 0.14.1``.
