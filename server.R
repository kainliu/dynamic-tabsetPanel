library(shiny)

shinyServer(function(input, output, session) {
  
  output$fruitTabsetPanel <- renderUI({
    # get all chosen variable names
    fruit <- input$fruitNames
    
    if(is.null(fruit)){
      return()
    }
    
    tempTabs <- lapply(fruit, function(i){
      
      tabPanel(
        i, # one single fruit name
        
        # dynamically create new sliders
        sliderInput(paste0(i, "Weight"), "Weight(kg) per day",
                    min = 1, max = 10, value = 5),
        
        sliderInput(paste0(i, "Day"), "Day(s) to order",
                    min = 1, max = 7, value = 3)
      
        
      )
      
    })
    
    # put all arguments in a list
    args <- c(
      tempTabs
    )
    
    do.call(tabsetPanel, args)
    
  })
  
  
  output$fruitInfo <- renderTable({
    getFruitInfo()
  })
  
  getFruitInfo <- reactive({
    
    fruit <- input$fruitNames
    if(is.null(fruit)){
      return()
    }
    option <- c('Weight', 'Day')
    
    info <- data.frame(
      row.names = option
    )
    
    for(i in fruit){
      for(j in option){
        info[j, i] <- as.numeric(input[[paste0(i,j)]])
      }
    }
    
    info
  })
})