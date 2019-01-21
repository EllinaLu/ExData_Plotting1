png(filename = "figure/plot4.png",width = 480,height = 480)
par(mfrow=c(2,2),mar=c(4,4,4,2))
raw <- subset(read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = "."), Date== "1/2/2007" | Date == "2/2/2007")
raw$Global_active_power <- as.numeric(as.character(raw$Global_active_power))
raw$NewTime <- as.POSIXct(strptime(paste(raw$Date, raw$Time, sep=" "), format = "%e/%m/%Y %H:%M:%S"))
Sys.setlocale("LC_TIME", "English")

plot(raw$Global_active_power ~ raw$NewTime, type="l", ylab = "Global Active Power", xlab = "")

with(raw, plot(as.numeric(as.character(Voltage)) ~ NewTime, type="l", ylab = "Voltage", xlab = "datetime"))

with(raw, plot(NewTime,as.numeric(as.character(Sub_metering_1)),type="l", xlab="",ylab="Energy sub metering", ylim=c(0, 38)))
lines(raw$NewTime, as.numeric(as.character(raw$Sub_metering_2)), col="red")
lines(raw$NewTime, as.numeric(as.character(raw$Sub_metering_3)), col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty="n", cex=0.9)

with(raw, plot(as.numeric(as.character(Global_reactive_power)) ~ NewTime, type="l", ylab = "Global_reactive_power", xlab = "datetime", lty = 1, lwd=0.5))

dev.off()