## Using XLConnect to create and modify Excel spreadsheets

library(XLConnect)
library(fingertipsR)

## Under 75 mortality rate: all causes (Indicator 108)
## County and Unitary Authority level
x <- fingertips_data(IndicatorID = 108, AreaTypeID = 102)

dir.create("../output/ex9", showWarnings = FALSE)

outfile <- "../output/ex9/ex9-1.xlsx"
wb <- loadWorkbook(filename = outfile, create = TRUE)

## Create a sheet 
createSheet(wb, name = "Sheet1")


## Write some data to a sheet
writeWorksheet(object = wb,  # The workbook object
               data = x[1:10, 1:10], # The data to write
               sheet = 1,   # The sheet number (can also use sheet name)
               startRow = 1, # The row where we start writing
               startCol = 1  # The column where we start writing
               )

saveWorkbook(wb)
