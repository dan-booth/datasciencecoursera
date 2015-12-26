# Load packages
library(shiny)
library(stringr)

# Define server logic required to build the screen elements
shinyServer(function(input, output) {
    # The converted text to render
    output$converted_text <- renderText({
        # If-else logic to determine which type of conversion
        # is required
        if (input$conv_type == "Upper") {
            str_to_upper(input$text)
        }
        else if (input$conv_type == "Lower") {
            str_to_lower(input$text)
        }
        else {
            str_to_title(input$text)
        }
    })
})