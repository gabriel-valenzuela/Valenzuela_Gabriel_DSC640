

# import libraries and data
library(ggplot2)
library(readxl)

hotdog_data <- read_excel("hotdog-contest-winners.xlsm")
head(hotdog_data)



# Bar Chart
counts <- table(hotdog_data$Country)
barplot(counts, main='Country Winners')



# Stacked Bar Chart
ggplot2::ggplot(hotdog_data, ggplot2::aes(fill=hotdog_data$Year, y = hotdog_data$`Dogs eaten`, x= hotdog_data$Country)) + ggplot2::geom_bar(position = "stack", stat = "identity") + ggplot2::ggtitle('Total Hotdogs Eaten by Country') + ggplot2::xlab('Winning Countries') + ggplot2::ylab('Hotdogs Eaten') + ggplot2::labs(fill='Winning Year')



# Pie Chart
slices <- c(499.85, 369.88, 19.50, 9.50)
lbls <- c('United States', 'Japan', 'Mexico', 'Germany')
pie(slices, labels = lbls, main='Total hotdogs eaten by winning countries')



# Donut Pie Chart
data <- data.frame(category=c('United States', 'Japan', 'Mexico', 'Germany'), count=c(499.85, 369.88, 19.50, 9.50))
data$fraction <- data$count / sum(data$count)
data$ymax <- cumsum(data$fraction)
data$ymin <- c(0, head(data$ymax, n=-1))
data$labelPosition <- (data$ymax + data$ymin) / 2
data$label <- paste0(data$category, "\n value: ", data$count)


ggplot2::ggplot(data, ggplot2::aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=category)) + ggplot2::geom_rect() + ggplot2::geom_text(x=2, ggplot2::aes(y=labelPosition, label=label, color=category), size=6) + ggplot2::scale_fill_brewer(palette=3) + ggplot2::scale_color_brewer(palette = 3) + ggplot2::coord_polar(theta = "y") + ggplot2::xlim(c(-1,4)) + ggplot2::theme_void() 



# Line Chart
ggplot2::ggplot(hotdog_data, ggplot2::aes(x=hotdog_data$Year, y=hotdog_data$`Dogs eaten`)) + ggplot2::geom_line() + ggplot2::xlab("Years of Competition") + ggplot2::ylab("Number of Hotdogs Eaten") + ggplot2::ggtitle("Number of Hotdogs Eaten by Winner each Year")
                
                