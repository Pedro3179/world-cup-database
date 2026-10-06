#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != 'year' ]]
  then
    # Check if winner is already in the database
    # Query where name is equal to the winner's name
    NEW_TEAM=$( $PSQL "SELECT name FROM teams WHERE name='$WINNER';" )

    if [[ -z $NEW_TEAM ]]
    then
      echo $( $PSQL "INSERT INTO teams (name) VALUES ('$WINNER');" )

    else
      echo -e "\n$WINNER is already in the DB"

    fi

    NEW_TEAM=$( $PSQL "SELECT name FROM teams WHERE name='$OPPONENT';" )

    if [[ -z $NEW_TEAM ]]
    then
      echo $( $PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT');" )

    else
      echo -e "\n$OPPONENT is already in the DB"

    fi

  fi

done

echo -e "\n$( $PSQL 'SELECT * FROM teams;')"


