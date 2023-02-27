###################################################################
# Script Name   : Makefile
# Description   : Script d'installation des composants de VIVO-Studio
# Pré-requis    : Les paramètres d'installation doivent être attribuées 
#		avant dans 00-env.sh avant l'exécution des règles  
# Args          :
# Author       	: Michel Héon PhD
# Institution   : Université du Québec à Montréal
# Copyright     : Université du Québec à Montréal (c) 2022
# Email         : heon.michel@uqam.ca
###################################################################
SHELL = /usr/bin/env  bash 

PWD   := $(shell pwd)
PATH  := ./:$(PWD):$(PATH)


###################################################################
# Générer la configuration 
$(PWD)/conf/sws-conf.sh: $(PWD)/00-env.sh 
	$(PWD)/configure.sh  $(PWD)/deploy/sws-studio

config: $(PWD)/conf/sws-conf.sh

install: config
	install-sw-studio.sh