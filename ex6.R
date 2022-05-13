## Using officer to create a powerpoint presentation

library(officer)
library(rvg) ## to create vector graphics (plots that can be edited in Powerpoint)

pres <- officer::read_pptx()
layout_summary(pres)

## Create a title slide
pres <- add_slide(pres, layout = "Title Slide", master = "Office Theme")
layout_properties(x = pres, layout = "Title Slide", master = "Office Theme")
pres <- ph_with_text(pres, str = "Automation", type = "ctrTitle")

## Add a content slide with text
pres <- add_slide(pres, layout = "Title and Content", master = "Office Theme")
layout_properties(x = pres, layout = "Title and Content", master = "Office Theme")
pres <- ph_with_text(pres, str = "Automation detail")
pres <- ph_with_text(pres, str = "This is some text", type = "body")

## Add a content slide with a plot
pres <- add_slide(pres, layout = "Title and Content", master = "Office Theme")
layout_properties(x = pres, layout = "Title and Content", master = "Office Theme")
pres <- ph_with_text(pres, str = "Stunning analysis", type = "title")
pres <- ph_with_vg(pres, plot(1:10), type = "body")

## Add a two content slide with text and a plot
pres <- add_slide(pres, layout = "Two Content", master = "Office Theme")
layout_properties(x = pres, layout = "Two Content", master = "Office Theme")
pres <- ph_with_text(pres, str = "More automation detail", type = "title")
pres <- ph_with_text(pres, str = "This is some text", type = "body", index = 1)
pres <- ph_with_vg(pres, plot(1:10), type = "body", index = 2)

#ph_with_img()

print(pres, target = "../output/ex6/example.pptx") 
