# 5_cvičení
library(readr)

data("txhousing", package = "ggplot2" )
head(txhousing)
class(txhousing)



# RData načítání ----------------------------------------------------------
rm(tec00001)
load("exdata05/tec00001.RData")



levels(tec00001$geo)



# csv_soubor --------------------------------------------------------------

rm(d)
d <- readr::read_csv("exdata05/tec00001.csv",
                     col_types = cols(
                         na_item = col_character(),
                         unit = col_character(),
                         geo = col_character(),
                         time = col_date(format = ""),
                         values = col_double()
                     ))

rm(d)

d <- readr::read_tsv("exdata05/tec00001.tsv.gz", col_types = "cdddddddddddd")


head(d)




# xls ---------------------------------------------------------------------

d <- readxl::read_excel("exdata05/Eurostat_Table_tec00001FlagDesc_11c465e3-eae1-4c8e-b956-f473d4a78a0a.xls",
                        range = "A4:Y47", col_types = c("text",rep(c("numeric","skip"), 12)))
head(d)




# experiment1.csv - delimiters --------------------------------------------

rm(d)
cat(head(readr::read_lines("exdata05/experiment.csv"), n = 15), sep = "\n")

d <- read_delim("exdata05/experiment.csv", delim = ":",
                skip = 8,
                col_types = cols(
                    id = col_integer(),
                    name = col_character(),
                    height = col_integer(),
                    weight = col_integer(),
                    treatment = col_factor(levels = c("control", "group A", "group B")),
                    value = col_double()),
                locale = locale(decimal_mark = ","))
head(d)




# experiment2 -------------------------------------------------------------

rm(d)
cat(head(readr::read_lines("exdata05/experiment2.csv"), n = 15), sep = "\n")

d <- read_delim("exdata05/experiment2.csv", delim = ":",
                col_names = c("id", "name", "height", "weight", "treatment", "value"),
                col_types = cols(
                    id = col_integer(),
                    name = col_character(),
                    height = col_integer(),
                    weight = col_integer(),
                    treatment = col_factor(levels = c("control", "group A", "group B")),
                    value = col_double()),
                locale = locale(decimal_mark = ","))
head(d)



# experiment2 -------------------------------------------------------------

rm(d)
guess_encoding("exdata05/experiment3.csv")

cat(head(readr::read_lines("exdata05/experiment3.csv", locale = locale(encoding = "ISO-8859-2")), n = 15), sep = "\n")



experiment <- read_delim("exdata05/experiment3.csv", delim = ":",
                skip = 8,
                col_types = cols(
                    id = col_integer(),
                    name = col_character(),
                    height = col_integer(),
                    weight = col_integer(),
                    treatment = col_factor(levels = c("control", "group A", "group B")),
                    value = col_double()),
                locale = locale(decimal_mark = ",", encoding = "ISO-8859-2"))
head(experiment)





# ukládání_dat ------------------------------------------------------------

save(experiment, tec00001, txhousing, file = "exdata05/results.RData")
rm(list = ls())
load("exdata05/results.RData")


write_csv(experiment, path = "exdata05/results_experiment.csv")
write_csv(tec00001, path = "exdata05/results_tec.csv")
write_csv(txhousing, path = "exdata05/results_txhousing.csv")






# load sav file -----------------------------------------------------------

library(haven)
read_spss("exdata05/nama_10_gdp.sav")
nama_data <- read_sav("exdata05/nama_10_gdp.sav")
head(nama_data)

nama_data$TIME <- zap_labels(nama_data$TIME)
nama_data$GEO <-  as.factor(nama_data$GEO)
head(nama_data)
