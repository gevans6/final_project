library(shiny)
library(plotly)
library(dplyr)

source('graph_SingleByAge .R')
source('SummaryFunctions.R')

shinyServer(function(input, output) {
 
  # Create scatter plot in main panel
  output$scatter <- renderPlotly({ 
        # Create an empty dataframe that fills according to which dataframe check boxes are selected by user
        customDF <- data.frame(Ages=character())
        # Will be the y axis label for the plot
        yaxis <- 1
        # For each dataframe check box selected by user, the dataframe will be added to the previous custom dataframe
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
        
        # Renames the y axis according to the selected comparison radio button
        if(input$ySelection == 1) {
          yaxis <- "PercentTotalEnrolled"
          ylabel <- "Percent Total Enrolled"
        }
        if(input$ySelection == 2) {
          yaxis <- "PercentNurseKinder"
          ylabel <- "Percent Nursery/Kindergarden"
        }
        if(input$ySelection == 3) {
          yaxis <- "PercentElementary"
          ylabel <- "Percent Elementary"
        }
        if(input$ySelection == 4) {
          yaxis <- "PercentHS"
          ylabel <- "Percent High School"
        }
        if(input$ySelection == 5) {
          yaxis <- "PercentCollege"
          ylabel <- "Percent College"
        }
        if(input$ySelection == 6) {
          yaxis <- "PercentTotalNotEnrolled"
          ylabel <- "Percent Total Not Enrolled"
        }
        if(input$ySelection == 7) {
          yaxis <- "PercentHSGrad"
          ylabel <- "Percent High School Grad"
        }
        if(input$ySelection == 8) {
          yaxis <- "PercentNotHSGrad"
          ylabel <- "Percent Not High School Grad"
        }
        
    # Creates and outputs graph using the custom dataframe and y axis label 
    graph_SingleByAge(customDF, yaxis, ylabel)
})

  # Renders summary information for each selected dataframe
  output$text <- renderText({
    data_set <- data.frame(1)
    out <- ""
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
    # Only prints the summary of the data frame when only 1 csv is selected 
    if (length(input$dfSelection) == 1){
      paste0("The total population size is ", data_set$Population, ". ", data_set$male_percent, "% of males
      and ", data_set$female_percent, "% of females are enrolled in school. ", data_set$PercentNurseKinder, "%
      are enrolled as nursury/kindergarden, ", data_set$PercentElementary, "% in Elementary, ",
      data_set$PercentHS, "% in high school, and ", data_set$PercentCollege, "% in college.")
    } 
  })
})