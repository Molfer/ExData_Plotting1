power.consumption <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", check.names=T)
power <- power.consumption[power.consumption$Date=="1/2/2007" | power.consumption$Date=="2/2/2007",]
power$Datetime = strptime(paste(power$Date, power$Time), "%e/%m/%Y %H:%M:%S")

png(filename="plot2.png", height=480, width=480)
with(power, 
     plot(Datetime,Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
)
dev.off()