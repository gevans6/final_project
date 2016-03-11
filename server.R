library(shiny)
library(plotly)
library(dplyr)

source('graph_SingleByAge .R')
source('SummaryFunctions.R')

allRaces <- read.csv("498_data/Tab01-AllRaces.csv")
asian <- read.csv("498_data/Tab01-AsianAlone.csv")
asianCombo <- read.csv("498_data/Tab01-AsianAloneOrInCombination.csv")
black <- read.csv("498_data/Tab01-BlackAlone.csv")
blackCombo <- read.csv("498_data/Tab01-BlackAloneOrInCombination.csv")
cFB <- read.csv("498_data/Tab01-ChildrenOfForeignBorn.csv")
foreign <- read.csv("498_data/Tab01-ForeignBorn.csv")
hispanic <- read.csv("498_data/Tab01-Hispanic.csv")
white <- read.csv("498_data/Tab01-WhiteAlone.csv")
whiteNonH <- read.csv("498_data/Tab01-WhiteAloneNonHispanic.csv")
whiteCombo <- read.csv("498_data/Tab01-WhiteAloneOrInCombination.csv")
whiteComboNonH <- read.csv("498_data/Tab01-WhiteAloneOrInCombinationNonHispanic.csv")

shinyServer(function(input, output) {
  
  output$scatter <- renderPlotly({ 
        customDF <- data.frame(Ages=character())
        yaxis <- 1
        for(i in 1:length(input$dfSelection)){
          if(input$dfSelection[i] == 1) {
          customDF <- combine_sets(customDF, allRaces)
        }
        if(input$dfSelection[i] == 2) {
          customDF <- combine_sets(customDF, asian)
        }
        if(input$dfSelection[i] == 3) {
          customDF <- combine_sets(customDF, asianCombo)
        }
        if(input$dfSelection[i] == 4) {
          customDF <- combine_sets(customDF, black)
        }
        if(input$dfSelection[i] == 5) {
          customDF <- combine_sets(customDF, blackCombo)
        }
        if(input$dfSelection[i] == 6) {
          customDF <- combine_sets(customDF, cFB)
        }
        if(input$dfSelection[i] == 7) {
          customDF <- combine_sets(customDF, foreign)
        }
        if(input$dfSelection[i] == 8) {
          customDF <- combine_sets(customDF, hispanic)
        }
        if(input$dfSelection[i] == 9) {
          customDF <- combine_sets(customDF, white)
        }
        if(input$dfSelection[i] == 10) {
          customDF <- combine_sets(customDF, whiteNonH)
        }
        if(input$dfSelection[i] == 11) {
          customDF <- combine_sets(customDF, whiteCombo)
        }
        if(input$dfSelection[i] == 12) {
          customDF <- combine_sets(customDF, whiteComboNonH)
        }
        }
        
  
        if(input$ySelection == 1) {
          yaxis <- "PercentTotalEnrolled"
        }
        if(input$ySelection == 2) {
          yaxis <- "PercentNurseKinder"
        }
        if(input$ySelection == 3) {
          yaxis <- "PercentElementary"
        }
        if(input$ySelection == 4) {
          yaxis <- "PercentHS"
        }
        if(input$ySelection == 5) {
          yaxis <- "PercentCollege"
        }
        if(input$ySelection == 6) {
          yaxis <- "PercentTotalNotEnrolled"
        }
        if(input$ySelection == 7) {
          yaxis <- "PercentHSGrad"
        }
        if(input$ySelection == 8) {
          yaxis <- "PercentNotHSGrad"
        }
        
        
        
    graph_SingleByAge(customDF, yaxis)  
  })
  
  output$text <- renderText({
    data_set <- data.frame(1)
    if(input$dfSelection == 1) {
      data_set <- SummaryInfo(allRaces)
    }
    if(input$dfSelection == 2) {
      data_set <- SummaryInfo(asian)
    }
    if(input$dfSelection == 3) {
      data_set <- SummaryInfo(asianCombo)
    }
    if(input$dfSelection == 4) {
      data_set <- SummaryInfo(black)
    }
    if(input$dfSelection == 5) {
      data_set <- SummaryInfo(blackCombo)
    }
    if(input$dfSelection == 6) {
      data_set <- SummaryInfo(cFB)
    }
    if(input$dfSelection == 7) {
      data_set <- SummaryInfo(foreign)
    }
    if(input$dfSelection == 8) {
      data_set <- SummaryInfo(hispanic)
    }
    if(input$dfSelection == 9) {
      data_set <- SummaryInfo(white)
    }
    if(input$dfSelection == 10) {
      data_set <- SummaryInfo(whiteNonH)
    }
    if(input$dfSelection == 11) {
      data_set <- SummaryInfo(whiteCombo)
    }
    if(input$dfSelection == 12) {
      data_set <- SummaryInfo(whiteComboNonH)
    }
    paste0("The total population size is ", summary$Population, ". ", summary$male_percent, "% of males
    are enrolled and ", summary$female_percent, "% of females are enrolled. ", summary$PercentNurseKinder, "%
    are enrolled as nursury/kindergarden, ", summary$PercentElementary, "% in Elementary, ",
    summary$PercentHS, "% in high school, and ", summary$PercentCollege, "% in college.")
  })
  
})