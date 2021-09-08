
library(readxl)
library(tidyverse)
library(readr)
library(lubridate)
set.seed(1234)

setwd("/Users/fatiq/Documents/GitHub/EDS-222-stats/")

read_excel("labs/2-week-two/data/in/PakAir 2019-8-2.xlsx") %>% 
  select(city = City, longitude, latitude, date_time = `Datetime (UTC+5)`, pm_25 = `PM2.5 (μg/m3)`, aqi = `US AQI`) %>% 
  separate(`date_time`, c('date', 'time'), sep = ' ', extra = 'merge') %>% 
  distinct(date, .keep_all = TRUE) %>% 
  select(-time) %>% 
  write_csv2("labs/2-week-two/data/out/airpol-PK-crowdsourced.csv")

