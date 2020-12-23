#### Workspace setup ####
setwd("/Users/cgh/Documents/Final_Project")

### Load Lirary ####
library(janitor)
library(dplyr)
library(readr)

#### Data Loading and Pre-Processing ####
ces_data_org <- read.csv("ces2019_phone.csv")
print(dim(ces_data_org))

# Select variables for data analyzing
ces_data <- 
  ces_data_org %>% 
  select(age,
         q3, #Gender
         q4, #province or territoryare
         language_CES, #Language CES 
         q9, #interested in this federal election?
         q10, # certain to vote, likely to vote, unlikely to vote
         q13, #Satisfaction with the federal government
         q61, # highest level of education 
         q62, # religion
         q64, #country were you born
         q67, #first language 
         q68, #employment status
         q69, # household income before taxes
         q71, #household size
         p50, #presently married, living with a partner, divorced, separated, widowed, have never been married
         q11) #party will you vote for

# Variables Rename
ces_data <- ces_data %>% 
  rename(age = age, 
         gender = q3, 
         place_living_province = q4, 
         language_ces = language_CES, 
         interest_vote = q9, 
         will_vote = q10, 
         satisfaction_gov = q13, 
         
         education = q61, 
         religion_has_affiliation = q62, 
         place_birth_country = q64, 
         
         language_first = q67, 
         employment_status = q68, 
         income_family = q69, 
         hh_size = q71,
         marital_status = p50, 
         vote_party = q11) 
# only consider Liberal and Conservatives
ces_data <- 
  ces_data %>% 
  filter(vote_party %in% c(1,2))

#summary(ces_data)

# Save Data
write_csv(ces_data, "outputs/ces_data.csv")