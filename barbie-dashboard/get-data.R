#load libraries
library(rvest)
library(dplyr)
library(stringr)

#------------------------------------------------------------------------------------------
#GET DATA FOR BARBIE MOVIES OVER TIME -----------------------------------------------------
#------------------------------------------------------------------------------------------

#get and read url
url <- "https://en.wikipedia.org/wiki/Barbie_(media_franchise)"
barbie_wiki <- read_html(url)

#extract the tables from the wiki page
movie_tables <- barbie_wiki %>%
  html_nodes(".wikitable") %>%
  html_table(fill = TRUE)

#extract only the movie table, extract the year from the release date column, count number of films per year
movie_table <- movie_tables[[1]] %>%
  rename(release_date = `U.S. original release date`) %>%
  mutate(release_year = str_sub(release_date, start = nchar(release_date) - 3)) %>%
  group_by(release_year) %>%
  summarise(number_of_films = n())


#------------------------------------------------------------------------------------------
#READ DATA ABOUT BARBIE'S CAREERS  --------------------------------------------------------
#------------------------------------------------------------------------------------------

#Full dataset
barbie_career_data <- read.csv("../barbie_careers_1959-2020.csv")







