#create Plot1 graph Global Active Power
data<- read.table("household_power_consumption.txt", sep=";", header=T,
                  colClasses = "character", na.strings = "?")
library(magrittr)
data$Date <- as.Date(data$Date, "%d/%m/%Y") %>% as.character()
data$Date_Time <- apply(data[,1:2],1, paste, collapse = " ")
 
data$Date_Time<- strptime(data$Date_Time, "%Y-%m-%d %H:%M:%S", tz = "EST")
data[,3:9] <- lapply(data[,3:9], as.numeric)

data2analyze <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02"  ,] 

#Plot Global Acvive Power versus Day of Week and save as "plot2.png"
png(filename = "plot2.png", width = 480, height = 480)
plot(data2analyze$Date_Time, data2analyze$Global_active_power, ylim=c(0,8), type="l",
             xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
