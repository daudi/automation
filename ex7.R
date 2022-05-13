## Using officer to create a powerpoint presentation
## with a customised design

library(officer)

pres <- officer::read_pptx("../input/custom-design.pptx")
layout_summary(pres)

## Add the title slide
pres <- add_slide(pres, layout = "Title Slide", master = "Office Theme")
pres <- ph_with_text(pres, "Automation", type = "ctrTitle")

## Add a content slide
pres <- add_slide(pres, layout = "Title and Content", master = "Office Theme")
pres <- ph_with_text(pres, 
                     "Generate presentatons automatically", 
                     type = "title")



print(pres, target = "../output/ex7/example.pptx") 
