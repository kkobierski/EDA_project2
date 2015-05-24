options(scipen=9999999)
library(ggplot2)
setwd("C:/Users/Ombre/Documents/Coursera/Data Science Track/Exploratory_data_analysis/exdata-data-NEI_data")
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

NEI2<-subset(NEI, fips=="24510")


agg<-aggregate(Emissions~year +type, NEI2, sum, scientific=F)


plot3<-ggplot(agg, aes(year, Emissions, colour=type, LWD =2)) +geom_line(size=1)+labs(title="Baltimore City - emmisions per source")

dev.copy(png, "plot3.png")
dev.off()
