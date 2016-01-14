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
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data2$Global_active_power, 
     col="red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()