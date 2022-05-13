## Example 1
## Simple example of using R to automate part of an analytical pipeline
## Separate data for each local authority

## install packages if required
## install.packages("tidyverse")
## install.packages("fingertipsR", repos = "https://dev.ropensci.org") 
## library(tidyverse)
## library(fingertipsR)

## Under 75 mortality rate: all causes (Indicator 108)
## County and Unitary Authority level
x <- fingertips_data(IndicatorID = 108, AreaTypeID = 102)

head(x)
# View(x)

area_names <- unique(x$AreaName)

for (this_area in area_names) {
  i <- x$AreaName == this_area
  outfile <- paste0("../output/ex1/", this_area, ".csv")
  write.csv(x[i, ], file = outfile, row.names = FALSE)
}
