#!/bin/bash
###################################################################
# Script Name   :
# Description   : Stript d'installation du translator et de Jena
# Les variables d'installation sont dans 00-env.sh
# Args          : N\A
# Author       	: Michel Héon PhD
# Institution   : Université du Québec à Montréal
# Copyright     : Université du Québec à Montréal (c) 2022
# Email         : heon.michel@uqam.ca
###################################################################
export SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd -P)"
source $SCRIPT_DIR/00-env.sh
cd $SCRIPT_DIR
echo INSTALL to $TRANSLATOR_HOME with jena $JENA_VERSION
mvn clean install -Dtranslator.deploy.dir=$TRANSLATOR_HOME
cp 00-env.sh $TRANSLATOR_HOME
chmod +x $TRANSLATOR_HOME/bin/*