# Exercise 6: Husky Football 2015 Season
# Read in the Husky Football 2015 game data into a variable called `husky.games.2015`
husky.games.2015 <- read.csv("data/huskies_2015.csv", stringsAsFactors = FALSE)


# Create a vector of the teams that the Huskies played against during that season
teams.played <- husky.games.2015$opponent


# Create a vector of the their final scores for the games
# Call this variable `husky.scores`
husky.scores <- husky.games.2015$uw_score


# Create 2 variables called `rushing.yards` and `passing.yards` to represent the yards the Huskies rushed and passed
rushing.yards <- husky.games.2015$rushing_yards
passing.yards <- husky.games.2015$passing_yards

# Create a variable called `combined.yards` that is the total yardage of the Huskies for each game
combined.yards <- rushing.yards + passing.yards


# Add the `combined.yards` vector to the dataframe with the column name being `combined`
husky.games.2015$combined <- combined.yards


# Write the dataframe to a new `.csv` file called `huskies_2015_improved.csv` into the `data directory`
write.csv(husky.games.2015, file = "data/huskies_2015_improved.csv")


# What is the score of the game where the Huskies had the most combined yards?
print(paste(husky.games.2015$uw_score[combined.yards == max(combined.yards)], "-", husky.games.2015$opponent_score[combined.yards == max(combined.yards)]))

# Define a function `MostYardsScore` that takes in an argument `games` (a data frame) and
# returns a descriptive sentence about the game that was played that had the most yards scored in it.
MostYardsScore <- function(games) {
  index <- match(max(games$combined), games$combined)
  return(paste("The game that had the highest total combined yards was against", 
               games$opponent[index], "with a final score of",
         games$uw_score[index], "-", 
         games$opponent_score[index]))
}
print(MostYardsScore(husky.games.2015))

# Challenge!
# What was the highest yardage game so far this season?
# Hint: Read in the dataset titled `huskies_2016.csv` and save it as a variable
husky.games.2016 <- read.csv("data/huskies_2016.csv", stringsAsFactors = FALSE)
combined.yards <- husky.games.2016$rushing_yards
print(MostYardsScore(husky.games.2016))