##This R code constructs Plot 4

##Read the data. (Assumes file is in working directory)

data <- read.table("household_power_consumption.txt", header=TRUE, sep=';')
df <- data.frame(date_time = paste(data$Date, data$Time), data)
data$date_time <- strptime(df$date_time,"%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subData <- data[(data$Date >= "2007-02-01") & (data$Date <= "2007-02-02"),]


##Creates the plot as a PNG file.

png(filename="plot4.png", width=480,height=480, units="px")
par(mfrow=c(2,2))

##Top left plot
plot(subData$date_time,as.numeric(as.character(subData$Global_active_power)),
	type="n", xlab="",ylab="Global Active Power (kilowatts)")
lines(subData$date_time,as.numeric(as.character(subData$Global_active_power)))

##Top right plot
plot(subData$date_time,as.numeric(as.character(subData$Voltage)),
	type="n", xlab="datetime",ylab="Voltage")
lines(subData$date_time,as.numeric(as.character(subData$Voltage)))

##Lower left plot
plot(subData$date_time,as.numeric(as.character(subData$Sub_metering_1)),type="n",
	xlab="", ylab="Energy sub metering")
lines(subData$date_time,as.numeric(as.character(subData$Sub_metering_1)))
lines(subData$date_time,as.numeric(as.character(subData$Sub_metering_2)),col="red")
lines(subData$date_time,as.numeric(as.character(subData$Sub_metering_3)),col="blue")
legend("topright", col=c("black","red","blue"), lty=1, bty="n",
	legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Lower right plot
plot(subData$date_time,as.numeric(as.character(subData$Global_reactive_power)),
	type="n", xlab="datetime",ylab="Global_reactive_power")
lines(subData$date_time,as.numeric(as.character(subData$Global_reactive_power)))

dev.off()

