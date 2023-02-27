#!/bin/bash 

###################################################################
# Script Name   :
# Description   :
# Args          : 
# Author        : Michel Héon PhD
# Institution   : Université du Québec à Montréal
# Copyright     : Université du Québec à Montréal (c) 2023
# Email         : heon.michel@uqam.ca
###################################################################

###################################################################
## entête
###################################################################
export SWS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd -P)"
usage() { echo "Usage: $(basename $0) <SW_STUDIO_HOME> " 1>&2; exit 1; }
[ -z "$1" ] && usage
[ -d $1 ] || mkdir -p $1
export SWS_HOME=$(realpath $1) 
env -i bash --norc --noprofile -c "source $SWS_SCRIPT_DIR/00-env.sh $SWS_HOME ; printenv | \
     grep -v 'printenv' | \
     grep -v 'PWD' | \
     grep -v 'SHLVL' | \
     sort | sed 's/^/export /'" > $SWS_SCRIPT_DIR/conf/sws-conf.sh


