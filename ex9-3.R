## Using XLConnect to create and modify Excel spreadsheets

library(XLConnect)
library(fingertipsR)

## Under 75 mortality rate: all causes (Indicator 108)
## County and Unitary Authority level
x <- fingertips_data(IndicatorID = 108, AreaTypeID = 102)

outfile <- "../output/ex9/ex9-3.xlsx"
wb <- loadWorkbook(filename = outfile, create = TRUE)

## Create a sheet 
createSheet(wb, name = "Sheet1")


## Write some data to a sheet - by default with header
writeWorksheet(object = wb,  # The workbook object
               data = 1:5,   # The data to write
               sheet = 1,    # The sheet number (can also use sheet name)
               startRow = 1, # The row where we start writing
               startCol = 1  # The column where we start writing
               )


## Write some data to a sheet - without the header
writeWorksheet(object = wb,   # The workbook object
               data = 1:5,    # The data to write
               sheet = 1,     # The sheet number (can also use sheet name)
               startRow = 1,  # The row where we start writing
               startCol = 3,  # The column where we start writing
               header = FALSE # Don't print the header
               )

## Write some data to a sheet - transposed
writeWorksheet(object = wb,   # The workbook object
               data = t(1:5), # The data to write, transposed
               sheet = 1,     # The sheet number (can also use sheet name)
               startRow = 1,  # The row where we start writing
               startCol = 5,  # The column where we start writing
               header = FALSE # Don't print the header
               )

saveWorkbook(wb)
