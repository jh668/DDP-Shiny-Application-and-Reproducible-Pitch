library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    # fit model from diamonds data to form the prediction
    model1 <- lm(price ~ carat+cut+color+clarity, data=diamonds)
    
    # get the prediction from the model
    model1pred <- reactive({
        CaratInput <- input$sliderCarat
        CutInput <- input$selectCut
        ColorInput <- input$selectColor
        ClarityInput <- input$selectClarity
        predict(model1, newdata = data.frame(carat = CaratInput, 
                                             cut = CutInput,
                                             color = ColorInput, 
                                             clarity = ClarityInput))
    })
    
    # return the output of the price prediction
    
    output$pred1 = renderText({
        model1pred()
        })
})
