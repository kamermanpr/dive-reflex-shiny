# Define UI for dive-reflex viewer
shinyUI(fluidPage(
    
    # Application title.
    titlePanel("The Diving Reflex"),
    p("The diving reflex is a reflex that optimizes respiration to allow staying underwater for extended periods of time. 
      It is strongest in aquatic mammals (e.g., seals, dolphins), but is also found in terrestrial mammals, such as humans.
      The reflex is triggered by cold water contacting the face, and produces a marked decrease in heart rate."),
    br(),
    a("Wikipedia: Mammalian Diving Reflex", href="https://en.wikipedia.org/wiki/Mammalian_diving_reflex"),
  
    fluidRow(
        # Sidebar with numerical input
        hr(),
        column(4,
               wellPanel(
                 h2("Cold water"),
                 h4("Face immersion in cold water"),
                   hr(),
                   numericInput("cold.h2o1", "Starting heart rate (beats/min)", value=80),
                   numericInput("cold.h2o2", "End heart rate (beats/min)", value=80)
                   )),
        column(4, 
               wellPanel(
                 h2("Warm water"),
                 h4("Face immersion in warm water"),
                   hr(),
                   numericInput("warm.h2o1", "Starting heart rate (beats/min)", value=80),
                   numericInput("warm.h2o2", "End heart rate (beats/min)", value=80)
                   )),
        column(4, 
               wellPanel(
                   h2("Breath-hold"),
                   h4("Breath-hold out of water"),
                   hr(),
                   numericInput("breath1", "Starting heart rate (beats/min)", value=80),
                   numericInput("breath2", "End heart rate (beats/min)", value=80)
               ))),
    fluidRow(
        column(12,
               wellPanel(
                   h4("Press to plot"),
                   submitButton("Submit")
               ))),
    fluidRow(
        column(12,
               graphOutput("BarPlot")
               ))
))