DF<- read.table("household_power_consumption.txt",sep=";", header=TRUE)
DF$datetime <- strptime(paste(DF$Date, DF$Time), "%d/%m/%Y %H:%M:%S")
DFplot <- subset(DF, datetime >= "2007-02-01 00:00:00" & datetime < "2007-02-03 00:00:00")
for(i in 3:9) {
    DFplot[,i] <- as.numeric(as.character(DFplot[,i]))
}

hist(DFplot$Global_active_power,
     col="red",
     xlab = "Global Active Power",
     main = "Global Active Power",freq=TRUE)

dev.copy(png,file = "Plot1.png",width = 480, height = 480)
dev.off()

