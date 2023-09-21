
library(tidyverse)
library(sf)
library(leaflet)

if (!require("remotes", character.only = TRUE)) {
  install.packages("remotes", dependencies = TRUE)
}
if (!require("dsconnect", character.only = TRUE)) {
  remotes::install_github("datasketch/dsconnect")
}


## Start Setup by restoring R packages 

packrat::status()
packrat::restore()




