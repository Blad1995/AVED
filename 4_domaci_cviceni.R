# procvičovaní na doma


# If použití --------------------------------------------------------------


x <- 0
if (is.na(x)) {
    print("NA")
} else if (x == 1) {
    print("jedna")
} else if (x > 1) {
    print("větší")
} else {
    message("menší")
}

y <- 0:100
summary(y)







# lapply ------------------------------------------------------------------

x <-c(1,2,4,NA,5)
y <- c(1,NA,1,NA,2,2,2)

aver <- lapply(list(x,y),mean, na.rm = TRUE)
aver_err <- lapply(list(x,y),mean)
aver_own <- lapply(list(x,y), function(x) sum(x, na.rm = TRUE)/length(x))
print(aver)
print(aver_err)
#chyba protože počítá do délky i NA
print(aver_own)













# map_and_safely ----------------------------------------------------------
library(purrr)
v <- list(1, 2, "a", 5)
map(v, log)

res <- map(v, safely(log))

res_t <- transpose(res)

bad_index <- which(map_lgl(res_t$result, ~is_null(.)))

print("Chyba nastala na prvku s hodnotou: ")
print(v[bad_index])
res_t$error[bad_index]



# possibly ----------------------------------------------------------------

v <- list(1, 2, "a", 5)

#chyby nahradí "Ahoj"
res <- map(v, possibly(log, "Ahoj"))
print(res)







# split_matrix ------------------------------------------------------------

head(iris)

irises <-  split(iris, iris$Species)




