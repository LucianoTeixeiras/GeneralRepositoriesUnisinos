#Load Dataset

#XLS-XLSX
library(readxl)
atlas2013_dadosbrutos_pt <- read_excel("Source/atlas2013_dadosbrutos_pt.xlsx")
View(atlas2013_dadosbrutos_pt)

#CSV com separador ";"

library(readr)
municipios <- read_delim("Source/municipios.csv", 
                         ";", escape_double = FALSE, trim_ws = TRUE)
View(municipios)
