#Movies UI ---------------------------------------------------------------

movies_ui <- function(id, label = "movies_ui") {
  ns <- NS(id)
  tagList(
    fluidRow(
      
      h3("Barbie Movies Over Time"),
      plotOutput(ns("plot"))
      
      )
    )

  
}




#Movies Server ----------------------------------------------------

movies_server <- function(id, parent, label = "movies_server") {
  
  moduleServer(id, function(input, output, session) {
    
    output$plot <- renderPlot({
      ggplot(movie_table, aes(release_year, number_of_films)) +
        geom_bar(stat = "identity", fill = "#a62675ff") +
        labs(x = "Release Year",
             y = "Count") +
        theme_barbie()
    })
   
  })
  
}







