library(shiny)
library(ggplot2)
library(nycflights13)
library(data.table)

flights$date<-as.Date(paste(flights$year, flights$month, flights$day, sep = '-'))

flightsDT <- data.table(flights)

shinyServer(function(input, output) {

        #flghts<-flights[flights$month>=input$startmonth,]        
        
        
        output$ggplot <- renderPlot({
                
                ggplot(flights, aes_string(x = input$var1, y = input$var2, col = as.factor(input$col))) + geom_point() +
                        geom_smooth(method = 'lm', formula = y ~ poly(x, as.numeric(input$poly)), se = FALSE,col="blue")
                
        })
        
        output$model <- renderPrint({
                
                fit <- lm(flights[, input$var2] ~ poly(flights[, input$var1], input$poly),na.rm=TRUE)
                summary(fit)
                
        })
        
        output$coeff <- renderTable({
                
                fit <- lm(flights[, input$var2] ~ poly(flights[, input$var1], input$poly))
                summary(fit)$coeff
                
        })
        
})