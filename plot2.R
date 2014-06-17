download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",destfile="./data")
unzip("./data");
unzip("./data",list=TRUE);
NEI <- readRDS("summarySCC_PM25.rds");
SCC <- readRDS("Source_Classification_Code.rds");
balt<-NEI[NEI$fips=="24510",]
baltYearly<-tapply(balt$Emissions, balt$year, sum);
plot(names(baltYearly),baltYearly, type = "l",xlab = "Year", ylab = expression("Total PM"[2.5]~"emissions from all sources in Baltimore, MD"),yaxt = "n",xaxt = "n")
axis(2,at = baltYearly,labels = sprintf("%.0f",baltYearly),las = 1, cex.axis = 0.5)
axis(1,at = names(baltYearly),labels = names(baltYearly),cex.axis = 0.8);
dev.copy(png,"./plot2.png");
dev.off()