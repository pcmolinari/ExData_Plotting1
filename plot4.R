png(file="plot4.png")

newfile <- subset(read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?"), Date == "1/2/2007" | Date == "2/2/2007")
sapply(newfile,class)
newfile$Time  <- strptime(paste(newfile$Date,newfile$Time),format = "%d/%m/%Y %H:%M:%S", tz = "")
newfile$Date <- as.Date(newfile$Date,"%d/%m/%Y")
sapply(newfile,class)

##mfrow tells 2 x 2 graphics = total 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))



## first quadrant
library(datasets)
 plot(newfile$Time, newfile$Global_active_power, type="n")
 lines(newfile$Time, newfile$Global_active_power)
##title(ylab="Global Active Power")





## 2 quadrant

 plot(newfile$Time, newfile$Voltage, type="n")
 lines(newfile$Time, newfile$Voltage)
##title(ylab="Voltage", xlab="datetime")



## 3RD quadrant
with(newfile, plot(Time, Sub_metering_1, type="n"))
with(newfile, lines(Time,Sub_metering_1), col="red")
with(newfile, lines(Time,Sub_metering_2), col="blue")
with(newfile, lines(Time,Sub_metering_3), col="green")
##title(ylab="Energy sub metering" )

### last quadrant of plot4
 plot(newfile$Time, newfile$Global_reactive_power, type="n")
 lines(newfile$Time, newfile$Global_reactive_power)
##title(ylab="Global_reactive_power", xlab="datetime")

dev.off()