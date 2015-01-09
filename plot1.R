data<-read.table('household_power_consumption.txt',header=TRUE,sep=";",na.strings='?');
data$Date = as.Date(data$Date,format="%d/%m/%Y")
data = data[data$Date>="2007/02/1" & data$Date <="2007/02/02",]
png("plot1.png")
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()