
library(tidyverse)

setwd("~/GitHub/Crow/")

# load in and check out data 
purp <- read.csv("all_data_12324.csv")

summary(purp)

unique(purp$sensor)
# 4 unique air sensors labeled "CA-" 1-4 

# edit date to timestamp 
purp_tidy <- purp %>% 
  select(-X) %>% 
  mutate(date = date(time_stamp)) 

ggplot(purp_tidy, aes(x=date, y=pm10.0_atm, col=sensor)) +
  geom_point()

ggplot(purp_tidy, aes(x=date, y=pm2.5_atm, col=sensor)) +
  geom_point() +
  facet_grid('sensor')

ggplot(purp_tidy, aes(x=date, y=pm2.5_atm, col=sensor)) +
  geom_point() +
  facet_grid('sensor')


ggplot(purp_tidy, aes(x=date, y=voc, col=sensor)) +
  geom_point() +
  facet_grid('sensor')

ggplot(purp_tidy, aes(x=humidity, y=pm10.0_atm, col=sensor)) +
  geom_point() +
  facet_grid('sensor')


ggplot(purp_tidy, aes(x=sensor, y=pm2.5_atm, col=sensor)) +
  geom_boxplot()

purp_tidy %>% mutate(month = month(date)) %>% 
  group_by(month, sensor) %>% 
  summarize(meanpm=var(pm2.5_atm)) %>% 
  ggplot() + geom_raster(aes(x=month, y=sensor, fill=meanpm)) +
  scale_fill_viridis_c()

