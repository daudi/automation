## Create input directory, e.g. for powerpoint template
## if you are using https://rstudio.data-science.rc.ucl.ac.uk don't forget to set your working directory folder first 
dir.create("../input")

## Create output directories
lapply(paste0("../output/ex", 1:8), dir.create, recursive = TRUE)
