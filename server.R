library(shiny) 

LBM<-function(weight,height,gender) 
{  as.numeric(gender) * (0.407*weight + 0.267*height-19.2) + (1-as.numeric(gender))*(0.252*weight+0.473*height-48.3)}

diagnostic_f<-function(weight,height,gender){
  weight - (as.numeric(gender) * (0.407*weight + 0.267*height-19.2) + (1-as.numeric(gender))*(0.252*weight+0.473*height-48.3))
 
}

shinyServer(
  function(input, output) {
    
    output$inputweightvalue <- renderPrint({input$weight})
    output$inputheightvalue <- renderPrint({input$height})
    output$inputgendervalue <- renderPrint({input$gender})
    output$estimation <- renderPrint({LBM(input$weight,input$height,input$gender)})
    output$diagnostic <- renderPrint({diagnostic_f(input$weight,input$height,input$gender)})
  } 
)
