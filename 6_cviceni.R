# 6_cvičení

library(stringr)
library(readr)
library(tibble)

rm(list = ls())


# 1_ukol ------------------------------------------------------------------

nums <- str_pad(as.character(1:30), pad = "0", width = 3 )

file_names <- str_c("data", nums, ".csv")

print(file_names)



# 2_ ukol ------------------------------------------------------------------

length(file_names)
str_length(file_names)
#měli by být všechny stejně dlouhhé
all(str_length(file_names) == str_length(file_names[1]))
