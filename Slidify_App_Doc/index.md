---
title       : Predicting the amount of pollutants in any location within the US
subtitle    : Description of the shiny app "pred_pollutant_app"" 
author      : Oluwatobi Olabiyi
job         : Data Science
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction

1. This presentation gives detailed desricption of the overall functionality and backend processing of the shining app "pred_pollutant_app"
2. The app can be found at https://engr3os.shinyapps.io/pred_pollutant_app
3. Distributed monitoring sensors are used to monitor polluntants amounts
4. Sometimes the pollution information of a particular location is not availble due to unavailability of monitoring sensor in that location
5. Pollution data from multiple sensors close to the location can be used used to predict the average amount of pollutant at the place of interest
 

--- .class #id 

## Pred_pollutant_app
The app was designed by taking the year 2014 pollutant data from EPA website http://aqsdr1.epa.gov/aqsweb/aqstmp/airdata. The data is subset and stored in data frame pollavg and it contains only longitude, latitude, pollutant name and the level of the pollutant. 
### Preprocessing
First few rows of data frame pollavg is given below:

```
##    Longitude Latitude Parameter.Name    Level
## 1  -65.91548 18.17794          Ozone 0.022065
## 2  -66.15062 18.42009          Ozone 0.019618
## 3  -66.12653 18.44077          Ozone 0.007396
## 4 -157.87117 21.30338          Ozone 0.026106
## 5 -158.08861 21.32374          Ozone 0.023506
## 6  -80.32681 25.58638          Ozone 0.033748
```

---

## Average Pollutant Prediction of a Location

This section develops the algorithm to predict the average amount of pollutant of a location based on Roger Peng's yhat illustration in Data Product class Video.

This is the main section of the shinyapp pred_pollutant_app.

Given the logitude and latitude of a particular location, we can calculate the average PM2.5 and Ozone pollutants in an area of a particular radius.


For example, given the logitude and laitude of Baltimore, MD are -76.61 and 39.28 respectively. We can predict the average pollutant within 30 miles radious as:


```r
pollutant(data.frame(lon = -76.61, lat = 39.28, radius = 30))
```

```
##      lon   lat radius     Ozone PM2.5...Local.Conditions
## 1 -76.61 39.28     30 0.0442916                 9.626262
```

---

## Further Details

Please note that the shiny app contains sliders that can be used to select longitude, latitude and radius parameters. 

The longitude and latitude have been limited to ranges with the continental US (-124.62 to -62.36 for longitude and 24.31 to 49.2 for latitude)
(Source: https://en.wikipedia.org/wiki/Extreme_points_of_the_United_States)

The radius is limited between 20 and 80 miles to provide reasonable prediction. 

For a particulatr location, with longitude and latitude, you can vary the radius to see the efect of including more or less monitors.

You can easily find the longitude and latitude of several US cities here: http://www.mapsofworld.com/lat_long/usa-lat-long.html
