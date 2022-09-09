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
source $SCRIPT_DIR/../00-env.sh
#
# List all predicats
#
export BASE_IRI="http://vivoweb.org/ontology/core/properties"
export SPARQL_CMD=$TMPDIR/cmd.sparql
export ONTO_RESULT=propertiesOnto.nt
export TMP_ONTO_RESULT=$TMPDIR/propertiesOnto.nt
export SPARQL_HEADER=$TMPDIR/header.txt
cat << EOF > $SPARQL_HEADER
    prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#>  
    prefix obo:   <http://purl.obolibrary.org/obo/> 
    prefix skos:  <http://www.w3.org/2004/02/skos/core#> 
    prefix vivo:  <http://vivoweb.org/ontology/core#> 
    prefix rdf:   <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
    prefix rdp: <http://uqam.ca/data/rdp#>
    prefix owl:   <http://www.w3.org/2002/07/owl#>  
    prefix prop: <${BASE_IRI}#> 
EOF


#
# Build ontology schema
cat << EOF > $SPARQL_CMD
    $(cat $SPARQL_HEADER)
        construct {
            prop:PropertyKey rdfs:subClassOf skos:Concept .
            prop:PropertyKey rdfs:subClassOf owl:Thing .
            prop:PropertyKey rdf:type owl:Class .
            prop:PropertyKey owl:versionInfo "Created by Michel Héon Université du Québec à Montréal ; heon.michel@uqam.ca" .
    } where { } 
EOF
sparql --results=NTRIPLES --query $SPARQL_CMD 2>/dev/null > $TMP_ONTO_RESULT

cd $DATA
export PREDICATE_LIST=$TMPDIR/predicatesList.txt
cat vivo_*.properties | java $SCRIPT_DIR/parse.java | grep = | cut -f 1 -d '=' | sort | uniq > $PREDICATE_LIST 

ls *fr_CA*.properties| while read propFile ; do
    java $SCRIPT_DIR/parse.java < $propFile > $TMPDIR/$propFile
#    cat $TMPDIR/$propFile
    LNG=$(basename $propFile .properties | cut -f 3- -d '_' | tr -s '_' '-')
    while read predicateValue ; do
        value=$(grep "^${predicateValue}=" $TMPDIR/$propFile | cut -f 2- -d '=' | sed 's/"/\\"/g')
        echo "($propFile) ($LNG) ($predicateValue) ($value) "
        cat << EOF >> $TMP_ONTO_RESULT
        <$BASE_IRI#PropertyKey> <http://www.w3.org/2000/01/rdf-schema#subClassOf> <http://www.w3.org/2002/07/owl#Thing> .
        <$BASE_IRI#PropertyKey> <http://www.w3.org/2000/01/rdf-schema#subClassOf> <http://www.w3.org/2004/02/skos/core#Concept> .
        <$BASE_IRI#$predicateValue> <http://www.w3.org/2004/02/skos/core#prefLabel> "$value"@$LNG .
        <$BASE_IRI#$predicateValue> <http://www.w3.org/2000/01/rdf-schema#label> "$predicateValue" .
        <$BASE_IRI#$predicateValue> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#NamedIndividual> .
        <$BASE_IRI#$predicateValue> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <$BASE_IRI#PropertyKey> . 
EOF
#        cat << EOF > $SPARQL_CMD
#       $(cat $SPARQL_HEADER)
#       construct {
#               prop:$predicateValue rdf:type prop:PropertiesKey ;
#                rdf:type owl:Individual ;
#                skos:prefLabel "$value"@$LNG .
#        } where { } 
#EOF
#   sparql --results=NTRIPLES --query $SPARQL_CMD 2>/dev/null >> $TMP_ONTO_RESULT
    done < $PREDICATE_LIST
done
cp  $TMP_ONTO_RESULT $ONTO_RESULT
ntriples --base=$BASE_IRI --output=TTL < $TMP_ONTO_RESULT > ../data/propertiesOnto.ttl
echo "DONE !"
