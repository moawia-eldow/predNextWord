library(shiny)

shinyUI(fluidPage(
  
  # Application title.
  titlePanel("Next Word Prediction Using N-Grams"),
  br(),
  sidebarLayout(
    sidebarPanel(
      h4('Wait to load the data ...'),
      br(),
      textInput("entry", "Phrase:", "Here, enter your input sentence"),
      
      helpText("Enter a sentence and press the button", "to get the next word."),
      
      submitButton("Predict Next Word"),
      br(),
      
      h4("Exploratory Analysis in Rpubs:"),
      a("http://rpubs.com/meldow/MileStone-Report", href = "http://rpubs.com/meldow/MileStone-Report"),
            
      h4("Project Presentation in Rpubs:"),
      a("http://rpubs.com/meyahia/predNextWord", href = "http://rpubs.com/meyahia/predNextWord"),
      br(),      
      br(),
      "This app is created by ", 
      a("Moawia Eldow", href = "mailto:meyahia@hotmail.com")
      
    ),
    
    mainPanel(
      tabsetPanel(type = "tabs",  
          tabPanel("Prediction", 
            h4("Introduction:"),
            p('The goal of this Shiny application is a predictive language model to predict the next word from an input sentence.This app was built based on n-gram model with Back-off Smoothing.'),
            h4("Usage:"),
            p("You need to input a sentence in the topleft panel, Then press the button to see the predicted next word."),
            h4("You entered:"),
            span(h4(textOutput('phrase')),style = "color:blue"),
            h4("Predicted Next Word:"),
            span(h4(textOutput('predNextWord')),style = "color:blue"),
            p(""),
            'See details about the model in the',
            span('Model Description',style = "color:blue")
            ),        
      
       tabPanel("Model Description", 
         h4("N-gram model:"),
         p("Using a higher probability of the last words in terms will predict next words for certain sentence and this is the core of N-gram model. The n-gram model worked well if the terms were huge enough to cover any cases. However, such model will cost a lot of time training the data."),
         h4('Using back-off technique:'),
         p("One way is just using a back-off model to change n-gram model into (n-1)-gram model. The simplest back-off model will first get the probability of every (n-1) terms, order them and show the first few words as prediction. When no words were shown, a (n-1)-gram model will be used until uni-gram model, which will show the most common words in the corpus."),
         h4("Exploratory  Analysis:"),
         p("see the Milestone report with the exploratory analysis about this project in Rpubs."),
         a("http://rpubs.com/meldow/MileStone-Report", href = "http://rpubs.com/meldow/MileStone-Report"),
         h4("Project Presentation:"),
         p("see also the presentation about this project in Rpubs."),
         a("http://rpubs.com/meyahia/predNextWord", href = "http://rpubs.com/meyahia/predNextWord")
         ) 
      )
    )
  )
))