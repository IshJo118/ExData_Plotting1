df<-read.table("household_power_consumption.txt",skip = 66637,nrows=2880,sep = ";")
name<-sapply(read.table("household_power_consumption.txt",nrows = 1,sep = ";"),as.character)
names(df)<-name
df$DateTime<-strptime(paste(df$Date,df$Time),format = "%d/%m/%y %H:%M:%S")
for(i in 3:9)
{
  df[[i]]<-sapply(df[[i]],as.character)
  df[[i]]<-sapply(df[[i]],as.numeric)             
}

win.graph(200,200)
hist(df$Global_active_power,xlab = "Global Active Power(kWh)",main = "Global Active Power",col = "red",ylim = c(0,1200))
axis(1,at=c(min(d$DateTime),min(d$DateTime)+86400,min(d$DateTime)+2*86400),labels = c("Thu","Fri","Sat"))
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()