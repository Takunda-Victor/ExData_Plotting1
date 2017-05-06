# Read the Dataset.
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset only the data within the required time period (between 2007-02-01 and 2007-02-02).
dataSubset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

#Concatenate the Date and Time columns and convert the result to a Date and Time class
datePlusTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Initialise the .png plot with required dimensions.
png("plot2.png", width=480, height=480)

#construct the plot with the appropriate title, axes labels and plot format.
plot(datePlusTime,dataSubset$Global_active_power, type = "l", main="Global Active Power", xlab="", ylab = "Global Active Power (kilowatts)")

#Save and close the plot.
dev.off()
