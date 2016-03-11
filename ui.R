library(shiny)
library(plotly)
library(dplyr)

shinyUI(fluidPage(
  
        # Create title
        titlePanel('Title'),
        # Create sidebar and sidepanel controls
        sidebarLayout(
          sidebarPanel(
            radioButtons("dfSelection", label = h4("Select Dataset"),
                choices = list("All Races" = 1, "Asian Alone" = 2, "Asian Alone or in Combination" = 3,
                               "Black Alone" = 4, "Black Alone or in Combination" = 5, "Children of 
                               Foreign Born" = 6, "Children of Foreign Born" = 7, "Hispanic" = 8, 
                               "White Alone" = 9, "White Alone Non Hispanic" = 10, "White Alone or in 
                               Combination" = 11, "White Alone or in Combination Non Hispanic" = 12), 
                selected = 1),
            checkboxGroupInput("ySelection", label = h4("Select Comparison"),
                choices = list("Percent Total Enrolled" = 1, "Percent Nursery/Kindergarden" = 2, 
                               "Percent Elementary School" = 3, "Percent High School" = 4, "Percent
                               College" = 5, "Percent Not Enrolled" = 6, "Percent High School Grad" = 7,
                               "Percent Not High School Grad" = 8), 
                selected = 1)
                     
          ),
                    
          # Main panel for displaying plotly map
          mainPanel(
            plotlyOutput("scatter")     
          )
        )
                  
))