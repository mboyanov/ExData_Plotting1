data<-read.table('household_power_consumption.txt',header=TRUE,sep=";",na.strings='?');
data$Date = as.Date(data$Date,format="%d/%m/%Y")
data = data[data$Date>="2007/02/1" & data$Date <="2007/02/02",]
data$Datetime <- as.POSIXct(paste(data$Date,data$Time),format ="%Y-%m-%d %H:%M:%S")
png("plot2.png")
plot(data$Global_active_power ~ data$Datetime, type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()