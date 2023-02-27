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
source $SCRIPT_DIR/conf/sws-conf.sh
$SCRIPT_DIR/show-vars.sh
cd $SCRIPT_DIR
echo INSTALL to $SW_STUDIO_HOME with jena $JENA_VERSION
mvn clean install -Dsw-studio.deploy.dir=$SW_STUDIO_HOME -Djena.version=$JENA_VERSION
cp $SCRIPT_DIR/conf/sws-conf.sh $SW_STUDIO_HOME
cp -r ldap-tools $SW_STUDIO_HOME
chmod +x $SW_STUDIO_HOME/bin/*

