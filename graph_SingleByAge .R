source('combine_sets.R')
graph_SingleByAge <- function(dataframe, yaxis) {
  ytitle <- list(title = yaxis)
  newSet <- dataframe %>% group_by(Gender) %>% filter(Ages != "Total")
  plot_ly(newSet, x = Ages, y = newSet[[yaxis]], color = Gender) %>% 
  return() 
}


#dataframe <- combine_sets(WhiteAlone, AllRaces)
#yaxis <- 'PercentTotalEnrolled'
#graph_SingleByAge(dataframe, yaxis)

#df3 <- list(WhiteAlone, BlackAlone)
#dataframe <- combine_sets(WhiteAlone, BlackAlone)
#View(dataframe)
#yaxis <- 'PercentTotalEnrolled'
#graph_SingleByAge(df3, yaxis)

