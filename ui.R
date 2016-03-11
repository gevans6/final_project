library(shiny)
library(plotly)
library(dplyr)

shinyUI(fluidPage(
  
        # Create title
        titlePanel('American School Enrollment'),
        # Create sidebar and sidepanel controls
        sidebarLayout(
          sidebarPanel(
            # Creates checkbox group where user selects which dataframes they want to see
            checkboxGroupInput("dfSelection", label = h4("Select Dataset"),
                choices = list("All Races" = 1, "Asian Alone" = 2, "Asian Alone or in Combination" = 3,
                               "Black Alone" = 4, "Black Alone or in Combination" = 5, "Children of 
                               Foreign Born" = 6, "Children of Foreign Born" = 7, "Hispanic" = 8, 
                               "White Alone" = 9, "White Alone Non Hispanic" = 10, "White Alone or in 
                               Combination" = 11, "White Alone or in Combination Non Hispanic" = 12), 
                selected = 1),
            # Creates radio buttons where user selects what data comparison they want to see
            radioButtons("ySelection", label = h4("Select Comparison"),
                choices = list("Percent Total Enrolled" = 1, "Percent Nursery/Kindergarden" = 2, 
                               "Percent Elementary School" = 3, "Percent High School" = 4, "Percent
                               College" = 5, "Percent Not Enrolled" = 6, "Percent High School Grad" = 7,
                               "Percent Not High School Grad" = 8), 
                selected = 1)
                     
          ),
                    
          # Main panel for displaying plotly map
          mainPanel(
            # Project information
            h3("Information"),
            p("Our project will explore whether or not gender, race/ethnicity, or if students are foreign-born or have foreign-born 
              parents are factors that appear to contribute to the withdrawal from or attendance to school, ages three and older."),
            p("The compiled ",
              a("dataset", href = "http://www.census.gov/hhes/school/data/cps/2014/tables.html"), 
              "was updated in October 2014 and was accessed though the census.gov website, routed through the United States’ public data 
              domain, data.gov. This data was collected through the United States census."),
            p("You may view our Github repository ", a("here", href = "http://www.census.gov/hhes/school/data/cps/2014/tables.html"), "."),
             
            # Outputs the graph
            plotlyOutput("scatter")     
            )
          )
))
