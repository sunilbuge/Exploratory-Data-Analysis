# Assignmment for Data Exploratory Analysis by Sunil Buge

# Read data files using readRDS fucntion
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 

# Get Baltimore emissions numbers from motor vehicle sources
bm.emissions <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
bm.emissions.aggr <- aggregate(Emissions ~ year, data=bm.emissions, FUN=sum)

# plot using ggplot2 
library(ggplot2)
# name output file plot5.png 
png("plot5.png", width=640, height=480)
ggplot(bm.emissions.aggr, aes(x=factor(year), y=Emissions)) +
        geom_bar(stat="identity",fill = "lightgreen",, color="green") +
        xlab("year") +
        ylab(expression("total PM"[2.5]*" emissions")) +
        ggtitle("Emissions from on road vehicle sources in Baltimore City")
dev.off()