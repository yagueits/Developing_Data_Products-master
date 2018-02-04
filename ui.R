library(shiny)
shinyUI(fluidPage(
  titlePanel("Normalizing Standard penetration test"),
  sidebarLayout(
    sidebarPanel(
      numericInput("Density", "What is the average unit weight (kN/m3)?", 
                         value = 18, min = 15, max = 25, step = 0.5),
      sliderInput("NF", "Where is the Phreatic level (depth, m)?", 0, 30, value = 5),
      checkboxInput("SPTnet", "Show SPT", value = TRUE),
      checkboxInput("SPTNormalized", "Show SPT Normalized", value = TRUE)
    ),
    mainPanel(
      plotOutput("plot1"),
      h3("SPT vs Normalized SPT:")

    )
  )
))