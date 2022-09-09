#!/bin/bash 

###################################################################
# Script Name   :
# Description   :
# Args          : 
# Author        : Michel Héon PhD
# Institution   : Université du Québec à Montréal
# Copyright     : Université du Québec à Montréal (c) 2022
# Email         : heon.michel@uqam.ca
###################################################################
export SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd -P)"
source $SCRIPT_DIR/00-env.sh
>&2 echo "TRANSLATOR_HOME = $TRANSLATOR_HOME"
>&2 echo "JENA_HOME = $JENA_HOME"
>&2 echo "JENA_VERSION = $JENA_VERSION"
>&2 echo "ldap_TOOLS_DIR = $TOOLS_DIR"

