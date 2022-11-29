#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(stringr)
footballgames <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-02-04/games.csv')

# Define UI for application that draws a histogram
ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      helpText("Games played by AFC West Teams"),
      selectInput("teams", 
                  label = "Choose team:",
                  choices = c("Denver Broncos", "Los Angeles Chargers", "Kansas City Chiefs", "Oakland Raiders", "San Diego Chargers"),
                  selected = "Denver Broncos"),
    ),
    mainPanel(
      dataTableOutput("games"),
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$games <- renderDataTable({
    x<-filter(footballgames, home_team == input$teams | away_team == input$teams)
    print(x)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)