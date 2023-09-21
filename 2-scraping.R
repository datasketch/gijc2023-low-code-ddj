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

install.packages("DT")
DT::datatable(pop2)


library(dsconnect)

ds_write(pop2, "jpmarindiaz/world-population-3", 
         username = "jpmarindiaz",
         token = "nVNaDbXqygpj84oQ")


