
list.files()
PowerCons <- readLines("household_power_consumption.txt")
head(PowerCons)
PowerCons <- read.table("household_power_consumption.txt", sep=";", header=T, na.string="?")
summary(PowerCons)
dim(PowerCons)

PowerCons <- PowerCons[c(which(PowerCons$Date == "1/2/2007") , which(PowerCons$Date =="2/2/2007")),]
PowerCons$datatime <- strptime(as.character(paste0(PowerCons$Date, PowerCons$Time, sep=" ")), format= "%d/%m/%Y %H:%M:%S")

png(filename="plot2.png", width = 480, height = 480, units = "px")
plot(PowerCons$datatime, PowerCons$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
