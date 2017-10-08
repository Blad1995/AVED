# druhe cviceni script

v1 <- c(TRUE, FALSE, TRUE)

#Rko má výchozí typ double
v2 <- c(1L, 2L, 3L) # nebo c(1:3)
v3 <- c(4, 5, 6)

v_a <- c(v1, v2, v3)


typeof(v_a)
class(v_a)

#délka vektoru
length(v_a)


#__________________________________________________
#úkol 2

#výběr všechno kromě
v_a[-c(1, length(v_a))]

#každý třetí prvek
v_a[seq(from = 3, to = length(v_a), by = 3)]

#bez nul ve vektoru
v_a[v_a != 0]

#v pripade v_a[c(T,T,F)]
# by se recykloval true/false výběr (T,T,F, T,T,F, T,T,F)

#__________________________________________________
#úkol 3

x <- seq(from = 1, to = 5, by = 0.01)
y <- log(x)

#asp je navíc... axes ratio y/x
plot(x, y, type = 'l', asp = 1)


#__________________________________________________
# úkol 4

vyber <- sample(100, 30)

setrizeny_vyber<- sort(vyber)
setrizeny_vyber[1]
setrizeny_vyber[2]
setrizeny_vyber[length(setrizeny_vyber-1)]



# Krásy složeného úročení
rm(list=ls())

vklad <- 1000
urok <- 0.02
roky <- 50

#   úkol 1
# uročení se počítá jako v*(1+r)^n
vyvoj_dluhu <- vklad * (1 + urok)^c(1:roky)


# úkol 2
# po roce
vyvoj_dluhu[1]

# po 30-ti letech
vyvoj_dluhu[30]

# na konci
vyvoj_dluhu[roky]

# každý sudý rok
vyvoj_dluhu[seq(from = 2, to = roky, by = 2)]



# úkol 3

nah_urok <- 1 + runif(roky,min = 0, max = 2 * urok)
k_nah_urok <- cumprod(nah_urok)
n_vyvoj_dluhu <- vklad * k_nah_urok

plot(1:roky, vyvoj_dluhu, type = 'l', col = "black")
lines(1:roky, n_vyvoj_dluhu, col = "red")


# úkol 4

diff_vklad <- n_vyvoj_dluhu - vyvoj_dluhu
proc_diff_vklad <- diff_vklad / vyvoj_dluhu

plot(1:roky, proc_diff_vklad, type = 'l', col = "red")
abline(h = 0)

# úkol 5
 (1:roky)[vyvoj_dluhu > 2*vklad][1]




# Růst hospodářství

load("exdata02.RData")

# úkol 1

deflator <- hdp_bc / hdp_sc * 100

plot(cas, deflator, type = 'l')

# jen pro kontrolu
abline(h = 100, lty = 3)
abline(v = 2010, lty =3)


tempr_hdp_bc <- hdp_bc[-1]/hdp_bc[-length(hdp_bc)]-1
tempr_hdp_sc <- hdp_sc[-1]/hdp_sc[-length(hdp_sc)] -1
inflation <- deflator[-1]/ deflator[-length(deflator)] -1
plot(cas[-1], tempr_hdp_bc, type = "l", ylim = c(-0.2,0.3))
lines(cas[-1],tempr_hdp_sc, type = "l", col = "red")
lines(cas[-1], inflation, type = "l", col = "blue")


# Elasticita
# úkol 1
rm(list= ls())
price <- c(100,90,80,70,60,50)
quantity  <- c(30,60,90,120,200,210)
plot(price, quantity * price)


# HW !!!!
max_price <- max(price)
i_max_price <- seq_along(price)[price == max_price]
min_price <- min(price)
i_min_price <- seq_along(price)[price == min_price]
q1 <- quantity[i_max_price]
q0 <- quantity[i_min_price]
p1 <- max_price
p0 <- min_price


maxmin_elasticity <- ((q1 - q0) / (q0 + q1)) / ((p1 - p0) / (p1 + p0))

pn_1 <- price[-1]
pn_0 <- price[-length(price)]

qn_1 <- quantity[-1]
qn_0 <- quantity[-length(quantity)]

elast_res <- ((pn_1+pn_0)*(qn_1-qn_0)) / ((pn_1-pn_0)*(qn_0+qn_1))



