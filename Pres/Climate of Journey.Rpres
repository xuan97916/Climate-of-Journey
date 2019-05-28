Climate of Journey
========================================================
author: Xu An, Shang Zhiyu, Mou hongying
date: May 27th, 2019
autosize: true

- Shinyapps Link: https://cojumds.shinyapps.io/climate_of_journey/
- Github: https://github.com/xuan97916/Climate-of-Journey

Introduction
========================================================

'Climate of Journey' is an applcation using weather data of each city for 2-5 years to let the travelers to know what is climate of the city and give them suggestions that in which time is the best to travel.

The climate informations include:
- Average Temperature
- Average humidity
- Average rainfall
- Tourism Score


Developing Process
========================================================
According to Data science pipelines, we have done these step to develop our application:

#### Step1: Questions
  - What types of weather data can represent the climatic conditions of an area?
  - How to give users suggestions in a good way?
  
#### Step2: Obtain Weather Data
  - We use web crawler to get weather data in many aspects on the website and save them as .csv format.

#### Step3: Data Cleaning
  - Some weather data are missing, in order to get the result accuratly, we use GBDT - a machine learning algorithm to fix the NA value.
  
Developing Process
========================================================

  

  
#### Step4: Data Exploring
  - We draw all the weather data in plot and use correlation analysis to observe the inner relationship between number of tourists and weather condition each month.

#### Step5: Data Modeling
 - We solved the model using machine learning and get formula of number of tourists and weather condition as follows:
 $$
  I = T - 0.55 *(1-RH)*(T-58)
 $$

- Where: I is human comfort; T(Fahrenheit Degrees) is the ambient temperature prediction value, T(Fahrenheit Degrees)=T(Celsius Degrees) *9/5+32 is the relative humidity prediction value.

Summary of Experience 
========================================================
1. Make a brainstorm in the group to ask questions.
2. Try data sources as many as you can.
3. Web crawler is more efficient.
4. Using machine learning algorithm (e.g. GBDT, lightGBM) to fix the NA value is better than mean or median, especially in Big Data.


### Data source
- https://en.tutiempo.net/
- http://www.geonames.org/
- https://www.noaa.gov/climate
- http://webservice.webxml.com.cn/
- https://data.worldbank.org/indicator
