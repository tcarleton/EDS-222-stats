
library(readxl)
library(tidyverse)
library(readr)
set.seed(1234)


setwd("/Users/fatiq/Documents/GitHub/EDS-222-stats/")

read_excel("labs/2-week-two/data/in/EPD_USAQI_LOG.xlsx") %>% 
  transmute(date = Date, 
            aqi = as.numeric(USAQI), 
            rand = round(runif(396, min=40, max=200)),
            aqi = if_else(is.na(aqi), rand, aqi)) %>% 
  select(-rand) %>% 
  distinct(date, .keep_all = TRUE) %>% 
  write_csv2("labs/2-week-two/data/out/airpol-PK-govt.csv")
