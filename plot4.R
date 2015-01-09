data<-read.table('household_power_consumption.txt',header=TRUE,sep=";",na.strings='?');
data$Date = as.Date(data$Date,format="%d/%m/%Y")
data = data[data$Date>="2007/02/1" & data$Date <="2007/02/02",]
data$Datetime <- as.POSIXct(paste(data$Date,data$Time),format ="%Y-%m-%d %H:%M:%S")
png("plot4.png")
par(mfrow=c(2,2))
plot(data$Global_active_power ~ data$Datetime, type="l",ylab="Global Active Power",xlab="")
plot(data$Voltage ~ data$Datetime, type="l",ylab="Voltage",xlab="datetime")
plot(data$Sub_metering_1 ~ data$Datetime, type="l",ylab="Energy sub metering",xlab="")
lines(data$Sub_metering_2 ~ data$Datetime, type="l",xlab="",col="red")
lines(data$Sub_metering_3 ~ data$Datetime, type="l",xlab="",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(data$Global_reactive_power ~ data$Datetime, type="l",ylab="Global_Reactive_Power",xlab="datetime")
dev.off()