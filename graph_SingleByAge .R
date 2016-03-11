source('combine_sets.R')
graph_SingleByAge <- function(dataframe, yaxis) {
  yaxis < as.numeric(yaxis)
  newSet <- dataframe %>% group_by(Gender) %>% filter(Ages != "Total")
  plot_ly(newSet, x = Ages, y = newSet[[yaxis]], color = Gender) %>% 
    
  return()
}


#View(AsianAlone)
dataframe <- combine_sets(AsianAlone, BlackAlone)
#View(dataframe)
yaxis <- 'PercentTotalEnrolled'
graph_SingleByAge(dataframe, yaxis)
