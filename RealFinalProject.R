#read in income inequality data
read.csv("incomeinequality.csv") -> incomedata

#check you have read in the right data
head(incomedata)


#make a plot that shows income inequality by county and label the axis
data <- read.csv("incomeinequality.csv", header=T,sep=",")
attach(data)
plot(county_name,Median_HH_income,las=3,main="Median Income Per County",xlab="County",ylab="Income")

#Reading cancer csv file; incidence rate in california by county into a variable 
Incidence_Rate_California_Counties<-read.csv("incd.csv", stringsAsFactors=FALSE,head=TRUE, sep=",")

#Checking the stored variable 
Incidence_Rate_California_Counties
head(Incidence_Rate_California_Counties)
tail(Incidence_Rate_California_Counties)
names(Incidence_Rate_California_Counties)
attributes(Incidence_Rate_California_Counties)

# Make a new column and replace any commas that are in the values with empty space " ", so 
# R doesn't confuse the values (numbers) as characters
NEW_COLUMN<-gsub(",","",Incidence_Rate_California_Counties$POPULATION, fixed = TRUE)

# Make a new column and read make sure that the values in Incidence_Rate_California_Counties$POPULATION 
# are read as numbers. 
Incidence_Rate_California_Counties$NewPop<- as.numeric(NEW_COLUMN)

# Check the class of variable to make sure it is "numeric"
class(Incidence_Rate_California_Counties$NewPop)
Incidence_Rate_California_Counties$NewPop

#calculate the percentage of population that has cancer 
Incidence_Rate_California_Counties$Percentage<-(Incidence_Rate_California_Counties$Average.Annual.Count/Incidence_Rate_California_Counties$NewPop)*100
Incidence_Rate_California_Counties$Percentage


class(County)
#Incidence_Rate_California_Counties <- data.frame(apply(Incidence_Rate_California_Counties, 2, unclass))

library(ggplot2)

plot_cancer_rate <- ggplot(Incidence_Rate_California_Counties, aes(x = reorder(County, -Incidence_Rate_California_Counties$Percentage), y = Incidence_Rate_California_Counties$Percentage)) +
  geom_bar(stat = "identity") + geom_line() +
  ggtitle("Perevalence of Cancer in California Counties") +
  labs(x="County",y="Percentage of Cancer in Total Population") + 
  theme(plot.title = element_text(family = "Trebuchet MS", color="black", face="bold", size=19, hjust=0)) +
  theme(axis.title = element_text(family = "Trebuchet MS", color="black", face="bold", size=15)) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(plot.title = element_text(hjust = 0.5)) 

require("gridExtra")

grid.arrange(arrangeGrob(plot_cancer_rate))

