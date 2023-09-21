library(tidyverse)
library(rvest)
library(dsconnect)
library(janitor)


url <- "https://en.wikipedia.org/wiki/List_of_countries_and_dependencies_by_population"
web_page <- read_html(url)

population_table <- web_page |> 
  html_nodes("table") 
population_table <- population_table[[1]] |> 
  html_table()

str(population_table)

pop <- population_table |> 
  dplyr::select(`Country / Dependency`, Population)
pop <- janitor::clean_names(pop)


pop2 <- pop |> 
  dplyr::mutate(population = as.numeric(gsub(",","",population))) |> 
  dplyr::filter(country_dependency != "World")

DT::datatable(pop2)

# Upload visualizations or charts to datasketch
library(dsconnect)

username <- "username"
token <- "TOKENHERE"

ds_write(pop2, "jp-test/world-population-3", 
         username = username,
         token = token)


