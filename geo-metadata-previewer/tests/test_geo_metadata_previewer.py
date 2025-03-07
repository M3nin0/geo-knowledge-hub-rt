# -*- coding: utf-8 -*-
#
# Copyright (C) 2022 GEO Secretariat.
#
# GEO-Metadata-Previewer is free software; you can redistribute it and/or
# modify it under the terms of the MIT License; see LICENSE file for more
# details.

"""Module tests."""

from flask import Flask

from geo_metadata_previewer import GEOMetadataPreviewer


def test_version():
    """Test version import."""
    from geo_metadata_previewer import __version__
    assert __version__


def test_init():
    """Test extension initialization."""
    app = Flask('testapp')
    ext = GEOMetadataPreviewer(app)
    assert 'geo-metadata-previewer' in app.extensions

    app = Flask('testapp')
    ext = GEOMetadataPreviewer()
    assert 'geo-metadata-previewer' not in app.extensions
    ext.init_app(app)
    assert 'geo-metadata-previewer' in app.extensions


def test_view(base_client):
    """Test view."""
    res = base_client.get("/")
    assert res.status_code == 200
    assert 'Welcome to GEO-Metadata-Previewer' in str(res.data)
