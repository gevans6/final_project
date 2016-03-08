library(dplyr)
library(plotly)
setwd("c:/Users/Grant/Documents/INFO-498/final_project")
allWhite <- read.csv("Tab01-Hispanic.csv")
View(allWhite)
BlackAlone <- read.csv("data/Tab01-BlackAlone.csv")
View(BlackAlone)


PTEset <- BlackAlone %>% group_by(Gender) %>% select(Ages, PercentTotalEnrolled) 
plot_ly(PTEset, x = Ages, y = PercentTotalEnrolled, mode = 'markers', color = Gender)

PTNEset <- BlackAlone %>% group_by(Gender) %>% select(Ages, PercentTotalNotEnrolled) 
plot_ly(PTNEset, x = Ages, y = PercentTotalNotEnrolled, mode = 'markers', color = Gender)

PCollegeset <- BlackAlone %>% group_by(Gender) %>% select(Ages, PercentCollege) 
plot_ly(PCollegeset, x = Ages, y = PercentCollege, mode = 'markers', color = Gender)

#percent total enrolled
#percent total not enrolled
#number go to college
#percent go to college
#