## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

baltimore <- subset (NEI, fips == "24510")
baltimore_sum <- tapply(baltimore$Emissions, baltimore$year, sum)
png("plot2.png")
par(pch=26, col="black")
plot(names(baltimore_sum), baltimore_sum, type = "l", xlab="Year", ylab= expression("Total" ~ PM[2.5] ~ "Emissions (tons)"), main=expression("Total for Baltimore City" ~ PM[2.5] ~ "Emissions by Year"), lwd = 2,col="coral1")
dev.off()  


