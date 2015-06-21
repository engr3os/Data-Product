library(shiny)
library(fields)

load("polldata.RData")

## Input is data frame with 
## lon: Longitude
## lat: Latitude
## radius: radius in miles
pollutant <- function(df){
  df <- data.frame(lon = df$lon, lat = df$lat, radius = df$radius)
  x <- data.matrix(df[, c("lon", "lat")])
  r <- df$radius
  d <- rdist.earth(monitors, x)
  use <- lapply(seq_len(ncol(d)), function(i){
    which(d[, i] < r[i])
  })
  levels <- sapply(use, function(idx){
    with(pollavg[idx, ], tapply(Level, Parameter.Name, mean))
  })
  dlevels <- as.data.frame(t(levels))
  names(dlevels) <- c("Ozone", "PM2.5")
  names(df) <- c("Longitude", "Latitude", "Radius")
  data.frame(df, dlevels)

}


shinyServer(
  function(input, output){
    output$table <- renderTable({
      if(input$goButton ==1) {pollutant(input)}
      })
  }
)