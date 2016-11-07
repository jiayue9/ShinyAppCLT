
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
  

  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
    size   <- input$sample.size

    
    x <- list()
    for(i in 1:1000){
        x[[i]] <- rnorm(size, mean = input$mean, sd = 1)
    }
    
    y <- as.array(unlist(lapply(x, mean)))
    hist(y, freq = FALSE, breaks = seq(mean(y) - 0.3, mean(y) + 0.3, length.out = 50),
         col = 'darkgray', border = 'white',
         xlim = c(mean(y) - 0.3, mean(y) + 0.3),
         ylim = c(0, 18))
    abline(v = mean(y), col = "red", lwd = 2)
  })

  


})
