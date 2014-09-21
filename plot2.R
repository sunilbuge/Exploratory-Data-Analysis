# Assignmment for Data Exploratory Analysis by Sunil Buge

# Read data files using readRDS fucntion
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in Baltimore City, Maryland from
# 1999 to 2008?
bm.emissions <- NEI[NEI$fips=="24510",]
# group emissions by year
bm.emissions.by.year <- aggregate(Emissions ~ year, bm.emissions, sum)


# plot using ggplot2 
library(ggplot2)
# name output file plot2.png 
png("plot2.png", width=640, height=480)
barplot(height=bm.emissions.by.year$Emissions,
        names.arg=bm.emissions.by.year$year,
        xlab="years", ylab=expression('total PM'[2]*' emission'),
        main=expression('Total PM'[2]*' emissions in Baltimore City, '*
                                'Maryland at various years'),col = "red")
dev.off()