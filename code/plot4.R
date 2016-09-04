#create Plot3 graph Energy submetering versus day of week
data<- read.table("household_power_consumption.txt", sep=";", header=T,
                  colClasses = "character", na.strings = "?")
library(magrittr)
data$Date <- as.Date(data$Date, "%d/%m/%Y") %>% as.character()
data$Date_Time <- apply(data[,1:2],1, paste, collapse = " ")
data[,3:9] <- lapply(data[,3:9], as.numeric)
data$Date_Time<- strptime(data$Date_Time, "%Y-%m-%d %H:%M:%S", tz = "EST")
data2plot <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02"  ,] 

#Plot 4 Combinations save as "plot4.png"
png(filename = "plot4.png", width = 480, height = 480)

par(mfcol=c(2,2))
## plot 2
plot(data2plot$Date_Time, data2plot$Global_active_power, ylim=c(0,8), type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
## plot 3
plot(data2plot$Date_Time, data2plot$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy submetering",ylim=c(0,40))
par(new=T)
plot(data2plot$Date_Time, data2plot$Sub_metering_2, type="l", col="red",
     xlab="", ylab="Energy submetering",ylim=c(0,40))
par(new=T)
plot(data2plot$Date_Time, data2plot$Sub_metering_3, type="l", col="blue",
     xlab="", ylab="Energy submetering",ylim=c(0,40))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        col=c("black", "red","blue"), lty=1,cex=0.7)
## Voltage versus date time
plot(data2plot$Date_Time, data2plot$Voltage, type="l", col="black",
     xlab="datetime", ylab="Voltage",ylim=c(230,250))
## Global_reactive_power versus date time
plot(data2plot$Date_Time, data2plot$Global_reactive_power, type="l", col="black",
     xlab="datetime",ylab="Global_reactive_power", ylim=c(0,0.5))
dev.off()
