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
                    Global_active_power = as.numeric(Global_active_power))
#Construct the plot1 and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
#Construct the histogram of Global Active Power against Frequency
png("plot1.png", width=480, height=480)
hist(x = mytibble3$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "frequency")
dev.off()