options(scipen=9999999)
library(ggplot2)
setwd("C:/Users/Ombre/Documents/Coursera/Data Science Track/Exploratory_data_analysis/exdata-data-NEI_data")
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

baltimore <- vehiclesNEI[vehiclesNEI$fips=="24510",]
baltimore$city <- "Baltimore City"

vehiclesLANEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
vehiclesLANEI$city <- "Los Angeles County"

labc <- rbind(baltimore,vehiclesLANEI)



plot6<-ggplot(labc, aes(x=factor(year), y=Emissions, fill=city)) +
    geom_bar(aes(fill=year),stat="identity") +
    facet_grid( .~city) +
    guides(fill=FALSE)  +
    labs(x="year", y=expression("Total PM 25 Emission [Kilo-Tons]")) + 
    labs(title=expression("PM 25 Motor Vehicle Source Emissions in BC & LA"))


dev.copy(png, "plot6.png")
dev.off()
