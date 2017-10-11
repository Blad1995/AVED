



# prvni_ukol_totez_fce --------------------------------------------------------------

totez <- function(x) {
    x
}

# zkouska jestli funguje

totez(1:5)
totez(dplyr::tibble(s = c(1, 2, 5, 4, 3)))



# 2_ukol_odmocnina_fce ------------------------------------------------------------------

root <- function(x, n = 2) {
    #teoreticky kdyz je x necelé
    if (x < 1 || !is.numeric(x)) {
        return()
    }

    x ^ (1 / n)
}
root(4)
root(8, 3)
root(8, 1.14)




# 3_úkol_prace_na_seznamech------------------------------------------------------------------

s <- list(1, 1:2, 1:3, 1:4, 1:5)

v <- sapply(s, mean)




# 4_ukol ------------------------------------------------------------------

Sign <- function(x) {
    if (x > 0) {
        return(1L)
    } else if (x < 0) {
        return(-1L)
    } else{
        return(0)
    }
}
Sign(5)
Sign(-2)
Sign(Inf)
Sign(0)




# 5_ukol ------------------------------------------------------------------
#funkce která vrací opakované použití fce
replicate(5, expr = runif(10), simplify = FALSE)




# 1p_ukol_vekt_fce --------------------------------------------------------

vekt <- function(n) {
    if (is.numeric(n) && is.vector(n) && length(n) == 1
        && n > 0 && n %% 1 == 0) {
        return(1:n)
    } else{
        warning("Děláš blbost")
        return(NA)
    }
}

vekt(3)
vekt(-2)
vekt(1.5)
vekt(1:3)
vekt("a")




# 2p_ukol_nmax ------------------------------------------------------------

nmax <- function(x, n = 1) {
    if (!(is.numeric(x) && is.vector(x) && n %% 1 == 0)) {
        stop("Wrong use of nmax")
    }
    if (n < 0 || length(unique(x)) < n) {
        return(NA)
    }

    sort(unique(x), decreasing = TRUE)[n]
}

nmax(c(1, 2, 4, 8, 1, 5, 3), 3)

nmax(c(1, 2, 4, 8, 10, 5, 3))
nmax("AHoj")
nmax(c(4, 1, 5, 4), -2)
nmax(c(4, 1, 5, 4), 6)





# Iterace_1_ukol ----------------------------------------------------------

#načíst mpg z ggplot balíčku
data("mpg", package = "ggplot2")

# 1)
lapply(mpg, class)

# 2)

vapply(mpg, function(x)
    sum(is.na(x)), integer(1))

purrr::map_int(mpg, ~ sum(is.na(.)))




# Interace_2_ukol ---------------------------------------------------------

t_test_fction <- function(x) {
    if (!is.numeric(x)) {
        return(NA)
    }
    t.test(x)
}
# 1)
purrr::map(mpg, t_test_fction)

# 2)
purrr::map(mpg, ~ t_test_fction(.)["p.value"])

