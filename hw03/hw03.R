# Homework: datasets, factors, and the like
# =========================================

# Goal: use tibbles and factors

# clear workspace
rm(list = ls())

# load necessary libraries
library(tibble)

# load the data needed
load("hw03.RData")

# 1. in dataset modal_split: keep only rows where vehicle is TRN and the data are not
#    older than 2004-01-01; remove the rest

modal_split <- modal_split[modal_split$vehicle == "TRN" & modal_split$time >= "2004-01-01",]
save(modal_split, file = "results.RData")

# 2. in dataset train_total: keep only rows where units are MIO_PKM; remove the rest
train_total <-  train_total[train_total$unit == "MIO_PKM", ]
save(modal_split, train_total, file = "results.RData")

# 3. create new (tibble) dataset transit with the following variables: time, train_share,
#    train_volume, and transit_volume

transit <- train_total["time"]
transit$train_share <- modal_split$values
transit$train_volume <- train_total$values
transit$transit_volume <-  transit$train_volume * 100 / transit$train_share

save(modal_split, train_total, transit, file = "results.RData")

# 4. sort transit dataset so that the first row is for 2004, the second for 2005, etc.

transit <- transit[order(transit$time, decreasing = FALSE), ]
save(modal_split, train_total, transit, file = "results.RData")

# 5.  add transit_growth variable to the dataset transit

transit$transit_growth <- c(NA,(transit$transit_volume[-1] / transit$transit_volume[-nrow(transit)] - 1 ) * 100)
save(modal_split, train_total, transit, file = "results.RData")
