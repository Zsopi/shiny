library(shiny)

shinyUI(fluidPage(
        
        # Application title
        titlePanel("NYC flights data"),
        
        # Sidebar with a slider input for number of bins
        sidebarLayout(
                sidebarPanel(
                        sliderInput("dist",
                                    "Distance:",
                                    min = 0,
                                    max = 5000,
                                    value = 1000),
                        sliderInput("startmonth",
                                    "Start Month:",
                                min = 1,
                                max = 12,
                                value = 1),      

                        sliderInput("startday",
                                    "Start Day:",
                                    min = 1,
                                    max = 31,
                                    value = 1),      

                        sliderInput("endmonth",
                                    "End Month:",
                                    min = 1,
                                    max = 12,
                                    value = 1),      
                        sliderInput("endday",
                                    "End Day:",
                                    min = 1,
                                    max = 31,
                                    value = 1),
                        sliderInput("poly",
                                    "Polynomial:",
                                    min = 1,
                                    max = 15,
                                    value = 2),
      
                        
                        
                                                
                        selectInput('var1', 'X', c('dep_time','dep_delay','air_time','distance'), selected = 'distance'),
                        selectInput('var2', 'Y', c('dep_time','arr_delay','air_time','distance'), selected = 'arr_delay'),
                       selectInput('col', 'Color', c('carrier', 'origin', 'dest'))
                ),
                
                
                
                # Show a plot of the generated distribution
                mainPanel(
                        tabsetPanel(
                                tabPanel("Plot", plotOutput("plot")),
                                tabPanel("gglot", plotOutput("ggplot")),
                                tabPanel("Model", verbatimTextOutput("model")),
                                tabPanel("Coefficients", htmlOutput("coeff"))
                        )
                )
        )
))