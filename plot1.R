# Assignmment for Data Exploratory Analysis by Sunil Buge

# Read data files using readRDS fucntion
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the United States from 1999 to
# 2008?
total.emissions <- aggregate(Emissions ~ year, NEI, sum)

# plot using ggplot2 
library(ggplot2)
# name output file plot1.png
png("plot1.png", width=640, height=480)
barplot(height=total.emissions$Emissions, names.arg=total.emissions$year,
        xlab="years", ylab=expression('total PM'[2]*' emission'),
        main=expression('Total PM'[2]*' emissions at various years'),col = rainbow(20))
dev.off()