#!/bin/bash

set -e

function content_table_help() {
  printf "  Adds or updates table of contents to the Practical_computing instructions.\n"
  printf "  \n"
  printf "      -h|--help              print help\n"
  printf "      -i|--instruction       path to the instruction md file\n"
  printf "  \n"
}

export -f content_table_help

exec 5> /dev/stdout #VERBOSE

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -h|--help)
    content_table_help
    exit 0
    shift # past argument
    ;;

    -i|--instruction)
    export INSTRUCTION="$2"
    shift
    shift # past argument
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done

set -- "${POSITIONAL[@]}" # restore positional parameters

SOURCE="${BASH_SOURCE[0]}"
INSTRUCTION_DIR=$( dirname $INSTRUCTION )

## check if table of content present - if so -remove it
if grep -q  '\* \[.*\](#' $INSTRUCTION
then
    FIRST_LINE=$( grep -n '\* \[.*\](#' $INSTRUCTION | head -1 | cut -f1 -d ":" )
    LAST_LINE=$( grep -n '\* \[.*\](#' $INSTRUCTION | tail -1 | cut -f1 -d ":" )
    PRINT_LINE="no"
    sed -i -e "$FIRST_LINE","$LAST_LINE"d $INSTRUCTION
else
   PRINT_LINE="yes"
fi

## prepare content table
cat $INSTRUCTION | grep '^##* ' | grep -v '^# ' | while read -r title
   do
        new_title=$(echo $title | sed 's/# /* [/g' | sed 's/#/  /g' | sed 's/`//g')
        link=$(echo $title | sed 's/#* //' | sed 's/`//g'| sed 's/()//g' | tr 'A-Z ' 'a-z-' )
        echo "$new_title](#$link)" >> $INSTRUCTION_DIR/table.txt
   done

## find line where to insert the table
BEFORE=$( grep -n '^# ' $INSTRUCTION | tail -1 | cut -f1 -d ':' )
AFTER=$(( $BEFORE + 1 ))

## insert table to instructions
head -"$BEFORE" $INSTRUCTION  > $INSTRUCTION_DIR/new_instructions.txt
cat $INSTRUCTION_DIR/table.txt >> $INSTRUCTION_DIR/new_instructions.txt
if [ $PRINT_LINE = yes ]
then
    printf "  \n" >> $INSTRUCTION_DIR/new_instructions.txt
    printf "***  \n" >> $INSTRUCTION_DIR/new_instructions.txt
    printf "  \n" >> $INSTRUCTION_DIR/new_instructions.txt
fi
tail -n +"$AFTER" $INSTRUCTION  >> $INSTRUCTION_DIR/new_instructions.txt
mv $INSTRUCTION_DIR/new_instructions.txt $INSTRUCTION
rm $INSTRUCTION_DIR/table.txt



