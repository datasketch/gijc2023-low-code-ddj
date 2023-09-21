
# Before you start, make sure you have all package dependencies
# run source("setup.R")
source("setup.R")


library(tidyverse)
library(sf)
library(leaflet)

url <- "http://web.archive.org/web/20080328104539/http://library.thinkquest.org:80/C006628/data/1945.zip"
if(!dir.exists("data")) dir.create("data")
download.file(url, "data/1945.zip")

unzip("data/1945.zip", exdir = "data/1945")
world1945 <- st_read("data/1945")

# Save as geojson
st_write(world1945, "data/world1945.geojson", append = FALSE)


geojson <- readLines("data/world1945.geojson", warn = FALSE) %>%
  paste(collapse = "\n") %>%
  jsonlite::fromJSON(simplifyVector = FALSE)


leaflet() |> 
  addTiles() |> 
  addGeoJSON(geojson)

# Some personalization with GeoJSON, but it is limited

geojson$style = list(
  weight = 1,
  color = "#555555",
  opacity = 0.8,
  fillOpacity = 0.5
)

leaflet() |> 
  addGeoJSON(geojson, 
             color = "orange")

# More control rendering polygons directly

leaflet(world1945) |> 
  addTiles() |> 
  addPolygons(label = ~NAME) 

centroids <- st_centroid(world1945)


leaflet(world1945) |> 
  addTiles() |> 
  addPolygons(label = ~NAME) |> 
  addLabelOnlyMarkers(data = centroids, label = ~NAME, 
                      labelOptions = labelOptions(noHide = TRUE, 
                                                  direction = 'auto'))


# Let's make a map of the world

library(rnaturalearth)
world <- ne_countries(scale = "medium", returnclass = "sf")

# Create a color palette for the population data
pop_palette <- colorNumeric("YlOrRd", world$pop_est, n=5)

leaflet(data = world) %>%
  addTiles() %>%
  addPolygons(color = "#444444", weight = 1, smoothFactor = 0.5,
              opacity = 1.0, fillOpacity = 0.5,
              fillColor = ~pop_palette(pop_est),
              highlightOptions = highlightOptions(color = "white", weight = 2,
                                                  bringToFront = TRUE)) %>%
  addLegend(pal = pop_palette, values = ~pop_est, opacity = 0.7,
            title = "Population", position = "bottomright")


