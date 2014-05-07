# get the data -- we could do some head-tail fiddling to get only the rows we need, but it's way faster to import the whole shebang and use git to subset it. 

setwd("/Users/testo/datasci/exploratory/ExData_Plotting1")
pow<-read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F)
powsub<-pow[pow$Date=="1/2/2007" | pow$Date=="2/2/2007",]

head(powsub)

# create timestamp
powsub$ts<-strptime(paste(powsub$Date, powsub$Time), format="%d/%m/%Y %H:%M:%S")

# missing values to missing -- this happens automatically when we go to numeric, yes?
powsub$gap<-as.numeric(powsub$Global_active_power)
head(powsub)

png("plot3.png")
with(powsub, plot(ts, gap, pch="", ylab="Energy sub metering", xlab="", ylim=c(0,38)))
lines(powsub$ts, powsub$Sub_metering_1, col="black")
lines(powsub$ts, powsub$Sub_metering_2, col="red")
lines(powsub$ts, powsub$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()
