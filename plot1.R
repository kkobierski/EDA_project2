options(scipen=9999999)
setwd("C:/Users/Ombre/Documents/Coursera/Data Science Track/Exploratory_data_analysis/exdata-data-NEI_data")
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
year<-NEI$year
poll<-NEI$Emissions
agg<-aggregate(Emissions~year, NEI, sum, scientific=F)
format(agg, scientific=F)
plot1<-barplot(height=agg$Emissions, names.arg=agg$year, xlab="year", ylab="PM25 emissions[tons]", main="PM25 emissions per year")
dev.copy(png, "plot1.png")
dev.off()
