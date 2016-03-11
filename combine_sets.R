# Combines any number of dataframes
combine_sets <- function(...){
  newdf <- bind_rows(...)
  return(newdf)
}
