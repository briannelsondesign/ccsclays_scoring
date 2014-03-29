Scoring App
================

In a season, there are 3 sports: Sporting Clays, Skeet, and 5-Stand. Skeet and 5-Stand have one league each, and Sporting Clays has 3 leagues.

Leagues are made up of teams. A team can be in more than one sport, but only in one league per sport. (For example, the Loose Cannons can compete in Sporting Clays and Skeet, but not in Sporting Clays League 1 and Sporting Clays League 2)

That being said, teams can have different rosters per sport, so the only thing a team really has in common across sports is the name and (probably) some of the shooters.

So there might not really be a point in having the *same* team actually exist across sports. I'm ok with having unique teams with the same name if that's easier.

## Sport

* Has many leagues

## League

* Has many teams

## Team

* Has many shooters

## Shooter

* Belongs to many teams
* Has many scores
