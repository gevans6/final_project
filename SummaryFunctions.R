library(dplyr)

SummaryInfo <- function(data) {
  df <- data %>% filter(Ages == "Total")
  summary <- head(data, n = 1L)
  summary$male_total <- df$Population[2]
  summary$female_total <- df$Population[3]
  return(summary)
}