
# Read the Dataset.
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset only the data within the required time period (between 2007-02-01 and 2007-02-02).
dataSubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Concatenate the Date and Time columns and convert the result to a Date and Time class
datePlustime <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Initialise the .png plot with required dimensions
png("plot3.png", width=480, height=480)

#First plot the conacatenated date and time against the first sub_metering readings.
plot(datePlusTime, dataSubset$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")

#On the same plot add a line for the second sub_metering readings.
lines(datePlusTime, dataSubset$Sub_metering_2, type="l", col="red")

#On the same plot add a line for the third sub_metering readings.
lines(datePlusTime, dataSubset$Sub_metering_3, type="l", col="blue")

#Insert a legend for the plot with appropriate line type and width and colors of the lines appearing on the legend.
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Save and close the plot.
dev.off()