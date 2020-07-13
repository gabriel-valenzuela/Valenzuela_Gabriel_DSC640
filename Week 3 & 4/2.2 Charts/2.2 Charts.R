# import libraries

library(ggplot2)
library(treemap)

# import data

unemployment <- read.csv('unemployement-rate-1948-2010.csv')
head(unemployment)

# Tree Map

treemap(unemployment, index='Year', vSize='Value', type='index', title='Unemployment Rate by Year')

# Area Chart

suppressWarnings(unemployment_year_avg <- aggregate(unemployment, list(unemployment$Year), mean))
head(unemployment_year_avg)

ggplot2::ggplot(unemployment_year_avg, aes(x=unemployment_year_avg$Year, y=unemployment_year_avg$Value)) + ggplot2::geom_area(fill="#69b3a2", alpha=0.4) + ggplot2::geom_line(color="#69b3a2", size=2) + ggplot2::geom_point(size=3, color="#69b3a2") + ggplot2::ggtitle('Average Unemployment Rate per Year') + ggplot2::xlab('Year') + ggplot2::ylab('Unemployment Rate')

# Stacked Area Chart

suppressWarnings(unemployment_period_avg <- aggregate(unemployment, list(unemployment$Period, unemployment$Year), mean))
unemployment_period_avg$Years <- round(unemployment_period_avg$Year)
head(unemployment_period_avg)

ggplot2::ggplot(unemployment_period_avg, aes(x=unemployment_period_avg$Years, y=unemployment_period_avg$Value, fill=unemployment_period_avg$Group.1)) + ggplot2::geom_area() + ggplot2::xlab('Year') + ggplot2::ylab('Unemployment Rate') + ggplot2::ggtitle('Average Unemployment Rate by Year per Period') + ggplot2::labs(fill='Periods')

# Step Chart

plot(unemployment_year_avg$Year, unemployment_year_avg$Value, type = 's', xlab = 'Year', ylab = 'Unemployment Rate', main = 'Average Unemployment Rate by Year') 
     
     