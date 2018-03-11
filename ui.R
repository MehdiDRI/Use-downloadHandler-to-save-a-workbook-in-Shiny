library(shiny)



ui <- fluidPage(
  titlePanel("title panel"),
  
  sidebarLayout(
    sidebarPanel("sidebar panel"),
    mainPanel(
      downloadButton("downloadrapport_trim_action", "Download the report")
      
    )
  )
)