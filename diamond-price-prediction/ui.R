library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Predict Diamond Price"),

    # Sidebar with a slider input for number
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderCarat", "What is the carat of the diamond?", 
                        0, 5, value = 1, step = 0.01),
            selectInput("selectCut", "What is the cut of the diamond?",
                        choices=c("Ideal", "Premium", "Very Good", "Good", "Fair")),
            selectInput("selectColor", "What is the color of the diamond?",
                        choices=c("D", "E", "F", "G", "H", "I", "J")),
            selectInput("selectClarity", "What is the clarity of the diamond?",
                        choices=c("IF", "VVS1", "VVS2", "VS1", "VS2", "SI1",
                                  "SI2", "I1")),
            submitButton("Submit")
        ),
            
        # Show the value of the slider input
        mainPanel(
            h3("Predicted price from Model 1:"),
            textOutput("pred1"),
        )
    )
))