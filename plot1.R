## First Plot for ExData Project 1

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

# And we're ready to make the chart!

png(file = "plot1.png",units="px",height=480,width=480)
hist(as.numeric(hpcData$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()