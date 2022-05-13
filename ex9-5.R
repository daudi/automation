## Using XLConnect to create and modify Excel spreadsheets

library(XLConnect)
library(fingertipsR)

## Under 75 mortality rate: all causes (Indicator 108)
## County and Unitary Authority level
x <- fingertips_data(IndicatorID = 108, AreaTypeID = 102)
x <- x[1:10, ]

dir.create("../output/ex9", showWarnings = FALSE)

outfile <- "../output/ex9/ex9-5.xlsx"
wb <- loadWorkbook(filename = outfile, create = TRUE)

## Create a sheet 
createSheet(wb, name = "Sheet1")


## Write some data to a sheet
writeWorksheet(object = wb,       # The workbook object
               data = x,          # The data to write
               sheet = "Sheet1",  # The sheet number (can also use sheet name)
               startRow = 1,      # The row where we start writing
               startCol = 1       # The column where we start writing
               )


# Create a (named) cell style
important <- createCellStyle(wb, name = "Important")
# Specify the cell style to use a solid foreground color
setFillPattern(important, fill = XLC$"FILL.SOLID_FOREGROUND")
# Specify the foreground color to be used
setFillForegroundColor(important, color = XLC$"COLOR.RED")
# Make it two decimal places
setDataFormat(important, format = "0.00")

# Find the Value column in the data 
val_col <- which(names(x) == "Value")
highval <- which(x$Value > 550)

# Apply the style to some rows in the value column
setCellStyle(wb, sheet = 1, row = highval + 1, col = val_col, cellstyle = important)

# Set the column width
setColumnWidth(wb, sheet = 1, column = val_col, width = 5000)

saveWorkbook(wb)
