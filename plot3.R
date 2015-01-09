data<-read.table('household_power_consumption.txt',header=TRUE,sep=";",na.strings='?');
data$Date = as.Date(data$Date,format="%d/%m/%Y")
data = data[data$Date>="2007/02/1" & data$Date <="2007/02/02",]
data$Datetime <- as.POSIXct(paste(data$Date,data$Time),format ="%Y-%m-%d %H:%M:%S")
png("plot3.png")
plot(data$Sub_metering_1 ~ data$Datetime, type="l",ylab="Energy sub metering",xlab="")
lines(data$Sub_metering_2 ~ data$Datetime, type="l",xlab="",col="red")
lines(data$Sub_metering_3 ~ data$Datetime, type="l",xlab="",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()