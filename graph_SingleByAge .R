source('combine_sets.R')
graph_SingleByAge <- function(dataframe, yaxis, label) {
  m = list(
    l = 50,
    r = 50,
    b = 200,
    t = 100,
    pad = 4
  )
  xtext <- list(title = "Ages", tickfont = list(size = 10), tickangle = 18, ticks = "outside")
  newSet <- dataframe %>% group_by(Gender) %>% filter(Ages != "Total")
  plot_ly(newSet, x = Ages, y = newSet[[yaxis]], color = Gender) %>% 
  layout(title = paste("Age Groups vs", label), yaxis = list(title = label), xaxis = xtext,
         autosize = F, height = 1000, width = 1000, margin = m) %>% 
  return() 
<<<<<<< 66ccc5dc9115587e27e127ec93d15d913cf650aa
}

=======
}
>>>>>>> formatted graph
