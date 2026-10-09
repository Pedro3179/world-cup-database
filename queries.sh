#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.
#1
echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"
#2
echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$( $PSQL 'SELECT (SUM(winner_goals)+SUM(opponent_goals)) FROM games;')"
#3
echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$( $PSQL 'SELECT AVG(winner_goals) FROM games;' )"
#4
echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$( $PSQL 'SELECT ROUND(AVG(winner_goals), 2) FROM games;' )"
#5
echo -e "\nAverage number of goals in all games from both teams:"
echo "$( $PSQL 'SELECT (AVG(winner_goals)+AVG(opponent_goals)) FROM games;' )"
#6
echo -e "\nMost goals scored in a single game by one team:"
echo "$( $PSQL 'SELECT MAX(winner_goals) FROM games;' )"
#7
echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$( $PSQL 'SELECT COUNT(*) from games WHERE winner_goals>2;' )"
#8
echo -e "\nWinner of the 2018 tournament team name:"
echo
#9
echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo
#10
echo -e "\nList of unique winning team names in the whole data set:"
echo
#11
echo -e "\nYear and team name of all the champions:"
echo
#12
echo -e "\nList of teams that start with 'Co':"
echo
