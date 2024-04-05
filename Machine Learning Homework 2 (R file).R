
library(tidyverse)


#Read in data.
Q4_2018 <- read.csv("C:/Users/paddy/OneDrive - Trinity College Dublin/Machine Learning Homework 2/dublinbikes_2018_Q4.csv")
Q4_2019 <- read.csv("C:/Users/paddy/OneDrive - Trinity College Dublin/Machine Learning Homework 2/dublinbikes_2019_Q4.csv")
Q4_2020 <- read.csv("C:/Users/paddy/OneDrive - Trinity College Dublin/Machine Learning Homework 2/dublinbikes_2020_Q4.csv")
Q4_2021 <- read.csv("C:/Users/paddy/OneDrive - Trinity College Dublin/Machine Learning Homework 2/dublinbikes_2021_Q4.csv")

Q3_2018 <- read.csv("C:/Users/paddy/OneDrive - Trinity College Dublin/Machine Learning Homework 2/dublinbikes_2018_Q3.csv")
Q3_2019 <- read.csv("C:/Users/paddy/OneDrive - Trinity College Dublin/Machine Learning Homework 2/dublinbikes_2019_Q3.csv")
Q3_2020 <- read.csv("C:/Users/paddy/OneDrive - Trinity College Dublin/Machine Learning Homework 2/dublinbikes_2020_Q3.csv")
Q3_2021 <- read.csv("C:/Users/paddy/OneDrive - Trinity College Dublin/Machine Learning Homework 2/dublinbikes_2021_Q3.csv")

Q2_2019 <- read.csv("C:/Users/paddy/OneDrive - Trinity College Dublin/Machine Learning Homework 2/dublinbikes_2019_Q2.csv")
Q2_2020 <- read.csv("C:/Users/paddy/OneDrive - Trinity College Dublin/Machine Learning Homework 2/dublinbikes_2020_Q2.csv")
Q2_2021 <- read.csv("C:/Users/paddy/OneDrive - Trinity College Dublin/Machine Learning Homework 2/dublinbikes_2021_Q2.csv")

Q1_2019 <- read.csv("C:/Users/paddy/OneDrive - Trinity College Dublin/Machine Learning Homework 2/dublinbikes_2019_Q1.csv")
Q1_2020 <- read.csv("C:/Users/paddy/OneDrive - Trinity College Dublin/Machine Learning Homework 2/dublinbikes_2020_Q1.csv")
Q1_2021 <- read.csv("C:/Users/paddy/OneDrive - Trinity College Dublin/Machine Learning Homework 2/dublinbikes_2021_Q1.csv")


#View.
View(Q3_2018)
View(Q4_2018)

View(Q1_2019)
View(Q2_2019)
View(Q3_2019)
View(Q4_2019)

View(Q1_2020)
View(Q2_2020)
View(Q3_2020)
View(Q4_2020)

View(Q1_2021)
View(Q2_2021)
View(Q3_2021)
View(Q4_2021)

#Find unique station names for each dataset.
names_Q3_2018 <- unique(Q3_2018$NAME)
names_Q4_2018 <- unique(Q4_2018$NAME)

names_Q1_2019 <- unique(Q1_2019$NAME)
names_Q2_2019 <- unique(Q2_2019$NAME)
names_Q3_2019 <- unique(Q3_2019$NAME)
names_Q4_2019 <- unique(Q4_2019$NAME)

names_Q1_2020 <- unique(Q1_2020$NAME)
names_Q2_2020 <- unique(Q2_2020$NAME)
names_Q3_2020 <- unique(Q3_2020$NAME)
names_Q4_2020 <- unique(Q3_2020$NAME)

names_Q1_2021 <- unique(Q1_2021$NAME)
names_Q2_2021 <- unique(Q2_2021$NAME)
names_Q3_2021 <- unique(Q3_2021$NAME)
names_Q4_2021 <- unique(Q4_2021$NAME)

#Find common station names between the datasets
common_stations <- Reduce(intersect, list(
  unique_Q3_2018, unique_Q4_2018,
  unique_Q1_2019, unique_Q2_2019, unique_Q3_2019, unique_Q4_2019,
  unique_Q1_2020, unique_Q2_2020, unique_Q3_2020, unique_Q4_2020,
  unique_Q1_2021, unique_Q2_2021, unique_Q3_2021, unique_Q4_2021
))

#Print common station names
print(common_stations)

#Save the common stations.
saveRDS(common_stations, "C:/Users/paddy/OneDrive - Trinity College Dublin/Machine Learning Homework 2/common stations.rds")

#Subset all datasets to include only common stations
Q3_2018_c <- subset(Q3_2018, NAME %in% common_stations)
Q4_2018_c <- subset(Q4_2018, NAME %in% common_stations)
Q1_2019_c <- subset(Q1_2019, NAME %in% common_stations)
Q2_2019_c <- subset(Q2_2019, NAME %in% common_stations)
Q3_2019_c <- subset(Q3_2019, NAME %in% common_stations)
Q4_2019_c <- subset(Q4_2019, NAME %in% common_stations)
Q1_2020_c <- subset(Q1_2020, NAME %in% common_stations)
Q2_2020_c <- subset(Q2_2020, NAME %in% common_stations)
Q3_2020_c <- subset(Q3_2020, NAME %in% common_stations)
Q4_2020_c <- subset(Q4_2020, NAME %in% common_stations)
Q1_2021_c <- subset(Q1_2021, NAME %in% common_stations)
Q2_2021_c <- subset(Q2_2021, NAME %in% common_stations)
Q3_2021_c <- subset(Q3_2021, NAME %in% common_stations)
Q4_2021_c <- subset(Q4_2021, NAME %in% common_stations)

#Combine into one large linear dataset.
all_data <- rbind(
  Q3_2018_c, Q4_2018_c,
  Q1_2019_c, Q2_2019_c, Q3_2019_c, Q4_2019_c,
  Q1_2020_c, Q2_2020_c, Q3_2020_c, Q4_2020_c,
  Q1_2021_c, Q2_2021_c, Q3_2021_c, Q4_2021_c
)

View(all_data)

write.csv(all_data, file = "C:/Users/paddy/OneDrive - Trinity College Dublin/Machine Learning Homework 2/all data common stations.csv")

all_data <- read.csv("C:/Users/paddy/OneDrive - Trinity College Dublin/Machine Learning Homework 2/all data common stations.csv")

all_data <- read_csv("C:/Users/paddy/OneDrive - Trinity College Dublin/Machine Learning Homework 2/all data common stations.csv")


head(all_data)

tail(all_data)



