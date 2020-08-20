# import libraries

suppressWarnings(library(ggplot2))
library(hexbin)
library(dplyr)
library(gapminder)
library(ggmap)
library(maps)
library(mapdata)
library(plot3D)
library(plotly)

# import data

nba <- read.csv('ppg2008.csv')
head(nba)

costco <- read.csv('costcos-geocoded.csv')
head(costco)

# Heat Map
select(nba, -1)
#nba <- as.numeric(nba)
nba_matrix <- data.matrix(nba)
heatmap(nba_matrix, Colv = NA, Rowv = NA, scale='column',xlab="Stats", ylab="Values", main="NBA Stats of 2008 Season")

# Spatial Chart
bc_bbox <- ggmap::make_bbox(lat = max(costco$Latitude), lon = max(costco$Longitude), data = costco)


# Contour Plot
x=nba$PTS
y=nba$MIN
z=nba$AST
df <- data.frame(x=x,y=y,z=z)
p <- plotly::plot_ly(data = df, x=~x,y=~y, z=~z, type = "contour", colorscale='Jet')
p



