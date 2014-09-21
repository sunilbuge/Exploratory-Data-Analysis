# Assignmment for Data Exploratory Analysis by Sunil Buge

# Read data files using readRDS fucntion
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

# Compare emissions data from motor vehicles at Baltimore City vs
# Los Angeles to conclude trends over 10 years

# create two subsets by applying filter and sum emissions values
# fips code is 24510 for Baltimore City
bm.emissions <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
bm.emissions.aggr <- aggregate(Emissions ~ year, data=bm.emissions, FUN=sum)

# fips code is 06037 for Los Angeles
la.emissions <- NEI[(NEI$fips=="06037") & (NEI$type=="ON-ROAD"),]
la.emissions.aggr <- aggregate(Emissions ~ year, data=la.emissions, FUN=sum)

bm.emissions.aggr$County <- "Baltimore City, MD"
la.emissions.aggr$County <- "Los Angeles County, CA"
both.emissions <- rbind(bm.emissions.aggr, la.emissions.aggr)

# plot using ggplot2 
library(ggplot2)
# name output file plot6.png 
png("plot6.png", width=640, height=480)
ggplot(both.emissions, aes(x=factor(year), y=Emissions, fill=County)) +
        geom_bar(stat="identity") + 
        scale_fill_brewer(palette="Spectral") +
        facet_grid(County  ~ ., scales="free") +
        ylab("total emissions (tons)") + 
        xlab("year") +
        ggtitle(expression("Motor vehicle emission comparision between Baltimore and Los Angeles"))
dev.off()