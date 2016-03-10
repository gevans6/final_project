library(shiny)
library(plotly)
library(dplyr)

shinyUI(fluidPage(
  
        # Create title
        titlePanel('Title'),
        # Create sidebar and sidepanel controls
        sidebarLayout(
          sidebarPanel(
                     
          ),
                    
          # Main panel for displaying plotly map
          mainPanel(
            plotlyOutput("scatter")        
          )
        )
                  
))