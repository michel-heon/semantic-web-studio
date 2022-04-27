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
if [ ! -z $1 ]; then 
	export TRANSLATOR_HOME=$1
else
	export TRANSLATOR_HOME=/opt/translator
fi
echo INSTALL $TRANSLATOR_HOME
export JENA_HOME=$TRANSLATOR_HOME
export PATH=$JENA_HOME/bin:$PATH