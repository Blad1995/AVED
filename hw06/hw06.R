# Homework: strings manipulation
# =====================================================

# Goal: work with strings

# clear workspace
rm(list = ls())

# 1. load necessary libraries

library(stringr)
library(tibble)
library(readr)

# 2. load the data ("hw06.txt"; encoding UTF8) into people

people  <- read_lines("hw06.txt")

save(people, file = "results.RData")

# 3. create df1

cols <- str_split_fixed(people, pattern = "\\|", n = 3)
colnames(cols) <- c("name", "height", "weight")

df1 <- as.tibble(cols)
save(people, df1, file = "results.RData")

# 4. clean names in df2
df2 <- df1

df2$name <- str_replace_all(df2$name,pattern = "\"", replacement = "")
df2$name <- str_trim(df2$name, side = "both")


save(people, df1, df2, file = "results.RData")

# 5. change height and weight to numeric in df3
df3 <- df2

df3$height <- str_extract(df3$height, pattern = "[[:digit:]]+")
df3$weight <- str_extract(df3$weight, pattern = "[[:digit:]]+")

df3$height <- as.numeric(df3$height)
df3$weight <- as.numeric(df3$weight)

save(people, df1, df2, df3, file = "results.RData")

# 6. add bmi to df4
df4 <- df3

df4$bmi <- round(df4$weight / (df4$height / 100)^2, 1)

save(people, df1, df2, df3, df4, file = "results.RData")

# 7. add message to df4

df4$message <- str_c(df4$name," has BMI ", df4$bmi)

save(people, df1, df2, df3, df4, file = "results.RData")
