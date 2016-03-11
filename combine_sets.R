combine_sets <- function(...){
  newdf <- bind_rows(...)
  return(newdf)
}
