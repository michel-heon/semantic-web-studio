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
export ROOT_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd -P)"
export GIT_HOME=$(cd $ROOT_SCRIPT_DIR/../../ ; pwd -P)
export PATH=$PATH:$ROOT_SCRIPT_DIR/script
source $ROOT_SCRIPT_DIR/script/cleanup.sh
export DATA=$ROOT_SCRIPT_DIR/data
export LANG=C.UTF-8



