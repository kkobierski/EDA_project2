options(scipen=9999999)
setwd("C:/Users/Ombre/Documents/Coursera/Data Science Track/Exploratory_data_analysis/exdata-data-NEI_data")
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

NEI2<-subset(NEI, fips=="24510")


agg<-aggregate(Emissions~year, NEI2, sum, scientific=F)
plot1<-barplot(height=agg$Emissions, names.arg=agg$year, xlab="year", ylab="PM25 emissions[tons]", main="PM25 emissions per year/Balimore City")
dev.copy(png, "plot2.png")
dev.off()

