# Restaurant Bingo

This basic command line application written in Ruby with SQLite3 for persistence allows users to play games of restaurant bingo.

A selection of restaurants in the DC area are pulled from Yelp's Fusion API and are used to populate bingo boards with the placement of restaurants on the board obscured from users. Once users login (or create a new user), users can select a board, are presented with a list of dining options, and given important information about the business before they make a move. After *visiting* their restaurant of choice a bingo is printed on the console, the presence or absence of a bingo is determined, and the user is asked whether to continue or exit.

Users and their visits, restaurants, and board configurations are persistent even after the app is exited. An administrator can reset the database and create new boards.

## Install

**REQUIRES** ruby and the bundler ruby gem to be installed.

1. Clone the repository on your local environment.
2. `cd` into the source directory and run `bundle install`.
3. Execute the run file with `ruby bin/run.rb`.

*Hint: On first run, login with the name `admin` to access the admin panel and  populate the database.*

## Board Types

Users have the option to display a basic board in plain text or a fancy board with Unicode characters. As seen below.

### Basic Board

![Basic]()

### Fancy Board

![Fancy](img/fancy.png)
