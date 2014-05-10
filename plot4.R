power.consumption <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", check.names=T)
power <- power.consumption[power.consumption$Date=="1/2/2007" | power.consumption$Date=="2/2/2007",]
power$Datetime = strptime(paste(power$Date, power$Time), "%e/%m/%Y %H:%M:%S")

png(filename="plot4.png", height=480, width=480, bg="transparent")
par(mfcol=c(2,2))

with(power, 
     plot(Datetime,Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
)

plot(power$Datetime, power$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(power$Datetime, power$Sub_metering_1, col="black")
lines(power$Datetime, power$Sub_metering_2, col="red")
lines(power$Datetime, power$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lwd=1, box.lwd=1, box.col="transparent", bg="transparent",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

with(power, 
     plot(Datetime,Voltage, type="l", ylab="Voltage", xlab="datetime")
)

with(power, 
     plot(Datetime,Global_reactive_power, type="l", , xlab="datetime")
)

dev.off()