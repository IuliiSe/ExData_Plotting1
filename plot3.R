library(downloader)
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile =  "/Users/is/Documents/Coursera_R/Data/Epowercon.zip", method = "curl")
unzip("Epowercon.zip", exdir = ".")
data1 <- read.table("household_power_consumption.txt",
                    na.strings = "?",
                    sep = ";",
                    header = TRUE)
data2 <- subset(data1, Date=="1/2/2007"| Date =="2/2/2007")
data2$Time <- paste(data2$Date, data2$Time)
data2$Time <- strptime(data2$Time, "%d/%m/%Y %H:%M:%S")
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(data2$Time, data2$Sub_metering_1, 
     type="l", 
     ylab = "Energy sub metering",
     xlab = " ")
lines(data2$Time, data2$Sub_metering_2, type = "l", col=2)
lines(data2$Time, data2$Sub_metering_3, type = "l", col=4)
legend("topright", 
       pch=c(1,1, 1), 
       col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()