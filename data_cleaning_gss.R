#### Workspace setup ####
setwd("/Users/cgh/Documents/Final_Project")

### Load Lirary ####
library(janitor)
library(dplyr)
library(readr)

#### Data Loading and Pre-Processing ####
gss_data_org <- read.csv("AAGMb5ly.csv") 
print(dim(gss_data_org))  

# Select variables for data analyzing
gss_data <- gss_data_org %>% 
  select(CASEID, 
         agegr10, 
         slm_01, 
         sex, 
         brthcan, 
         yrarri,
         region, 
         marstat,
         ehg3_01b, 
         hsdsizec,
         religflg, 
         lanhome, 
         lan_01,
         famincg2, 
         ttlincg2)

# Variables Rename
gss_data <- gss_data %>% 
  rename(agegr10 = agegr10, 
         feelings_life = slm_01, 
         gender = sex,
         place_birth_canada = brthcan, 
         yeargr_arrived_canada = yrarri, 
         place_living_province = region, 
         marital_status = marstat, 
         education = ehg3_01b, 
         hh_size = hsdsizec, 
         religion_flag = religflg, 
         language_home = lanhome, 
         language_official = lan_01, 
         income_family = famincg2, 
         income_respondent = ttlincg2)  

summary(gss_data)

# Save Data
write_csv(gss_data, "outputs/gss_data.csv")