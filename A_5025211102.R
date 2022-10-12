## Soal 1

# 1A
x = 3
p = 0.20
probA <- dgeom(x,p)
probA

# 1B
n = 10000
p = 0.20
probB <- mean(rgeom(n, p) == 3)
probB

# 1C
# Jawaban terdapat pada README

# 1D
library(dplyr)
library(ggplot2)

n = 3
p = 0.20
x = 0:10
data.frame(x, prob = dgeom(x, p)) %>%
mutate(Failures = ifelse(x == n, n, "Lainnya")) %>%
ggplot(aes(x = factor(x), y = prob, fill = Failures)) +
geom_col() +
geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0
  ) +
  labs(title = "Peluang X = 3 Gagal Sebelum Sukses Pertama",
       x = "Kegagalan sebelum sukses pertama (x)",
       y = "Peluang") 

# 1E
rataan = 1/p
rataan
varian = (1-p)/(p^2)
varian

## Soal 2

# 2A
p = 0.2
nS = 20
sembuh = 4
peluang = dbinom(sembuh, nS, p)
peluang

# 2B
library(dplyr)
library(ggplot2)

x = 0:20
data.frame(x, prob = dbinom(x, nS, p)) %>%
  ggplot(aes(x = factor(x), y = prob)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0
  ) +
  labs(title = "Peluang (x) pasien sembuh",
       x = "Banyak Pasien Sembuh",
       y = "Peluang") 

# 2C
rataan = nS * p
rataan
varian = nS * p * (1-p)
varian

## Soal 3

# 3A
lamda = 4.5
nA = 6
prob <- dpois(nA, lamda)
prob

# 3B
set.seed(2)

poisson_data  <- data.frame('data' = rpois(365, lamda))

poisson_data  %>% ggplot() +
  geom_histogram(aes(x = data,
                     y = stat(count / sum(count)),
                     fill = data == nA),
                 binwidth = 1,
                 color = 'black',) +
  scale_x_continuous(breaks = 0:10) + 
  labs(x = 'Banyak kelahiran per periode',
       y = 'Proporsi',
       title = 'Distribusi Poisson untuk kelahiran bayi dalam 1 tahun') +
  theme_bw()

# 3C
# Jawaban terdapat pada README

# 3D
rataan = lamda
rataan
varian = lamda
varian

## Soal 4

# 4A
xChi = 2
v = 10
prob <- dchisq(xChi, v, ncp = 0, log = FALSE)
prob

# 4B
x <- rchisq(100, v)
hist(x, freq = FALSE, xlim = c(0,31), ylim = c(0,0.2), main="Distribusi Chi-Square")

curve(dchisq(x, v), from = 0, to = 30, n = 100, col = "green", lwd = 2, add = TRUE)

# 4C
rataan = v
rataan
varian = 2*v
varian

## Soal 5

# 5A
lamda = 3
prob <- dexp(lamda, rate = 1, log = FALSE)
prob

# 5B
par(mfrow = c(2,2))
set.seed(1)
hist(rexp(10, lamda), main = "Distribution Exponensial")
hist(rexp(100,lamda), main = "Distribution Exponensial")
hist(rexp(1000, lamda), main = "Distribution Exponensial")
hist(rexp(10000,lamda), main = "Distribution Exponensial")


# 5C
n = 100
set.seed(1)
mean = mean(rexp(n, rate = lamda))
mean

set.seed(1)
varian = (sd(rexp(n, rate = lamda))) ^ 2
varian

## Soal 6

# 6A
n <- 100
m <- 50
std.deviasi <- 8
set.seed(100)
random <- rnorm(100)
rata <- mean(random)
x1 <- floor(rata)
x2 <- ceiling(rata)

z1 <- (x1 - m) / std.deviasi
z2 <- (x2 - m) / std.deviasi

prob = rnorm(n = 100, mean = m, sd = std.deviasi)
prob

# 6B
hist(rnorm(n = 100, mean = m, sd = std.deviasi), xlab="x", ylab="y" ,breaks = 50,
     main = "5025211102_Adhira Riyanti Amanda_Probstat_A_DNhistogram")

# 6c
varians = std.deviasi ** 2
varians

