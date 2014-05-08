#rows 66638 - 69517 are relevant
headers <- names(read.csv("household_power_consumption.txt", header=TRUE, sep=";",nrows=1))
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", skip=66636, nrows=2880)
names(data) <- headers
#Convert Date and Time to on column 
#http://stackoverflow.com/questions/5250978/colclasses-date-and-time-read-csv-problem 
data <- within(data, DateTime <- strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"))
#Reorder columns 
data <- data[, c(10,1:9)]

plot(data$DateTime, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Enegry sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.copy(png, file="plot3.png")
dev.off()

