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
      h2("SPT vs Normalized SPT:"),
      h4("The Standard Penetration Test is a very commonly used test in geotechnics."),
      h4("Despite its name, it requires some corrections to assess its real value."),
      h4(" One of these corrections depends on the phreatic level and density."),
      h4("This app assess this correction"),
      h4("For more information, please, take a look to the presentation")

    )
  )
))