Scoring App
================

In a season, there are 3 sports: Sporting Clays, Skeet, and 5-Stand. Skeet and 5-Stand have one league each (currently), and Sporting Clays has 3 leagues.

Leagues are made up of teams. Teams are made up of shooters. A shooter can be on more than one team, but only one team per sport.

In a given season, each team consists of 4-6 shooters, and each season consists of a number of weeks. Each week, a shooter files a score. A handicap is calculated by some weird-ass formula, so I have to get that figured out first.

## Scoring Formula

Each league has a par score. We'll use the Winchester League (Sporting Clays) as an example, with a par of 45 (out of 50 total birds).

### Score (SCR), Handicap, and Adjusted Score (ADJ)

Each week, a shooter shoots his round of 50 birds. If he shoots par or higher, his adjusted score (ADJ) for that week will be the same as his score (SCR):

```
Ex. Mark shot a 47, so his ADJ is 47
```

If he shoots lower than par, his Result will be his score plus his handicap up to a maximum of par:

```
Ex. Mark's SCR was a 42, his handicap was a 4, so his ADJ is a 45
```

Handicap is calculated by subtracting the average of the previous two weeks SCR (not ADJ) from par.

Week 1 | Week 2 | Week 3
-- | -- | --
SCR: 35 | SCR: 39 | SCR: 31

The handicap for Week 3 (what gets added to week 3's SCR) is calculated as 8.

```
Par - ((Wk1 SCR + Wk2 SCR) / 2) = Wk3 HCP
45 - ((35 + 39) / 2) = 8
```
*The average always gets rounded up, so if the scores are 40 and 41, the resulting handicap is a 4, not a 5 or 4.5.*

**So, in our Week 1-3 example, Mark's week 3 ADJ would be 31 + 8, or 39.**

*The first two weeks are a special case, because there aren't enough scores banked to make the calculations.*

So in each week, the top 4 ADJ's for each team are used to calculate the team's score.

[IMAGE HERE]

(45 + 44 + 45 + 45) = 179

### First 2 Weeks

All I know right now is that each player has to bank at least one (maybe 2) handicap scores before the season begins, so that would make it pretty easy. We could just have 2 "pre-season" weeks or something.

### Team Points

Each team is paired up against another team during each week of the season. So you can basically consider each week a different "match-up".

[IMAGE]

The idea is that each team should face every other time an equal number of times, as close as possible.

Each team shoots their scores for the week, and the team score is recorded.

[IMAGE]

Teams can either win, lose, tie, or bye. The bye is basically a placeholder team you "play" against, if there are an unequal number of teams. It's like a free week that you automatically win.

[IMAGE]

Then each team gets a point total based on how many wins, losses, ties, and byes they had. Wins and byes are worth 2 points each, ties worth 1, and losses worth 0.

## Data Model

### Sport

* Has many leagues

### League

* Has many teams
* Has many weeks
* Belongs to one sport

### Team

* Has many shooters
* Belongs to one sport

### Shooter

* Has many scores
* Can belong to many sports
* Can belong to many leagues
* Can belong to many teams
* Belongs to one team per sport

### Weeks

* Belong to one league
* Has many scores

### Scores

* Belong to one shooter
* Belong to one team
* Belong to one league
* Belong to one sport
