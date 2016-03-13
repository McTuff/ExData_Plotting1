DF<- read.table("household_power_consumption.txt",sep=";", header=TRUE)
DF$datetime <- strptime(paste(DF$Date, DF$Time), "%d/%m/%Y %H:%M:%S")

DFplot <- subset(DF, datetime >= "2007-02-01 00:00:00" & datetime < "2007-02-03 00:01:00")
for(i in 3:9) {
    DFplot[,i] <- as.numeric(as.character(DFplot[,i]))
}

daterange <- c(as.POSIXlt(min(DFplot$datetime)), as.POSIXlt(max(DFplot$datetime)))

plot(DFplot$datetime,DFplot$Sub_metering_1,type="l", xaxt="n",ylim=c(0,40),
     ylab="Energy sub metering",xlab= "")
axis.POSIXct(1, at=seq(daterange[1], daterange[2],by="day"), format = "%a")
lines(DFplot$datetime,DFplot$Sub_metering_2,type="l", axes=F,
     xlab="",ylab="",col="red")
lines(DFplot$datetime,DFplot$Sub_metering_3,type="l", xaxt="n",
     yaxt = "n", xlab="",ylab="",col="blue")
legend(x = "topright", cex = 0.5, col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = 1)


dev.copy(png,file = "Plot3.png",width = 480, height = 480)
dev.off()

