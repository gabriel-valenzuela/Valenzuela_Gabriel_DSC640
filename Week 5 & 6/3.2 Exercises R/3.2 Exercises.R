# import libraries

suppressWarnings(library(ggplot2))
library(hexbin)
library(dplyr)
library(gapminder)

# import data

crime <- read.csv('crimerates-by-state-2005.csv')
head(crime)

crime_state <- crime[!(crime$state=='United States'),]
#crime_state <- crime[!(crime$state=='District of Columbia'),]

pop <- crime_state$population
rob <- crime_state$robbery
state <- crime_state$state

# Scatter Plot

axs <- ggplot(crime_state, aes(pop, rob)) + geom_point() + labs(x = 'Population', y = 'Robberies') + ggtitle('Robbery by Population')
suppressWarnings(axs + scale_x_continuous(breaks = c(10000000, 20000000, 30000000), labels = c('1M', '2M', '3M')))

# Bubble Plot

suppressMessages(ggplot(crime_state, aes(pop, rob, size = state, color = state)) + geom_point(alpha = 0.8) + labs(x = 'Population', y = 'Robberies') + ggtitle('Robbery by Population')+ scale_x_continuous(breaks = c(10000000, 20000000, 30000000), labels = c('1M', '2M', '3M')))


# Density Plot
ggplot(crime_state, aes(pop, rob)) + geom_hex(bins = 25) + scale_fill_continuous(type = "viridis") + theme_bw()+ labs(x = 'Population', y = 'Robberies') + ggtitle('Robbery by Population')+ scale_x_continuous(breaks = c(10000000, 20000000, 30000000), labels = c('1M', '2M', '3M'))

