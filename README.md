Scoring App
================

In a season, there are 3 sports: Sporting Clays, Skeet, and 5-Stand. Skeet and 5-Stand have one league each (currently), and Sporting Clays has 3 leagues.

Leagues are made up of teams. Teams are made up of shooters. A shooter can be on more than one team, but only one team per sport.

In a given season, each team consists of 4-6 shooters, and each season consists of a number of weeks. Each week, a shooter files a score. A handicap is calculated by some weird-ass formula, so I have to get that figured out first.

## Scoring Formula

** Take a look at last year's [score results](https://github.com/digitalworkbox/clay_score/blob/master/Winchester%20Sporting%20Clays%202013.xls). This has all the formulas, but it's password-protected and I don't know the password. Also, it should be noted that it may not be 100% accurate, so trust your gut and my notes below if the math on the sheet doesn't seem to add up.**

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

![team scores for the week](http://monosnap.com/image/fEglPeCnoUun0GjgRbWyS2hPJVIIW9.png)

(45 + 44 + 45 + 45) = 179

### First 2 Weeks

Since handicap needs 2 previous weeks of data, the first 2 weeks wouldn't work without some special treatment. Mark gets around this by using special handicap scores (for new shooters) or a previous year's average (for returning shooters).

#### New Shooters

For shooters who have **never** participated in league before (in previous years), two handicap scores must be logged.

#### Returning Shooters

Returning shooters use their previous year's shooting average as their "preseason score". *i.e. average of last year's SCRs*

### Missing Weeks

This is the biggest issue Mark has with his current spreadsheet. If a shooter misses a week, his SCR should be 80% of his previous two weeks scores. As a result, his handicap gets unfairly weighted since you're now averaging a "normal" score and a "discounted" score.

What would be ideal is a "missed week" option that:

1. Automatically calculates the 80% score for the missed week
2. Is ignored by the handicap caluclation

The handicap calculation would then use the previous 2 non-missed scores.

### Team Points

Each team is paired up against another team during each week of the season. So you can basically consider each week a different "match-up".

![team match-ups](http://monosnap.com/image/3pDZaFacxXWA6awF1LIMyMO2thpBi4.png)

The idea is that each team should face every other time an equal number of times, as close as possible.

Each team shoots their scores for the week, and the team score is recorded.

![team scores](http://monosnap.com/image/qlKO55aoPkanoHD6tGLLES9qQWcu5k.png)

Teams can either win, lose, tie, or bye. The bye is basically a placeholder team you "play" against, if there are an unequal number of teams. It's like a free week that you automatically win.

![team results](http://monosnap.com/image/Ys3w5um6qXQQSXA7v3wZy6Ylga8sqQ.png)

Then each team gets a point total based on how many wins, losses, ties, and byes they had. Wins and byes are worth 2 points each, ties worth 1, and losses worth 0.

## Differences between sports

As of this writing, I only have enough information to discuss Sporting Clays. I **think** Skeet and 5-Stand are very similar as far as scoring is concerned, but we may want to think about providing a way to "customize" the scoring formula by sport, even if its just uploading a JSON file or something that's written by me.

## Data Model

### Sport

* Has many leagues
* Has a scoring formula (?)

### League

* Has many teams
* Has many weeks
* Belongs to one sport
* Has a year

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
