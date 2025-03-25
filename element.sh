#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t --no-align -c"

#echo "Please provide an element as an argument."

SHOW_DATA() {
    if [[ -z $1 ]]; then
    echo "Please provide an element as an argument."
    else
        if [[ $1 =~ ^[0-9]+$ ]]; then
            GET_ELEMENT=$($PSQL "SELECT * FROM elements WHERE atomic_number=$1")
        else  
            GET_ELEMENT=$($PSQL "SELECT * FROM elements WHERE symbol='$1'")
            if [[ -z $GET_ELEMENT ]]; then
                GET_ELEMENT=$($PSQL "SELECT * FROM elements WHERE name='$1'")
            fi
        fi

        if [[ -z $GET_ELEMENT ]]; then 
            echo "I could not find that element in the database."
        else
            echo $GET_ELEMENT | while IFS='|' read ATOMIC_NUMBER SYMBOL NAME
            do
                GET_ELEMENT_PROPERTIES=$($PSQL "SELECT * FROM properties WHERE atomic_number=$ATOMIC_NUMBER")

                echo $GET_ELEMENT_PROPERTIES | while IFS='|' read ATOMIC_NUMBER TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE_ID
                do
                    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius." 
                done
            done
        fi
    fi
    
}
SHOW_DATA $1