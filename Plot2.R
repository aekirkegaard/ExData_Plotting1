##This R code constructs Plot 2

##Read the data. (Assumes file is in working directory)

data <- read.table("household_power_consumption.txt", header=TRUE, sep=';')
df <- data.frame(date_time = paste(data$Date, data$Time), data)
data$date_time <- strptime(df$date_time,"%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subData <- data[(data$Date >= "2007-02-01") & (data$Date <= "2007-02-02"),]


##Creates the plot as a PNG file.

png(filename="plot2.png", width=480,height=480, units="px")
plot(subData$date_time,as.numeric(as.character(subData$Global_active_power)),type="n", xlab="",ylab="Global Active Power (kilowatts)")
lines(subData$date_time,as.numeric(as.character(subData$Global_active_power)))
dev.off()

