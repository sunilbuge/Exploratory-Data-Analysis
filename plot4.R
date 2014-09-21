# Assignmment for Data Exploratory Analysis by Sunil Buge

# Read data files using readRDS fucntion
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999 to 2008?

# Find coal combustion-related sources
is.combustion.coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
combustion.coal.sources <- SCC[is.combustion.coal,]

# Find emissions from coal combustion-related sources
emissions <- NEI[(NEI$SCC %in% combustion.coal.sources$SCC), ]

# group by year
emissions.by.year <- aggregate(Emissions ~ year, data=emissions, FUN=sum)

# plot using ggplot2 
library(ggplot2)
# name output file plot4.png 
png("plot4.png", width=640, height=480)
ggplot(emissions.by.year, aes(x=factor(year), y=Emissions)) +
        geom_bar(stat="identity",fill = "lightblue", color="blue") +
        xlab("year") +
        ylab(expression("total PM"[2.5]*" emissions")) +
        ggtitle("Emissions from coal combustion-related sources")
dev.off()
