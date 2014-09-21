# Assignmment for Data Exploratory Analysis by Sunil Buge

# Read data files using readRDS fucntion
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

# Of the four types of sources indicated by the type (point, nonpoint, onroad,
# nonroad) variable, which of these four sources have seen decreases in
# emissions from 1999-2008 for Baltimore City? Which have seen increases in
# emissions from 1999-2008?
bm.emissions <- NEI[NEI$fips=="24510",]

# Group data by year and type of the source
bm.emissions.aggr <- aggregate(Emissions ~ year + type,
                                  data=bm.emissions,
                                  FUN=sum)

# plot using ggplot2 
library(ggplot2)
# name output file plot3.png 
png("plot3.png", width=640, height=480)
ggplot(bm.emissions.aggr, aes(x=factor(year), y=Emissions, fill=type)) +
        geom_bar(stat="identity") + scale_fill_brewer() +
        facet_grid(. ~ type) +
        xlab("year") +
        ylab(expression("total PM"[2.5]*" emission")) +
        ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore ",
                                           "City by various source types", sep="")))
dev.off()