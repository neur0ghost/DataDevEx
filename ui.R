library(shiny) 
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Lean Body Mass Calculator"),
    
    sidebarPanel(
      numericInput('age', 'Insert your age in years', 25),
      numericInput('weight', 'Insert your weight in kilograms', 70) ,
      numericInput('height', 'Insert your height in centimeters', 170, min = 20, max = 250, step = 1),
      selectInput('gender', label=h4("Select gender"), choices = list("Male"=1, "Female"=0), selected="Male"),
      submitButton('Submit')
    ), 
    
    mainPanel(
        p('The Lean Body Mass (LBM) is a part of the body. It is normally defined to be the body weight minus the body fat. Typically lean body mass is 60-90% of the total body mass. Normally, men have higher port of lean body mass than women. Some anaesthetic agents dosage, especially water-soluble drugs, are routinely based on the lean body mass value. Many formulas have been developed in the past for the estimation of the lean body mass. The following are some of them. This calculator gives out result for all the fitting formulas.
          '),
      p('To calculate LBM, we used the Boer Formula'),
      tags$div(
        tags$ul(
          tags$li('Men: eLBM = 0.407weight(kg) + 0.267height(cm) - 19.2'),
          tags$li('Women: eLBM = 0.252weight(kg) + 0.473height(cm) - 48.3')
        )
      ),
    
      h4('Taking into account the values entered by you:'), 
      p('weight:'), verbatimTextOutput("inputweightvalue"),
      p('height:'), verbatimTextOutput("inputheightvalue"),
      p('gender:'), verbatimTextOutput("inputgendervalue"),
      h4('Your LBM is:'),
      verbatimTextOutput("estimation"),
      p('This means that you have:'),strong(verbatimTextOutput("diagnostic"),
                                          p('body fat mass'))
      
      
      )
      
    )   
  )