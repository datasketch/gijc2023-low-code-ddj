



## This is a set up file to make sure you have the relevant 
## dependencies installed, do not modify unless you know
## what you are doing


## Get a list of local dependencies and save them locally

# Get relevant dependencies
# Internal lines of code to identify dependencies
deps <- rsconnect::appDependencies() |>
  dplyr::mutate(github_username = dplyr::case_when(
    package == "d3.format" ~ "dreamRs",
    source == "github" ~ "datasketch",
    .default = NA
  ))
# dspkgs <- c("hdbase", "hdtable", "hdtype", "hdviz", "httype")
# deps <- deps |> filter(package %in% dspkgs)
readr::write_rds(deps, "setup.deps.rds")

## Install packrat

if (!require("packrat", character.only = TRUE)) {
  install.packages("packrat", dependencies = TRUE)
}

## Init Packrat to take package snapshots
library(packrat)
packrat::init()
#
#
# Install dependencies
# Install tidyverse
if (!require("tidyverse", character.only = TRUE)) {
  install.packages("tidyverse", dependencies = TRUE)
}
# Install remotes
if (!require("remotes", character.only = TRUE)) {
  install.packages("remotes", dependencies = TRUE)
}


# Install remotes
if (!require("janitor", character.only = TRUE)) {
  install.packages("janitor", dependencies = TRUE)
}


# # if (!require("geodato", character.only = TRUE)) {
# #   remotes::install_github("datasketch/geodato")
# # }
# # if (!require("makeup", character.only = TRUE)) {
# #   remotes::install_github("datasketch/makeup")
# # }
#
# # if (!require("hdtype", character.only = TRUE)) {
# #   remotes::install_github("datasketch/hdtype")
# # }
# # if (!require("hdtable", character.only = TRUE)) {
# #   remotes::install_github("datasketch/hdtable")
# # }
# # if (!require("hdbase", character.only = TRUE)) {
# #   remotes::install_github("datasketch/hdbase")
# #}
#
if (!require("dsconnect", character.only = TRUE)) {
  remotes::install_github("datasketch/dsconnect")
}
#
package_dependencies <- readRDS("setup.deps.rds")
packages_to_install <- purrr::transpose(package_dependencies)
#
# # Check each package and install if it's not already installed
purrr::walk(packages_to_install, function(p){
  if (!require(p$package, character.only = TRUE)) {
    if(p$source == "CRAN"){
      install.packages(p$package, dependencies = TRUE)
    }
    if(p$source == "github"){
      remotes::install_github(file.path(p$github_username,
                                        p$package))
    }
  }
})
#
# message("\nSet up done!\n")
#
packrat::snapshot()


##### After we have local snapshots


