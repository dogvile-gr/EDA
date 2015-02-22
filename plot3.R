# Script Name: plot3.R
## Version: 1.0_14


install.packages("devtools")  # so we can install from github
library("devtools")
install_github("ropensci/plotly")  # plotly is part of ropensci
library(plotly)
py <- plotly(username="r_user_guide", key="mw5isa4yqp")  # open plotly 


## Libraries needed:
install.packages("ggplot2")
install.packages("reshape2")
library(ggplot2)
library(plyr)
library(reshape2)
## Step 1: read in the data
NEI <- readRDS("expdata_prj2/summarySCC_PM25.rds")
SCC <- readRDS("expdata_prj2/Source_Classification_Code.rds")


##Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.



## Step 2: subset our data
baltimore <- subset (NEI, fips == "24510")
PM25 <- ddply(baltimore, .(year, type), function(x) sum(x$Emissions))


vout <- aggregate(PM25,by=list(PM25$Emissions),FUN=sum)


## Rename the col: Emissions
colnames(PM25)[3] <- "Emissions"



ggplot(PM25, aes(x=PM25$year, y=PM25$Emissions,colour=PM25$type, group=PM25$type,fill=PM25$type)) +
        geom_line()+
        geom_point(size=4, shape=21)



py$ggplotly()






