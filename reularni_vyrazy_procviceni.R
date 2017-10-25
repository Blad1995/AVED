## procvičování regulární výrazy
library("stringr")

ceny <- c("plavky 1200Kč", "zelenina 34 Kč", "kapesníky neměli",
          "2x rum      379 Kč", "sluneční brýdle 300Kč", "sušenky 37 Kč + 23 Kč",
          "tyčinky do uší byly zdarma" )

r1 <- str_c("[[:digit:]]+[:space:]*[Kk]č")

str_subset(ceny, r1)

str_count(ceny, r1)



# std_locate a match ----------------------------------------------------------


r2 <- str_c("([[:digit:]]+)[:space:]*[Kk]č")

library("magrittr")
str_extract(ceny, r2)

#první možnost
str_extract(ceny, r2) %>% str_extract("[:digit:]+") %>% as.numeric()

str_match(ceny, r2)[,2] %>% as.numeric()

str_extract_all(ceny, r2) %>% (function(x) as.numeric(str_extract(x, "\\d+")))

#nebo lapply





# replace -----------------------------------------------------------------

s <- c("s-chunk.csv", "t-cosi.tsv", "p-xxxl.sav", "s-003.sav", "t-12.csv")

r3 <- regex("([[:alpha:]]+-{1})[[:alnum:]]*(\\.{1}.*)", multiline = FALSE)

str_view_all(s, r3)

repl <- str_c("\\1", str_pad(seq_along(s), width = 3, pad = "0"), "\\2")

str_replace(s, r3, repl)
