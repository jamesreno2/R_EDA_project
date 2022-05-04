library(dplyr)
library(ggplot2)
library(tidyverse)
library(lubridate)
library(stringr)

aac_intake = read.csv('Austin_Animal_Center_Intakes.csv')

head(aac_intake)

aac_intake = rename_with(aac_intake, tolower)

head(aac_intake)

aac_intake$datetime = mdy_hms(aac_intake$datetime)

unique(aac_intake$animal.type)
unique(aac_intake$intake.type)
unique(aac_intake$intake.condition)


  
min(aac_intake$datetime)
max(aac_intake$datetime)

sum(is.na(aac_intake))

unique(aac_intake$age.upon.intake)

aac_intake$numeric_age = abs(as.numeric(sapply(str_split(aac_intake$age.upon.intake, ' '), `[`,1)))
aac_intake$units_age = sapply(str_split(aac_intake$age.upon.intake, ' '), `[`,2)

aac_intake %>% mutate(numeric_age = str_split(aac_intake$age.upon.intake,' ')[[]][1])

