
library(shiny)
library(dplyr)
library(readr)

dta_kickstarter <- read.csv("data/kickstarter-projects/ks-projects-201801.csv")


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- dta_kickstarter$pledged
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')

    })

})
