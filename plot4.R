options(scipen=9999999)
library(ggplot2)
setwd("C:/Users/Ombre/Documents/Coursera/Data Science Track/Exploratory_data_analysis/exdata-data-NEI_data")
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")

combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]


plot4 <- ggplot(combustionNEI,aes(factor(year),Emissions/10^5)) +
    geom_bar(stat="identity",fill="grey") +
    theme_bw() +  guides(fill=FALSE) +
    labs(x="year", y=expression("Total PM25"*" Emission (10^5 Tons)")) + 
    labs(title=expression("PM 25 Coal Combustion Source Emissions Across US"))

dev.copy(png, "plot4.png")
dev.off()

