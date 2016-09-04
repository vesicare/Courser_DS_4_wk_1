#create Plot3 graph Energy submetering versus day of week
data<- read.table("household_power_consumption.txt", sep=";", header=T,
                  colClasses = "character", na.strings = "?")
library(magrittr)
data$Date <- as.Date(data$Date, "%d/%m/%Y") %>% as.character()
data$Date_Time <- apply(data[,1:2],1, paste, collapse = " ")
data[,3:9] <- lapply(data[,3:9], as.numeric)
data$Date_Time<- strptime(data$Date_Time, "%Y-%m-%d %H:%M:%S", tz = "EST")
data2plot <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02"  ,] 

#Plot 3 Energy submetering versus Day of Week and save as "plot3.png"
png(filename = "plot3.png", width = 480, height = 480)
plot(data2plot$Date_Time, data2plot$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy submetering",ylim=c(0,40))
par(new=T)
plot(data2plot$Date_Time, data2plot$Sub_metering_2, type="l", col="red",
     xlab="", ylab="Energy submetering",ylim=c(0,40))
par(new=T)
plot(data2plot$Date_Time, data2plot$Sub_metering_3, type="l", col="blue",
     xlab="", ylab="Energy submetering",ylim=c(0,40))

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        col=c("black", "red","blue"), lty=1)
dev.off()