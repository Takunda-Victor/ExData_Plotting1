# Read the Dataset.
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Convert the date column to the date class using the as.Date function.
data$Date <- as.Date(data$Date)

#subset only the data within the required time period (between 2007-02-01 and 2007-02-02).
dataSubset <- subset(data,subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#convert the Global_active_power column to type numeric for a histogram to be applicable on it.
subSetData$Global_active_power <- as.numeric(subSetData$Global_active_power)

#Initialise the .png plot with required dimensions.
png("plot1.png", width=480, height=480)

#plot the histogram with the appropriate title, x axis and color labels.
hist(subSetData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

#Save and close the plot.
dev.off()
