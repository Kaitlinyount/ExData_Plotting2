download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",destfile="./data")
unzip("./data");
unzip("./data",list=TRUE);
NEI <- readRDS("summarySCC_PM25.rds");
SCC <- readRDS("Source_Classification_Code.rds");
yearlyEMI<-tapply(NEI$Emissions, NEI$year, sum);
plot(names(yearlyEMI),yearlyEMI, type = "l",xlab = "Year", ylab = expression("Total PM"[2.5]~"emissions from all sources"),yaxt = "n",xaxt = "n")
axis(2,at = yearlyEMI,labels = sprintf("%.0f",yearlyEMI),las = 1, cex.axis = 0.5)
axis(1,at = names(yearlyEMI),labels = names(yearlyEMI),cex.axis = 0.8);
dev.copy(png,"./plot1.png");
dev.off()