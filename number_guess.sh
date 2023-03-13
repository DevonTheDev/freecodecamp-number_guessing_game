#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guessing -t --no-align -c" > /dev/null

CORRECT_GUESS=$(($RANDOM % 1000 + 1)) # Random number between 1 and 1000

# Initialise the variables for global usage
GAMES_PLAYED=""
BEST_GAME=""
USERNAME=""
USER_GUESS=""

# Function to check the guess of the user for recursive solving
GUESS_CHECK(){
  # Current user guess is entered into this function with $1
  if [[ ! $1 =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    read USER_GUESS
    GUESS_CHECK $USER_GUESS
  fi
}

# Function for the user to log in
USER_LOGIN(){
  echo $1
  echo "Enter your username: "
  read USERNAME

  if [[ ${#USERNAME} -gt 23 ]]
  then
    USER_LOGIN "Your username must be less than 22 characters"
  else
    DATABASE_INTERACTION $USERNAME
  fi
}

DATABASE_INTERACTION(){
  #$USERNAME is passed into this function as $1
  USERNAME_RESULT=$($PSQL "SELECT * FROM users WHERE username='$1'")
  if [[ -z $USERNAME_RESULT ]]
  then
    $PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$1', 0, 0)" > /dev/null
    echo "Welcome, $1! It looks like this is your first time here."
  else
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$1'")
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$1'")
    echo "Welcome back, $1! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
  echo "Guess the secret number between 1 and 1000:"
  read USER_GUESS

  GUESS_CHECK $USER_GUESS

  GUESS_LOGIC $USER_GUESS 1  
}

GUESS_LOGIC(){
# The current user guess is read into this function as $1
# The guess count is read into this function as $2
USER_GUESS=$1
  if [[ $USER_GUESS -lt $CORRECT_GUESS ]]
  then
    echo "It's higher than that, guess again:"
    read USER_GUESS
    GUESS_LOGIC $USER_GUESS $(($2+1))
  elif [[ $USER_GUESS -gt $CORRECT_GUESS ]]
  then
    echo "It's lower than that, guess again:"
    read USER_GUESS
    GUESS_LOGIC $USER_GUESS $(($2+1))
  else
    if [[ ! $BEST_GAME -eq 0 ]]
    then
      if [[ $BEST_GAME -gt $2 ]]
      then
        BEST_GAME=$2
      fi
    else
      BEST_GAME=$2
    fi
    ((GAMES_PLAYED++))

    $PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME'" > /dev/null
    echo "You guessed it in $2 tries. The secret number was $CORRECT_GUESS. Nice job!"
    return
  fi
}

USER_LOGIN
