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

png("plot1.png")
hist(powsub$gap, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
