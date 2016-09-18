#prepare
mydata <- read.table("C:/Coursera/course4/week1/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)

datasubst1 <- subset(mydata,  Date=="1/2/2007" )
datasubst2 <- subset(mydata,  Date=="2/2/2007" )
datasubst <- rbind(datasubst1,datasubst2
#plot1
png("plot1.png",width = 480, height = 480)
hist(datasubst$Global_active_power, col="red",main ="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

#plot2
png("plot2.png",width = 480, height = 480)
datasubst$Datetime <- strptime(paste( datasubst$Date , datasubst$Time),"%e/%m/%Y %H:%M:%S")
 
plot(datasubst$Datetime,datasubst$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab="")
dev.off()
 
#plot3
png("plot3.png",width = 480, height = 480)
plot(datasubst$Datetime,datasubst$Sub_metering_1,type="l",ylab = "Energy Sub meterings",xlab="")
 
lines(datasubst$Datetime,datasubst$Sub_metering_2,type="l",col="red")
 
lines(datasubst$Datetime,datasubst$Sub_metering_3,type="l",col="blue")
 
legend("topright",names(datasubst[,7:9]),col=c("black","red","blue"), lwd=3)
dev.off()
#plot4
#1
par(mfrow=c(2,2))
png("plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
plot(datasubst$Datetime,datasubst$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab="")
#2
plot(datasubst$Datetime,datasubst$Voltage,type="l",ylab = "Voltage",xlab="datetime")
#3
plot(datasubst$Datetime,datasubst$Sub_metering_1,type="l",ylab = "Energy Sub meterings",xlab="")
lines(datasubst$Datetime,datasubst$Sub_metering_2,type="l",col="red")
lines(datasubst$Datetime,datasubst$Sub_metering_3,type="l",col="blue")
legend("topright",names(datasubst[,7:9]),col=c("black","red","blue"), lwd=1,bty="n")
#4
plot(datasubst$Datetime,datasubst$Global_reactive_power,type="l",ylab = "Global_reactive_power",xlab="datetime")
dev.off()
