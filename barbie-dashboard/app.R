#Read in modules
source("global.R")
source("get-data.R")
source("R/movies.R", local = TRUE)

ui <- fluidPage(
  
  tags$head(
    includeCSS("www/style.css")
  ),
  
  #Navigation
  
  tabBox(width = 12,
         id = "primary_box",
         tabPanel(value = "movies",
                  h3(id = "nav_title", "Barbie Movies"),
                  movies_ui(id = "movies"))
  )
  
  
)

# Server
server <- function(input, output) {
  movies_server(id = "movies", parent = session)
}

# Run the application 
shinyApp(ui = ui, server = server)
