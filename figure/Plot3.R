setwd("/home/balman/R/03. R Projects/Coursera projects/ExplData/Datasets")
myrawdatafile <- "household_power_consumption.txt"
# read the file into R
myrawdatafile1 <- read.csv2(file = myrawdatafile,header = T,sep = ";",na.strings = "?",stringsAsFactors = F)
# Using dplyr package, get the data loaded into table dataframe.
mytibble1 <- tbl_df(data = myrawdatafile1)
# filter rows related to Dates 1st or 2nd feb 2007
mytibble2 <- filter(.data = mytibble1, Date == "1/2/2007" | Date == "2/2/2007")
# do the required data type conversions
mytibble3 <- mutate(.data = mytibble2, 
                    Date = as.Date(Date,format="%d/%m/%Y"),
                    Datetime = as.POSIXct(paste(Date = as.Date(Date,format="%d/%m/%Y"),Time)))
#Construct the plot3 and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot3.png", width=480, height=480)
with(mytibble3, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
       lines(Sub_metering_2~Datetime, col = "Red")
       lines(Sub_metering_3~Datetime, col = "Blue")
})
 legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
              legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
 dev.off()