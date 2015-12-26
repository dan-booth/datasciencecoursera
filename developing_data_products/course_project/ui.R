library(shiny)

# Define UI for application
shinyUI(
    navbarPage("Text string case converter",
               tabPanel("Converter",
                        fluidPage(
                            fluidRow(
                                # Heading
                                h2("Text string case converter", align = "center"),
                                # Widgets to define the conversion required
                                column(4,
                                       textInput("text",
                                                 label = h5("Enter your text"))
                                ),
                                column(4,
                                       selectInput("conv_type",
                                                   label = h5("What case would you like to convert to?"),
                                                   choices = list("Upper",
                                                                  "Lower",
                                                                  "Title"))
                                ),
                                # Converted text result
                                column(4,
                                       h4("Converted text", align = "left"),
                                       textOutput("converted_text"))
                            ),
                            hr()
                        )
               ),
               tabPanel("Documentation",
                        fluidPage(
                            h2("How to use the app", align = "center"),
                            br(),
                            HTML("1. Enter the text you would like to convert into the <i>Enter your text</i> text box. See the example below:"),
                            br(),
                            br(),
                            img(src = "step1.png"),
                            br(),
                            br(),
                            HTML("2. Choose the type of conversion you would like from the <i>What case would you like to convert to</i> dropdown list. See the example below:"),
                            br(),
                            br(),
                            img(src = "step2.png"),
                            br(),
                            br(),
                            HTML("3. You will now see your converted text under the <i>Converted text</i> heading. See the example below:"),
                            br(),
                            br(),
                            img(src = "step3.png")
                        )
               )
    )
)