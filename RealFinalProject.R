#read in income inequality data
read.csv("incomeinequality.csv") -> incomedata

#check you have read in the right data
head(incomedata)


#make a plot that shows income inequality by county and label the axis
data <- read.csv("incomeinequality.csv", header=T,sep=",")
attach(data)
plot(county_name,Median_HH_income,las=3,main="Median Income Per County",xlab="County",ylab="Income")

