

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






