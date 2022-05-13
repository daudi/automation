## Using XLConnect to create and modify Excel spreadsheets

library(XLConnect)

infile  <- "../input/SSS_monitoring_form_201819.xlsx"
outfile <- "../output/ex9/ex9-4.xlsx"
file.copy(infile, outfile, overwrite = TRUE)

wb <- loadWorkbook(filename = outfile)

## Write some data to a sheet - by default with header
sss <- matrix(1:6, ncol = 2)
  
writeWorksheet(object = wb,             # The workbook object
               data = sss,              # The data to write
               sheet = "Quarter 1",     # The sheet number (can also use sheet name)
               startRow = 46,           # The row where we start writing
               startCol = 3,            # The column where we start writing
               header = FALSE           # Don't include a header
               )


saveWorkbook(wb)
