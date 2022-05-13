## Example 4
## Simple example of using R to automate the production of multiple reports

x <- 1:5

for (i in x) {
  rmarkdown::render("ex4.Rmd", 
                    output_dir = "../output/ex4", 
                    output_file = paste0(i, ".docx"),
                    params = list(a = i))
}
