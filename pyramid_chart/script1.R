library(highcharter)
library(dplyr)
library(gapminder)
library(magrittr)

head(gapminder)

ds <- gapminder%>%
  dplyr::filter(year == max(year))%>%
  dplyr::arrange(-pop)%>%
  head(10)

poblacion_millones <- round(ds$pop / 1e6, 1)  

hc <- ds %>%
  hchart("pyramid",hcaes(x = country, y = pop))%>%
  hc_title(text = "Top 10 de países con mayor población")

hc