Stat 850 Project Description
================
Paulus Hermanto, Bipin Poudel, Andrew Ker

## Instructions

Each member of your team should modify this document in some way and
push their modifications to the repository in a separate commit. This
will ensure that you have set your repository up in a way that ensures
all group members are working with the same repository.

Note that you must compile your readme (this document) for it to
properly display as part of your github repository.

Once you have received feedback on your project proposal (via Canvas)
you may alter this README so that it describes your final project
instead of the project proposal.

## Data Set

Provide a link to your dataset here, and a description of the variables
in the data set.

Link:https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-02-04/games.csv

Description of the variables in the data set:

*year: numeric value for the year in which the football game was played  

*week: numeric value representing the week of the season in which the game was played  
  + NFL Seasons have 17 Weeks
  + WildCard, Division, ConfChamp, and SuperBowl are names for different weeks of the postseason
*home_team: character indicating the team playing at home  

*away_team: character indicating the team playing on the road  

*winner: character indicating the winner of the game  

*tie: character indicating if the game ended in a tie  

+day: character indicating the abbreviated day of the week the game was played
+date: character indicating the date the game was played on
+time: time variable indicating the time the game started
  + times are given in military time and the time zone used is EST
+pts_win: numeric value for the number of points scored by the winning team
+pts_loss: numeric value for the number of points scored by the losing team
+yds_win: numeric value for the number of yards gained by the winning team
+turnovers_win: numeric value for the number of turnovers by the winning team
  + turnovers include fumbles and interceptions, does not include turnovers on downs
+yds_loss: numeric value for the number of yards gained by the losing team
+turnovers_loss: numeric value for the number of turnovers by the losing team
  + turnovers include fumbles and interceptions, does not include turnovers on downs
+home_team_name: character with the name or mascot of the home team
+home_team_city: character with the name of the home team's city
  + some home team cities are actually states or regions, but are the official location of those teams
+away_team_name: character with the name or mascot of the away or road team
+away_team_city: character with the name of the away or road team's city
  + some home team cities are actually states or regions, but are the official location of those teams
  
`##### Load in the Dataset #####
footballgames <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-02-04/games.csv')`

`##### derive categorical variable #####`
`# replace NA's in tie column with string 0
footballgames$tie[is.na(footballgames$tie)] <- "0"`
`# replace ties with string 1 instead of string with team name
for(i in 1:5324){
  if(footballgames$tie[i] != "0"){
    footballgames$tie[i] <- "1"
    i < i+1
  }
  else{
    i <- i+1
  }
}`

`# treat tie as categorical
footballgames$tie <- as.factor(footballgames$tie)`


`# get structure to check if tie is not a factor
str(footballgames)`
`


## Potential Topics to Explore Using the Data Set

Describe avenues you might explore using the data

-Paul: Compare the total number of games won by Denver Broncos to the average number of games won for all teams to see how the broncos are performing compared to other teams.
-Bipin: Prop 1: A line plot of total points won by each team through out the years.
-Bipin: Prop 2: The total number of games won by Denver Broncos through out the years from 2000 to 2019. 
-Bipin: Prop 3: Try modelling points won by yards won in a game.
-Andrew: Derive winning percentage variable and compare winning percentage to super bowl wins.
-Andrew: Compare number of games won by the home team with the number of games won by the away team
-Andrew: Fit a multiple regression model to model number of wins


## Group Members

Andrew Ker, Bipin Poudel, Paulus Hermanto
