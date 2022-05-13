## Example 2
## Simple example of using R to automate part of an analytical pipeline
## This example uses by() with a custom function.

library(fingertipsR)

## Under 75 mortality rate: all causes (Indicator 108)
## County and Unitary Authority level
x <- fingertips_data(IndicatorID = 108, AreaTypeID = 102)

head(x)
View(x)

## Custom function to do some work on each block of data.
write_LA_data <- function(x) {
  this_area <- x$AreaName[1]
  outfile <- paste0("../output/ex1/", this_area, ".csv")
  write.csv(x, file = outfile, row.names = FALSE)
}


xx <- by(x, list(x$AreaName), write_LA_data)
