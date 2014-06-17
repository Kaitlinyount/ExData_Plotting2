download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",destfile="./data")
unzip("./data");
unzip("./data",list=TRUE);
NEI <- readRDS("summarySCC_PM25.rds");
SCC <- readRDS("Source_Classification_Code.rds");
balt<-NEI[NEI$fips=="24510",];
baltSum<-data.frame(with(balt, tapply(Emissions, list(year,type),sum)));
emissions<-c(baltSum$NON.ROAD,baltSum$NONPOINT,baltSum$ON.ROAD,baltSum$POINT);
type<-rep(colnames(baltSum),each=4);
year<-rep(rownames(baltSum),4);
data<-data.frame(emissions=emissions,type=type,year=year);

library(ggplot2);
g<-ggplot(data,aes(x=year,y=emissions,group=type));
g+geom_line()+geom_point()+geom_text(aes(label=round(emissions)),hjust=0, vjust=2) + ylab("Total Emissions in Baltimore");
dev.copy(png,"./plot3.png");
dev.off()