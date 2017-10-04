rm(list=ls())
library(tibble)


df <- tibble(id = 1:5,
             value = c(1.3, 1.7, 2.7, 3.15, 17))
print(df)


# two rows of tibble
df[1:2, ]

# only dataset value
df["value"]

# only value VECTOR
df$value


# load exdata3
load("exdata03.RData")


#compute deflator
deflator <- macro$gdp_nominal / macro$gdp_real * 100
macro$deflator <- deflator

#compute inflation and add NA as first value
macro$inflation <- c(NA, macro$deflator[-1] /
                         macro$deflator[-length(macro$deflator)] - 1)

#compute real_growth and add NA as first value
#nrow is better way (all columns have same nrow)
macro$real_growth <-  c(NA, macro$gdp_real[-1] /
                            macro$gdp_real[-nrow(macro)] - 1)

# just plot it
plot(macro$time, macro$inflation, type = "l")
lines(macro$time, macro$real_growth, col = "red")

# Obezita
head(experiment)

# number of observations
observation_number <- nrow(experiment)

experiment$BMI <- experiment$weight /(experiment$height / 100)^2

# detect names ending with a or e
detected_females <- stringr::str_detect(experiment$name, "[ae]$")


# extract True and False as factors
experiment$genders <- factor(detected_females, levels = c(TRUE, FALSE), labels = c("female", "male"))

# make Miriam and Ingrid females
experiment$genders[experiment$name == "Ingrid" | experiment$name == "Miriam"] <- "female"

# other choice
experiment$genders[experiment$name %in% c("Miriam", "Ingrid")] <- "female"



# median of whole dataset / male / female
median(experiment$BMI)

median(experiment$BMI[experiment$genders == "male"])

median(experiment$BMI[experiment$genders == "female"])


# mark obese person
experiment$obese <- experiment$BMI >= 30

# make new dataset of only obese people
obese <- experiment[experiment$obese,]

# erase vector of logical obese indicator
obese$obese <- NULL

# order by BMI
obese <- obese[order(obese$BMI, decreasing = TRUE),]

head(obese, n = 8)


# devide obese into groups TREATMENT / CONTROL

in_treatment <- rep(TRUE, nrow(obese))

in_treatment[sample(nrow(obese), nrow(obese) / 2)] <- FALSE

obese$group <- factor(in_treatment, levels = c(TRUE, FALSE),
                      labels = c("treatment", "control"))


