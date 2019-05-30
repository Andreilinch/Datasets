library(tidyverse)

df <- read_csv('Crime_Data_from_2010_to_Present.csv')
df
str(df)


df$`Date Reported` <- as.Date(df$`Date Reported`, format = "%m/%d/%Y")
df$`Date Occurred` <- as.Date(df$`Date Occurred`, format = "%m/%d/%Y")
df$`Weapon Used Code` <- as.factor(df$`Weapon Used Code`)

df$YearOccur  <- as.numeric(format(df$`Date Occurred`,'%Y'))

ggplot(df, aes(x= YearOccur)) + 
  geom_bar()

#ggplot(df %>% filter(YearOccur==2010), aes(x= `Date Occurred`)) + 
#  geom_bar()

ggplot(df, aes(x= YearOccur, fill = `Weapon Used Code`)) + 
  geom_bar()