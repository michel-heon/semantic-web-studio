#!/bin/bash
  
###################################################################
# Script Name   :
# Description   :
# Args          : la valeur de SW_STUDIO_HOME (optionnelle)
# Author        : Michel Héon PhD
# Institution   : Université du Québec à Montréal
# Copyright     : Université du Québec à Montréal (c) 2022
# Email         : heon.michel@uqam.ca
###################################################################
export SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd -P)"

###################################################################
# Assigner JENA_VERSION si elle n'existe pas
[ ! -z JENA_VERSION ] && export JENA_VERSION=3.17.0
[ -z "$SW_STUDIO_HOME" ] && export SW_STUDIO_HOME=$1
export JENA_HOME=$SW_STUDIO_HOME
export TOOLS_DIR=$SW_STUDIO_HOME/ldap-tools/tools
export JAVA_VERSION=11
export PATH=$JENA_HOME:$JENA_HOME/bin:$TOOLS_DIR:$PATH


