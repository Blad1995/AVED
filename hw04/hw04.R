# Homework: function, control structures, and iteration
# =====================================================

# Goal: create functions and use iteration

# clear workspace
rm(list = ls())

# load necessary libraries
library(tibble)

# load the data needed
load("hw04.RData")

# 1. create function alpha(pstar, p)---------------------------------------

alpha <- function(pstar, p){
    if (!(is.numeric(pstar) && length(pstar) == 1 && pstar > 0
          && is.vector(p) && length(p) > 0 && all(p > 0))) {
        # bad arguments handling
        stop("Bad inputs")
    }

    # return desired value
    sqrt(sum((p - pstar) ^ 2) / length(p)) / pstar * 100
}
save(alpha, file = "results.RData")


# 2. create function alpha_df(df, id) -----------------------------------

alpha_df <- function(df, id){
     data <- df[df$id == id, ]
     alpha(data$pstar[1], data$p)
}

save(alpha, alpha_df, file = "results.RData")


# 3. create vector ids --------------------------------------------------
ids = unique(experiment$id)

save(alpha, alpha_df, ids, file = "results.RData")


# 4. create vector alphas -----------------------------------------------

alphas <- purrr::map_dbl(ids,~alpha_df(experiment, .))

save(alpha, alpha_df, ids, alphas, file = "results.RData")


# 5. create tibble outcomes ---------------------------------------------

outcomes <- tibble(id = ids, alpha = alphas)
save(alpha, alpha_df, ids, alphas, outcomes, file = "results.RData")
