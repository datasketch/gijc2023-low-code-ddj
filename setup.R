
## Start Setup by restoring R packages 

packrat::status()

result <- tryCatch({
  packrat::restore()
  "Success"  # This value gets returned and stored in 'result' if there's no error
}, 
error = function(e) {
  warning("Error in packrat::restore(): ", e$message)
  "Error"  # This value gets returned and stored in 'result' if there's an error
})

print(result)






# Install other packages

if (!require("remotes", character.only = TRUE)) {
  install.packages("remotes", dependencies = TRUE)
}
if (!require("dsconnect", character.only = TRUE)) {
  remotes::install_github("datasketch/dsconnect")
}

if (!require("tidyverse", character.only = TRUE)) {
  install.packages("tidyverse", dependencies = TRUE)
}

if (!require("sf", character.only = TRUE)) {
  install.packages("sf", dependencies = TRUE)
}

if (!require("leaflet", character.only = TRUE)) {
  install.packages("leaflet", dependencies = TRUE)
}

if (!require("rvest", character.only = TRUE)) {
  install.packages("rvest", dependencies = TRUE)
}

if (!require("janitor", character.only = TRUE)) {
  install.packages("janitor", dependencies = TRUE)
}

if (!require("rnaturalearth", character.only = TRUE)) {
  install.packages("rnaturalearth", dependencies = TRUE)
}

if (!require("rnaturalearthdata", character.only = TRUE)) {
  install.packages("rnaturalearthdata", dependencies = TRUE)
}

if (!require("DT", character.only = TRUE)) {
  install.packages("DT", dependencies = TRUE)
}



