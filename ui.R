
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Central Limit Theorum"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(

        sliderInput("sample.size",
                    "Sample size:",
                    min = 200,
                    max = 1000,
                    value = 500),

        numericInput("mean", "Expected value:", 10, min = 0, max = 100)
    ),

    # Show a plot of the generated distribution
    mainPanel(
             plotOutput("distPlot"),
             p("The central limit therum (CLT)establishes that, 
               for the most commonly studied scenarios, 
               when independent random variables are added, 
               their sum tends toward a normal distribution."),
             p("Here we use simulation results to comfirm CLT. 
                A sequence of independent and identically distributed random variables are
                drawn from normal distribution for 1000 times.
                The user can define the sample size n (200 ~ 1000) and expected value (0 ~ 100). 
                The variance of the distribution is fixed at 1.
               "),
             p("The sample mean is calculated for the 1000 simulations and ploted in the histogram.
                The mean of the sample mean should converge to the expected value.
                The variance of the sample mean should converge to 1/n."))
    )
  )
)
