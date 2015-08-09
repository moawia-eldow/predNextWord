library(shiny)

# Load the data frames of n-grams 
load("biGramsDF.Rdata")
load("triGramsDF.Rdata")
load("quadGramsDF.Rdata")

# Run the function to predict next word
source("predNextWord.R")

shinyServer(function(input, output) {
   
  # print the input phrase
  output$phrase <- renderText({
    input$entry
  })
  
  # get the predicted next word
  output$predNextWord <- renderText({
    validate(
      need(input$entry != "", "Please enter a phrase")
    )
  getNextWord(input$entry, biGramsDF, triGramsDF, quadGramsDF)  
  })
  
})