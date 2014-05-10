power.consumption <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", check.names=T)
power <- power.consumption[power.consumption$Date=="1/2/2007" | power.consumption$Date=="2/2/2007",]
power$Datetime = strptime(paste(power$Date, power$Time), "%e/%m/%Y %H:%M:%S")

png(filename="plot1.png", height=480, width=480)
with(power, 
     hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
     )
dev.off()