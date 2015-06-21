library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Predicting the amount of pollutant in year 2014 in an area within the US
              using geographical information"),

#   sidebarPanel(
#   h2('Enter the longitude and Latitude of the place of interest.'),
#   h2('The radius is used to estimate the area of interest'),
#   h3(' '),
#     numericInput('lon', 'Logitude in degress', -77, min = -125, max = -66, step = 1),
#     numericInput('lat', 'Latitude in degress', 39, min = 24, max = 50, step = 1),
#     numericInput('radius', 'Radius in miles', 40, min = 20, max = 80, step = 1),
#     actionButton('goButton', 'Go!')
# #     submitButton('Submit')
#   ),
  sidebarPanel(
      p('This app predicts the amount of pollutant namely Ozone and PM2.5,
        in a particular area within the US using geographical information for year 2006.'),
      p('Hope you will enjoy it!'),
      br(),
    sliderInput('lon', 'Logitude in degrees', -77, min = -125, max = -66, step = 1),
    sliderInput('lat', 'Latitude in degrees', 39, min = 24, max = 50, step = 1),
    sliderInput('radius', 'Radius in miles', 40, min = 20, max = 80, step = 1),
    actionButton('goButton', 'Go!')
    #     submitButton('Submit')
  ),
  mainPanel(
    
    p('In order to know the average ozone and PM2.5 in your location of interest in 2006,
        please enter the longitude and latitude of the place. You also need to enter
        the radius from the location over which the average pollutant calculation will be made.'),
    p('The prediction algorithm uses the radius info to determine which sensor data to be
        included in the average pllutant calculation. In case you get a blank output, 
        you can increase your radius to increase the chance of finding sensor data in the area'),
    p('Please note that only the geographical locations within the US are considered.
      Therefore, the range of input data has been limited to the geographical area
      of continental US.'),
    p('For example the default longitude and latitude is for the city of Baltimore, MD.'),
    
    h3('Result of Prediction of Average Pollutant in the Area'),
    tableOutput('table')
  )

))