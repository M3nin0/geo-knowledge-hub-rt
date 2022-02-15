# -*- coding: utf-8 -*-
#
# Copyright (C) 2022 GEO Secretariat.
#
# GEO-Metadata-Previewer is free software; you can redistribute it and/or
# modify it under the terms of the MIT License; see LICENSE file for more
# details.

"""Geospatial metadata previewer support for the GEO Knowledge Hub"""

from .ext import GEOMetadataPreviewer
from .version import __version__

__all__ = ('__version__', 'GEOMetadataPreviewer')
