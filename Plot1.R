##This R code constructs Plot 1

##Read the data. (Assumes file is in working directory)

data <- read.table("household_power_consumption.txt", header=TRUE, sep=';')
df <- data.frame(date_time = paste(data$Date, data$Time), data)
data$date_time <- strptime(df$date_time,"%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subData <- data[(data$Date >= "2007-02-01") & (data$Date <= "2007-02-02"),]


##Creates the plot as a PNG file.

png(filename="plot1.png", width=480, height=480, units="px")
hist(as.numeric(as.character(subData$Global_active_power)), col="red", 
	main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

