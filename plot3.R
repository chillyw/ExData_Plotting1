## Third Plot for ExData Project 1

# First, let's download and unzip the data:

if(!file.exists("./household_power_consumption.txt")){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="hpcData.zip")
  unzip("hpcData.zip")
}

# Let's load the data into R

hpcData <- read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?",colClasses = "character")

# Next, let's fix the Date column's format

hpcData$Date <- as.Date(hpcData$Date,format="%d/%m/%Y")

# Need to filter on only the dates we need

hpcData <- hpcData[hpcData$Date == "2007-02-01" | hpcData$Date == "2007-02-02",]

# Now, let's create a column for the posix date.

hpcData$DateTime <- as.POSIXct(paste(hpcData$Date,hpcData$Time))

# And we're ready to make the chart!
png(filename = "plot3.png",width=480,height=480,units="px")
plot(hpcData$Sub_metering_1 ~ hpcData$DateTime,xlab="",ylab="Energy sub metering",type="l")
lines(hpcData$Sub_metering_2 ~ hpcData$DateTime,col="red")
lines(hpcData$Sub_metering_3 ~ hpcData$DateTime,col="blue")
legend("topright",lty=1,lwd=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))
dev.off()