
# Get relevant dependencies
# Internal lines of code to identify dependencies
# deps <- rsconnect::appDependencies() |> 
#   mutate(github_username = case_when(
#     package == "d3.format" ~ "dreamRs",
#     source == "github" ~ "datasketch",
#     .default = NA
#   ))
# write_rds(deps, "setup.deps.rds")

# Install tidyverse
if (!require("tidyverse", character.only = TRUE)) {
  install.packages("tidyverse", dependencies = TRUE)
}
# Install remotes
if (!require("remotes", character.only = TRUE)) {
  install.packages("remotes", dependencies = TRUE)
}
  
packages_to_install <- purrr::transpose(readRDS("setup.deps.rds"))

# Check each package and install if it's not already installed
purrr::walk(packages_to_install, function(p){
  if (!require(p$package, character.only = TRUE)) {
    if(p$source == "CRAN"){
      install.packages(p$package, dependencies = TRUE)
    }
    if(source == "github"){
      devtools::install_github(file.path(p$github_username,
                                         p$package))
    }
  }
})





