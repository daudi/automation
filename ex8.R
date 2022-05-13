## Using officer to create many powerpoint presentations
## with a customised design

library(officer)
library(fingertipsR)

## Under 75 mortality rate: all causes (Indicator 108)
## County and Unitary Authority level
x <- fingertips_data(IndicatorID = 108, AreaTypeID = 102)

## Function to plot mortality trends
mortplot <- function(x) {
  x <- x[x$Sex == "Male", ]
  plot(x$TimeperiodSortable, x$Value, las = 1,
       main = "Mortality rate")
}

area_names <- unique(x$AreaName)[1:5]

for (this_area in area_names) {
  i <- x$AreaName == this_area
  outfile <- paste0("../output/ex8/", this_area, ".pptx")
  pres <- officer::read_pptx("../input/custom-design.pptx")
  pres <- add_slide(pres, layout = "Title Slide", master = "Office Theme")
  pres <- ph_with_text(pres, this_area, type = "ctrTitle")
  pres <- add_slide(pres, layout = "Two Content", master = "Office Theme")
  pres <- ph_with_text(pres, "Mortality trends - males", type = "title")
  pres <- ph_with_vg(pres, mortplot(x[i, ]), type = "body", index = 2)
  print(pres, target = outfile) 
}
