#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
    if [[ $YEAR != year ]]
    then
        #Check if country, either winner or opponent, exist in the teams table. If not, insert it into the table
        CHECK_WINNER=$($PSQL "SELECT COUNT(*) FROM teams WHERE name='$WINNER'")
        if [[ $CHECK_WINNER == 0 ]]
        then
            INSERT_WINNER=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER')")
            echo Inserted into teams: $INSERT_WINNER
        fi

        CHECK_OPPONENT=$($PSQL "SELECT COUNT(*) FROM teams WHERE name='$OPPONENT'")
        if [[ $CHECK_OPPONENT == 0 ]]
        then
            INSERT_OPPONENT=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")
            echo Inserted into teams: $INSERT_OPPONENT
        fi
    fi
done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
    if [[ $YEAR != year ]]
    then
        # Get team IDs for both winner and opponent
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

        INSERT_INTO_GAMES=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    fi
done


