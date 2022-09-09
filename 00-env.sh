#!/bin/bash
  
###################################################################
# Script Name   :
# Description   :
# Args          : la valeur de TRANSLATOR_HOME (optionnelle)
# Author        : Michel Héon PhD
# Institution   : Université du Québec à Montréal
# Copyright     : Université du Québec à Montréal (c) 2022
# Email         : heon.michel@uqam.ca
###################################################################
export SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd -P)"

###################################################################
# Assigner JENA_VERSION si elle n'existe pas
[ ! -z JENA_VERSION ] && export JENA_VERSION=3.17.0

###################################################################
# Assigner TRANSLATOR_HOME
# si elle est passée en paramètre
if [ ! -z $1 ]; then 
    export TRANSLATOR_HOME=$1
else
    ###################################################################
    # Assigner TRANSLATOR_HOME
    # si elle n'est pas déjà assignée
    if [ -z $TRANSLATOR_HOME ]; then 
        export TRANSLATOR_HOME=/opt/translator
    fi
fi

export JENA_HOME=$TRANSLATOR_HOME
export PATH=$JENA_HOME:$JENA_HOME/bin:$PATH

>&2 echo "TRANSLATOR_HOME = $TRANSLATOR_HOME"
>&2 echo "JENA_HOME = $JENA_HOME"
>&2 echo "JENA_VERSION = $JENA_VERSION"
