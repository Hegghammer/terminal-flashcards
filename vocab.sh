#!/bin/bash

# add the path to your deck here
# e.g. ~/apps/vocab/decks/ara_2k.txt
MYDECK=<path/to/your/deck>

cat $MYDECK | awk -F '\t' '{print $1}' > /tmp/word
cat $MYDECK | awk -F '\t' '{print $2}' > /tmp/meaning

mapfile -t wordarray < /tmp/word
mapfile -t meaningarray < /tmp/meaning

size=${#wordarray[@]}
rand=$(( ( RANDOM % size )  + 1 ))
CYAN='\033[0;96m'
GREEN='\033[1;92m'
RED='\033[0;31m'
printf "     ${CYAN}word    : ${GREEN}${wordarray[rand-1]}\n\n"
printf "     ${CYAN}meaning : ${RED}${meaningarray[rand-1],,}\n\n"

