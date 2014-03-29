Scoring App
================

In a season, there are 3 sports: Sporting Clays, Skeet, and 5-Stand. Skeet and 5-Stand have one league each (currently), and Sporting Clays has 3 leagues.

Leagues are made up of teams. Teams are made up of shooters. A shooter can be on more than one team, but only one team per sport.



## Sport

* Has many leagues

## League

* Has many teams
* Belongs to one sport

## Team

* Has many shooters
* Belongs to one sport

## Shooter

* Has many scores
* Can belong to many sports
* Can belong to many leagues
* Can belong to many teams
* Belongs to one team per sport

## Scores

* Belong to one shooter
* Belong to one team
* Belong to one league
* Belong to one sport
