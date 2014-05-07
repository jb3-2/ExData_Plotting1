#rows 66638 - 69517 are relevant
headers <- names(read.csv("household_power_consumption.txt", header=TRUE, sep=";",nrows=1))
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", skip=66636, nrows=2880)
names(data) <- headers
#Convert Date and Time to on column 
#http://stackoverflow.com/questions/5250978/colclasses-date-and-time-read-csv-problem 
data <- within(data, DateTime <- strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"))
#Reorder columns 
data <- data[, c(10,1:9)]

with(data,hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red"))
dev.copy(png, file="plot1.png")
dev.off()

plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
