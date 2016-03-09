library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Hello Shiny Fruit!"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput('fruitNames', 'Fruit', choices = c('Apple','Banana','Lemon','Orange','Strawberry','Watermelon'), multiple = T)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      uiOutput("fruitTabsetPanel"),
      hr(),
      tableOutput('fruitInfo')
    )
  )
))