#!/bin/bash -x

###################################################################
# Script Name   :
# Description   : Useful to integrate data processing functionalities
# get code      : git clone git@bitbucket.org:vivo-workspace/data-format-translator.git
# Usage         : source source_translator.sh
# Author        : Michel Héon PhD
# Institution   : Université du Québec à Montréal
# Copyright     : Université du Québec à Montréal (c) 2022
# Email         : heon.michel@uqam.ca
###################################################################
export SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd -P)"
source $SCRIPT_DIR/../00-env.sh
export TRANSLATOR_HOME=/home/ubuntu/VIVO_UQAM_PRE_PROD/translator
source $GIT_HOME/data-format-translator/00-env.sh
sparql --version

