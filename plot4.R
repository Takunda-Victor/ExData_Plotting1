
# Read the Dataset.
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset only the data within the required time period (between 2007-02-01 and 2007-02-02).
dataSubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Concatenate the Date and Time columns and convert the result to a Date and Time class
datePlusTime <- strptime(paste(dataSubset$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Initialise the .png plot with required dimensions.
png("plot4.png", width=480, height=480)

#create a 2 x 2 matrix of plots that will be filled in by row.
par(mfrow = c(2, 2)) 

#Construct the first plot of Global Active Power against time.
plot(datePlusTime, dataSubset$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#Construct the second plot of Voltage against time. 
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#Construct the third plot of each of the 3 submeter readings against time (as constructed in the plot3.R script)
plot(datePlusTime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datePlusTime, subMetering2, type="l", col="red")
lines(datePlusTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Construct the fourth and final plot of Global Reactive Power against time
plot(datetime, dataSubset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#Save and close the plot.
dev.off()