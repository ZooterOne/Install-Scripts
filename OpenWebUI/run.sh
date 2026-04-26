#!/bin/bash

INSTALL_DIRECTORY=/opt/OpenWebUI

cd $INSTALL_DIRECTORY

source .venv/bin/activate
pip install -U open-webui
open-webui serve
deactivate
