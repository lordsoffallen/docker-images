#!/usr/bin/env bash

set -e
set -x

checkVersion(){
  if [ "$(conda -V | grep -Eo '([0-9]|\.)*')" == $MINICONDA_VERSION ]; then if [ "$(python -V | grep -Eo '([0-9]|\.){3}')" == $PYTHON_VERSION ]; then exit 0; else exit 1; fi else exit 1; fi

}

checkVersion
