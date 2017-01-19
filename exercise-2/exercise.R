# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100)
# Hint: use the `paste()` function to produce the list
employees <- paste("Employee", 1:100)

# Create a vector of 100 random salaries for the year 2014
# Use the `runif()` function to pick a random number between 40000 and 50000
year.2014.salaries <- runif(100, 40000, 50000)

# Create a vector of 100 salaries in 2015 that have increased from 2014 by some amount
# Hint: use `runif()` to add a random number to 2014's salaries. Starting from a
# _negative_ number so that salaries may decrease!
year.2015.salaries <- year.2014.salaries + runif(100, -5000, 10000)

# Create a data.frame 'salaries' by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!
salaries <- data.frame(employees, year.2014.salaries, year.2015.salaries, stringsAsFactors = FALSE)

# Create a column 'raise' that stores the size of the raise between 2014 and 2015
salaries$raise <- year.2015.salaries - year.2014.salaries

# Create a column 'got.raise' that is TRUE if the person got a raise
salaries$got.raise <- year.2015.salaries > year.2014.salaries

### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2015 salary of employee 57
employee.57.salary <- round(salaries[57, 3], 2)

# How many employees got a raise?
amount.got.raise <- length(salaries$got.raise[salaries$got.raise == TRUE])

# What was the value of the highest raise?
highest.raise <- round(max(salaries$raise),2)

# What was the "name" of the employee who received the highest raise?
highest.raise.name <- salaries$employees[salaries$raise == max(salaries$raise)]

# What was the largest decrease in salaries between the two years?
biggest.decrease <- min(salaries$raise)

# What was the name of the employee who recieved largest decrease in salary?
biggest.decrease.name <- salaries$employees[salaries$raise == biggest.decrease]
# What was the average salary increase?


### Bonus ###

# Write a .csv file of your salaries to your working directory
write.csv(salaries, file = "../exercise-2/Salaries.csv")
View(salaries)
# For people who did not get a raise, how much money did they lose?


# Is that what you expected them to lose based on how you generated their salaries?
