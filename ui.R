library(shiny)
library(leaflet)
library(ggplot2)
library(RColorBrewer)

weather_data = read.csv(file = './data//weather_data.csv')
city_loc = read.csv(file = './data/city_loc.csv')



# Define UI for for miles per gallon applocation
shinyUI(fluidPage(
  includeCSS("styles.css"),
  tags$style(type="text/css",
             ".shiny-output-error { visibility: hidden; }",
             ".shiny-output-error:before { visibility: hidden; }",
             " div.col-sm-4 {overflow:scroll;height:680px;}",
             " div#city_title {font-size: 25px; font-weight: bold;text-align: center;margin-bottom:20px;}"
  ),
  titlePanel(title = h2('Climate of Journey',align = 'center')),
  sidebarLayout(
    
    sidebarPanel(

      #selectInput('des_city','Select your Destination',
      #            selected = 'Beijing',
      #            choices = c('Beijing','Shanghai','Tokyo','Kuala Lumpur','Paris','Dubai','New York','Los Angeles','Sydney','Sao Paulo','Seoul','Cairo')),
      htmlOutput('city_title',container = div),
      
      ###### Temperature Part #######    
      
      # head of the temperature
      h6('Temperature',align = 'center'),
      
      # plot of the temperature
      plotOutput("plot_tem",
                 brush = brushOpts(id = "plot_brush", fill = "#ccc", direction = "x"),
                 height = 250),
      
      # discrible of the temperature
      htmlOutput('tem_desc_hot'),
      htmlOutput('tem_desc_cold', container = div),
      
      
      ###### Humidity Part #######    
      
      # head of the Humidity
      h6('Humidity',align = 'center'),
      
      # plot of the Humidity
      plotOutput("plot_hum",
                 brush = brushOpts(id = "plot_brush", fill = "#ccc", direction = "x"),
                 height = 250),
      
      # discrible of the Humidity
      htmlOutput('hum_desc_1', container = div),
      htmlOutput('hum_desc_2', container = div),

      
      
      ###### Rainfall Part #######    
      
      # head of the Humidity
      h6('Rainfall',align = 'center'),
      
      # plot of the Humidity
      plotOutput("plot_rain",
                 brush = brushOpts(id = "plot_brush", fill = "#ccc", direction = "x"),
                 height = 250),
      
      # discrible of the Humidity
      htmlOutput('rain_desc_1', container = div),
      htmlOutput('rain_desc_2', container = div),
      
      
      ###### Tourism Score Part #######    
      
      # head of the Humidity
      h6('Tourism Score',align = 'center'),
      
      # plot of the Humidity
      plotOutput("plot_tour",
                 brush = brushOpts(id = "plot_brush", fill = "#ccc", direction = "x"),
                 height = 250),
      
      # discrible of the Humidity
      htmlOutput('tour_desc', container = div)

      
    ),
    mainPanel(
      leafletOutput("map",height = '680px')
      #tableOutput('test')
    )
  )
))
