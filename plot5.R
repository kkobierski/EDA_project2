options(scipen=9999999)
library(ggplot2)
setwd("C:/Users/Ombre/Documents/Coursera/Data Science Track/Exploratory_data_analysis/exdata-data-NEI_data")
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

baltimore <- vehiclesNEI[vehiclesNEI$fips=="24510",]


plot5 <- ggplot(baltimore,aes(factor(year),Emissions)) +
    geom_bar(stat="identity",fill="grey") +
    theme_bw() +  guides(fill=FALSE) +
    labs(x="year", y=expression("Total PM 25 Emission (10^5 Tons)")) + 
    labs(title=expression("PM 25 Motor Vehicle Source Emissions in Baltimore"))

dev.copy(png, "plot5.png")
dev.off()
