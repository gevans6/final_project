source('combine_sets.R')
graph_SingleByAge <- function(dataframe, yaxis) {
  newSet <- dataframe %>% group_by(Gender)
  plot_ly(newSet, x = Ages, y = yaxis, color = Gender) %>% 
  return()
}


combined <- combine_sets(WhiteAlone, BlackAlone)
yyy <- combined$PercentTotalEnrolled
graph_SingleByAge(combined, yyy)
# %>% filter(Ages != 'Total')
#select(Ages, y = eval(parse(text = yaxis)))
#If you want to change it to only one gender, do filter(Gender %in% "what gender you want") (this can be a parameter in the function)