library(XLConnect)

server <- function(input, output) {
  

  get_path_best_date <- reactive({
    x <- file.info(list.files(path = "C:/Users/MehdiD/Desktop/downloadbutton/files", full.names = TRUE, recursive = TRUE))
    path_of_data <- as.character(row.names(x)[which.max(x$mtime)])
    path_of_data
  })
  
  get_name_best_date <- reactive({
    x <- file.info(list.files(path = "C:/Users/MehdiD/Desktop/downloadbutton/files", full.names = TRUE, recursive = TRUE))
    path_of_data <- as.character(row.names(x)[which.max(x$mtime)])
    y <- strsplit(path_of_data,"/")
    z <- y[[1]][7]
    a <- gsub(".xlsx","",z,fixed = TRUE)
    a
    })

  
  data_to_dow <- reactive({
    wb <- XLConnect::loadWorkbook(get_path_best_date(), create = TRUE)
    wb
  })
  
  output$downloadrapport_trim_action <- downloadHandler(
    filename = function() {
      paste(get_name_best_date(),".xlsx",sep="")
      },
    content = function(file) {
      XLConnect::saveWorkbook(data_to_dow(),file)
    }
  )
}
