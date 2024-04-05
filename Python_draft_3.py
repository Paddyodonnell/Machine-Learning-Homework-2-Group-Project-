import pandas as pd
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
import numpy as np
import pandas as pd

data = pd.read_csv("C:/Users/paddy/OneDrive - Trinity College Dublin/Machine Learning Homework 2/all data common stations.csv")

print(data.head())
print(data.isnull().sum())
print(data.columns)
print(data['ADDRESS'].value_counts())
print(data['NAME'].value_counts())

# There are about 340,000 data points for every station.
# About equal, that is good.

# Get some sort of usage metric.

# Sort data by ID and update time.
data.sort_values(by=['STATION.ID', 'LAST.UPDATED'], inplace=True)

# Calculate the difference in 'AVAILABLE.BIKES' to get a proxy for usage
data['BIKE.CHANGE'] = data.groupby('STATION.ID')['AVAILABLE.BIKES'].diff().abs()

# Fill NaN values that appear due to the diff operation (first row of each station group)
data['BIKE.CHANGE'] = data['BIKE.CHANGE'].fillna(0)

# the resulting number is percent of bikes taken at that point in time.
data['USAGE.RATE'] = 1 - (data['AVAILABLE.BIKES'] / data['BIKE.STANDS'])

# Now we have two metrics, bike change and usage rate.


# K means clustering

# Prepare the data for clustering (example: average daily usage for each station)
station_usage = data.groupby('STATION.ID')['USAGE.RATE'].mean().reset_index()

# Fit K-means clustering
# Correct instantiation and fitting
kmeans = KMeans(n_clusters=5, random_state=0).fit(station_usage[['USAGE.RATE']])
station_usage['cluster'] = kmeans.labels_

# Identify clusters with low usage
low_usage_clusters = station_usage.groupby('cluster')['USAGE.RATE'].mean().sort_values().index[:2]

# Filter stations in low usage clusters
low_usage_stations = station_usage[station_usage['cluster'].isin(low_usage_clusters)]

print(low_usage_clusters)
print(low_usage_stations)
