
list.files()
PowerCons <- readLines("household_power_consumption.txt")
head(PowerCons)
PowerCons <- read.table("household_power_consumption.txt", sep=";", header=T, na.string="?")
summary(PowerCons)
dim(PowerCons)

PowerCons <- PowerCons[c(which(PowerCons$Date == "1/2/2007") , which(PowerCons$Date =="2/2/2007")),]
PowerCons$datatime <- strptime(as.character(paste0(PowerCons$Date, PowerCons$Time, sep=" ")), format= "%d/%m/%Y %H:%M:%S")

png(filename="plot3.png", width = 480, height = 480, units = "px")
plot(PowerCons$datatime, PowerCons$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(PowerCons$datatime, PowerCons$Sub_metering_1, col="black")
lines(PowerCons$datatime, PowerCons$Sub_metering_2, col="red")
lines(PowerCons$datatime, PowerCons$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty= c(1, 1, 1), col=c("black","red", "blue"))
dev.off()
