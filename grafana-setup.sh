#!/bin/bash

PROGRAM=grafana-setup.sh

if [ "$#" == "4" ]; then
    echo "Usage:"
	echo "${PROGRAM} {grafana.db file path} {from string} {to string}"
    echo "ex) ${PROGRAM} grafana.db JMSIGHT-DEV-190523175500 JMSIGHT-DEV-111122223333"
    exit
fi

# Get params
DB_FILE=$1
FROM=$2
TO=$3
echo "DB_FILE=$DB_FILE"
echo "FROM=$FROM"
echo "TO=$TO"

# Update dashboard data
./sqlite3 $DB_FILE "update dashboard set data=REPLACE(data, '$FROM', '$TO')"
./sqlite3 $DB_FILE "select data from dashboard"
