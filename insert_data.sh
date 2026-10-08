#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Iterate through every line of the games.csv table and populate the worldcup db
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != 'year' ]]
  then
    # Check if winner is already in the database
    NEW_TEAM=$( $PSQL "SELECT name FROM teams WHERE name='$WINNER';" )

    # If it is not, insert team in table teams
    if [[ -z $NEW_TEAM ]]
    then
      echo $( $PSQL "INSERT INTO teams (name) VALUES ('$WINNER');" )

    else
      echo -e "\n$WINNER is already in the DB"

    fi

    # Check if opponent is already in the database    
    NEW_TEAM=$( $PSQL "SELECT name FROM teams WHERE name='$OPPONENT';" )

    # If it is not, insert team in table teams
    if [[ -z $NEW_TEAM ]]
    then
      echo $( $PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT');" )

    else
      echo -e "\n$OPPONENT is already in the DB"

    fi

  # Retrieve teams id
  WINNER_ID=$( $PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
  echo -e "\nWINNER ID OF $WINNER: $WINNER_ID"

  OPPONENT_ID=$( $PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
  echo "OPPONENT ID OF $OPPONENT: $OPPONENT_ID"


  # Populate games table  
  #echo $( $PSQL "INSERT INTO games (year, round, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_GOALS, $OPPONENT_GOALS);" )

  # 



  fi



done

# Retrieve all the data in teams table
#echo -e "\n$( $PSQL 'SELECT * FROM teams;')"


