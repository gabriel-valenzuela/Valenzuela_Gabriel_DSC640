
# import libraries

library(plotly)

# import data

education <- read.csv('education.csv')
head(education)

birthRate <- read.csv('birth-rate.csv')
head(birthRate)

# Histogram
math_scores <- education$math
hist(math_scores,main="Distribution of Math Scores in the U.S.",
     xlab="Scores")

# Box Plot
boxplot(math_scores,data=education, main="Distribution of Math Scores in the U.S.",
        xlab="Math", ylab="Scores") 

# Bullet Plot
plotly::plot_ly(
  type = "indicator",
  mode = "number+gauge+delta",
  gauge = list(shape = "bullet"),
  value = 14.60,
  domain = list(x = c(0, 1), y = c(0, 1)),
  title= list(text = "U.S. Birth Rate"),
  height = 150)

