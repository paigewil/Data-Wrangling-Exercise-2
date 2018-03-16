library(dplyr)

# Step 0: Load the data in RStudio
df <- read.csv("E:/Learning/Springboard Intro to Data Science/exercises/data_wrangling_exercise2/titanic_original.csv", stringsAsFactors = FALSE)

#Step 1: Port of embarkation
df$embarked <- gsub(pattern = "^$", replacement = "S", df$embarked)

#Step 2: Age
mean_age <- mean(df$age, na.rm = TRUE)
df$age[which(is.na(df$age))] <- mean_age

# 2.Think about other ways you could have populated the missing values in the age column. Why would you pick any of those over the mean (or not)?
# Could have used median, since it's not skewed by very old or very young values, so is a more "middle value"
# Can leave as is and do calculations with na.rm = TRUE
# Could have used mode since it's the most common value and adding more ages with that age will keep it as the mode

#Step 3: Lifeboat
df$boat <- gsub(pattern = "^$", replacement = "None", df$boat)

#Step 4: Cabin
# Does it make sense to fill missing cabin numbers with a value?
# No, there are a lot of options for and variables that go into someone's cabin location: side of the boat (front or back), level (associated with class), size (based on family size), so it's a big assumption to infer someone's cabin
# and there isn't one "mean"/general value that could be used as a filler
# Also, because cabins are associated with other variables like pclass, so as long as you have those other variables populated, you can glean some useful (and related) information about that person
#
# What does a missing value here mean?
# A missing value here is a blank value and it means the cabin number for that individual isn't available/known because it doesn't exist in historical documentation or it's not in this particular data set

has_cabin_number <- ifelse(df$cabin == "", 1, 0)


#out file
write.csv(file = "E:/Learning/Springboard Intro to Data Science/exercises/data_wrangling_exercise2/titanic_clean.csv", x=df)
