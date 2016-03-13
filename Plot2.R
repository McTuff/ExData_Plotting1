DF<- read.table("household_power_consumption.txt",sep=";", header=TRUE)
DF$datetime <- strptime(paste(DF$Date, DF$Time), "%d/%m/%Y %H:%M:%S")

DFplot <- subset(DF, datetime >= "2007-02-01 00:00:00" & datetime < "2007-02-03 00:01:00")
for(i in 3:9) {
    DFplot[,i] <- as.numeric(as.character(DFplot[,i]))
}

daterange=c(as.POSIXlt(min(DFplot$datetime)), as.POSIXlt(max(DFplot$datetime)))

plot(DFplot$datetime,DFplot$Global_active_power,type="l", xaxt="n",
     ylab="Global Active Power (kilowatts)",xlab= "")
axis.POSIXct(1, at=seq(daterange[1], daterange[2],by="day"), format = "%a")


dev.copy(png,file = "Plot2.png",width = 480, height = 480)
dev.off()

