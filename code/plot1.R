#create Plot1 graph Global Active Power
data<- read.table("household_power_consumption.txt", sep=";", header=T,
                  colClasses = "character", na.strings = "?")
library(lubridate, dplyr); library(magrittr)
data$Date <- data$Date %>% dmy()

data[,3:9] <- lapply(data[,3:9], as.numeric)

data2analyze <- data[data$Date == "2007-02-01" |data$Date == "2007-02-02"  ,] 

#Plot 1 save an image file named "plot1.png"
png(filename = "plot1.png", width = 480, height = 480)
with(data2analyze, hist(Global_active_power, 
                        xlab="Global Active Power (kilowatts)",
                        main="Global Active Power", col="red"))
dev.off()
