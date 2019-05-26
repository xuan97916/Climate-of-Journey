library(shiny)
library(leaflet)
library(ggplot2)
library(gdata)

city_loc = read.csv(file = './data/city_loc.csv')
weather_data = read.csv(file = './data/weather_data.csv')
city_desc = read.csv(file = './data/city_desc.csv')

# Define server logic required to plot various variable against mpg
shinyServer(
  function(input, output, session) {
    
    # Create the map
    output$map <- renderLeaflet({
      leaflet() %>%
        addTiles(
          attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
        ) %>%
        setView(lng = 100.85, lat = 18.45, zoom = 3)%>%
       addMarkers(data = city_loc,label = city_loc$city,labelOptions = labelOptions(noHide = T, textsize = "13px"))
    })
    
    # city title
    output$city_title = renderUI({paste(city_loc[which(city_loc$latitude==input$map_marker_click$lat),1])})
    
    ###### Temperature Part ####### 
    
    #create the chart
    output$plot_tem <- renderPlot({
      ggplot(weather_data[which(weather_data$City==city_loc[which(city_loc$latitude==input$map_marker_click$lat),1]&weather_data$Year==2017),], aes(x=factor(Month), y=Average.Temperature,group=12,color = 2)) +
        geom_line() +
        guides(colour=FALSE) +
        theme_bw() +
        ylim(-15,45)+
        xlab('Month')+
        ylab('Average Temperature')
    })
    
    #create the discrible of the temperature
    output$tem_desc_hot <- renderUI({
      paste(city_desc[which(city_desc$city==city_loc[which(city_loc$latitude==input$map_marker_click$lat),1]),2])  #使用paste()可以连接字符串
    })
    
    output$tem_desc_cold <- renderUI({
      paste(city_desc[which(city_desc$city==city_loc[which(city_loc$latitude==input$map_marker_click$lat),1]),3])
    })
    
    ###### Humidity Part ####### 
    
    #create the chart
    output$plot_hum <- renderPlot({
      ggplot(weather_data[which(weather_data$City==city_loc[which(city_loc$latitude==input$map_marker_click$lat),1]&weather_data$Year==2017),], aes(x=factor(Month), y=Average.relative.humidity,group=12,color = 2)) +
        geom_line() +
        guides(colour=FALSE) +
        theme_bw()+
        ylim(0,100)+
        xlab('Month') +
        ylab('Average relative humidity')
    })
    
    #create the discrible of the temperature
    output$hum_desc_1 <- renderUI({
      paste(city_desc[which(city_desc$city==city_loc[which(city_loc$latitude==input$map_marker_click$lat),1]),4])
    })
    output$hum_desc_2 <- renderUI({
      paste(city_desc[which(city_desc$city==city_loc[which(city_loc$latitude==input$map_marker_click$lat),1]),5])
    })
    
  
    ###### Rainfall Part ####### 
    
    #create the chart
    output$plot_rain <- renderPlot({
      ggplot(weather_data[which(weather_data$City==city_loc[which(city_loc$latitude==input$map_marker_click$lat),1]&weather_data$Year==2017),], aes(x=factor(Month), y=Total.rainfall,fill=2)) +
        geom_col()+
        xlab('Month') +
        ylab('Total rainfall')+
        guides(fill=FALSE)
    })
    
    #create the discrible of the temperature
    output$rain_desc_1 <- renderUI({
      paste(city_desc[which(city_desc$city==city_loc[which(city_loc$latitude==input$map_marker_click$lat),1]),6])
    })
    output$rain_desc_2 <- renderUI({
      paste(city_desc[which(city_desc$city==city_loc[which(city_loc$latitude==input$map_marker_click$lat),1]),7])
    })
    
    
    ###### Tourism Score Part ####### 
    
    #create the chart
    output$plot_tour <- renderPlot({
      ggplot(weather_data[which(weather_data$City==city_loc[which(city_loc$latitude==input$map_marker_click$lat),1]&weather_data$Year==2017),], aes(x=factor(Month), y=Score,group=12,color = 2,color=2)) +
        geom_line() +
        guides(colour=FALSE) +
        theme_bw()+
        ylim(0,100)+
        xlab('Month') +
        ylab('Travel Score')
        
    })
    
    #create the discrible of the temperature
    output$tour_desc <- renderUI({
      paste(city_desc[which(city_desc$city==city_loc[which(city_loc$latitude==input$map_marker_click$lat),1]),8])
    })
   
    ###### test part #######
    #data_2017 = weather_data[which(weather_data$City==input$des_city&weather_data$Year==2017),5]
    #output$test <- renderPrint(input$map_marker_click$lat)  
    #output$test = renderTable(city_loc[which(city_loc$latitude==input$map_marker_click$lat),1])
  }
)