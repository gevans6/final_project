combine_sets <- function(...){
  newdf <- bind_rows(...)
  return(newdf)
}

#combine_sets(WhiteAlone, BlackAlone, AsianAlone)
