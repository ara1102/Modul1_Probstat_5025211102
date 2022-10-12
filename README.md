# Modul1_Probstat_5025211102

## Adhira Riyanti Amanda - 5025211102 - Probstat A

## Soal No 1
>Seorang penyurvei secara acak memilih orang-orang di jalan sampai dia bertemu dengan seseorang yang menghadiri acara vaksinasi sebelumnya.

<img width="944" alt="image" src="https://user-images.githubusercontent.com/103795644/195336811-67923a36-9218-41a0-be2c-18dbbb204918.png">

### 1A
>Berapa peluang penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi  sebelum keberhasilan pertama ketika p = 0,20 dari populasi menghadiri acara vaksinasi ? (distribusi Geometrik)
 
 ```R
# 1A
x = 3
p = 0.20
probA <- dgeom(x,p)
probA
 ```

Soal ini dijawab menggunakan fungsi dgeom() yang akan me-return-kan value pdf dari distribusi geometrik. Fungsi ini dapat menghitung probabilitas suatu kejadian yang mengalami sejumlah kegagalan sebelum mengalami kesuksesan pertama. Variabel x adalah banyak orang yang tidak menghadiri acara vaksinasi sebelum keberhasilan pertama.
Variabel p adalah peluang populasi menghadiri acara vaksinasi. Hasil probabilitas yang didapatkan dari fungsi dgeom() adalah 0.1024

### 1B
>Mean Distribusi Geometrik dengan 10000 data random , prob = 0,20 dimana distribusi geometrik acak tersebut X = 3 ( distribusi geometrik acak () == 3 )

 ```R
# 1B
n = 10000
p = 0.20
probB <- mean(rgeom(n, p) == 3)
probB
 ```

Soal ini dijawab dengan menggunakan fungsi rgeom(). Fungsi ini menghasilkan nilai variabel random dari distribusi geometrik. Nilai mean yang dihasilkan fungsi tersebut didapatkan selalu berubah-ubah karena nilai yang dihasilkan fungsi rgeom() juga selalu berubah-ubah. Salah satu hasilnya adalah sebesar 0.1036

### 1C
>Bandingkan Hasil poin a dan b , apa kesimpulan yang bisa didapatkan?

Hasil yang didapatkan pada poin a dan poin b berbeda. Hasil pada poin A didapatkan dari distribusi geometrik biasa dan nilai tersebut tetap sebesar 0.1024 di setiap percobaan. Hasil tersebut tetap karena nilai distribusi geometrik yang digunakan adalah tetap dan tidak diacak. Sedangkan, hasil pada poin B didapatkan dari mean nilai random yang dihasilkan dari fungsi rgeom(). Hal tersebut menyebabkan hasil poin b yang selalu berubah di setiap percobaan. Kesimpulan yang didapatkan adalah hasil menggunakan cara pada poin B lebih baik dibandingkan poin A untuk digunakan dalam kebutuhan sampling.

### 1D
>Histogram Distribusi Geometrik , Peluang X = 3 gagal Sebelum Sukses Pertama

 ```R
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

 ```
 
 ![image](https://user-images.githubusercontent.com/103795644/195332953-fa5800db-f109-45e7-86c3-082cfdecdbfc.png)
 
 ### 1E
 > Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Geometrik
 
  ```R
# 1E
rataan = 1/p
rataan
varian = (1-p)/(p^2)
varian
 ```

Nilai rataan dan varian dapat dicari menggunakan rumus rataan dan varian diatas
 
## Soal No 2
>Terdapat 20 pasien menderita Covid19 dengan peluang sembuh sebesar 0.2. Tentukan :

<img width="944" alt="image" src="https://user-images.githubusercontent.com/103795644/195349663-20711f10-e3f7-44c1-9bd0-8fd9860f5ba4.png">

### 2A
>Peluang terdapat 4 pasien yang sembuh
 ```R
# 2A
p = 0.2
nS = 20
sembuh = 4
peluang = dbinom(sembuh, nS, p)
peluang
 ```
Soal ini dijawab menggunakan distribusi Binomial dengan memanfaatkan fungsi dbinom(). Fungsi tersebut berisi variabel sembuh(banyak pasien sembuh), nS (banyak pasien) dan p (peluang sembuh pasien) sebagai parameternya. Fungsi ini akan me-return-kan value pdf dari distribusi binomial. Hasil peluang yang didapatkan adalah sebesar 0.2181994.

### 2B
>Gambarkan grafik histogram berdasarkan kasus tersebut
 ```R
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
 ```
 ![image](https://user-images.githubusercontent.com/103795644/195349093-2ef6e1b4-b798-4948-b802-c1893fbe2ec7.png)
 
### 2C
>Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Binomial.
 ```R
 # 2C
rataan = nS * p
rataan
varian = nS * p * (1-p)
varian
 ```
Nilai rataan dan varian dapat dicari menggunakan rumus rataan dan varian diatas

## Soal No 3
>Diketahui data dari  sebuah tempat bersalin di rumah sakit tertentu menunjukkan rata-rata historis 4,5 bayi lahir di rumah sakit ini setiap hari. (gunakan Distribusi Poisson)

<img width="941" alt="image" src="https://user-images.githubusercontent.com/103795644/195361579-5af7a82d-5f94-4f5a-aa24-e98114b94424.png">

### 3A
>Berapa peluang bahwa 6 bayi akan lahir di rumah sakit ini besok?
 ```R
 # 3A
lamda = 4.5
nA = 6
prob <- dpois(nA, lamda)
prob
 ```
Soal ini dijawab menggunakan distribusi poisson dengan memanfaatkan fungsi dpois(). Fungsi tersebut berisi variabel nA (banyak bayi lahir di rumah sakit besok) dan lamda (rata-rata historis bayi lahir di rumah sakit setiap hari) sebagai parameternya. Fungsi ini akan me-return-kan value pdf dari distribusi poisson. Hasil peluang yang didapatkan adalah sebesar 0.1281201

### 3B
>Simulasikan dan buatlah histogram kelahiran 6 bayi akan lahir di rumah sakit ini  selama setahun (n = 365)
 ```R
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
   ```
![image](https://user-images.githubusercontent.com/103795644/195361713-53e9e601-73e8-4477-a8d9-47d06d743e95.png)

### 3C
>Bandingkan hasil poin a dan b , Apa kesimpulan yang bisa didapatkan?
Hasil pada poin A dan B hampir sama. Hal ini dapat terjadi karena nilai A berada di dalam range B. Kesimpulannya adalah dalam estimasi selama 1 tahun(365 hari) akan memberikan hasil yang hampir sama dengan estimasi jumlah bayi yang akan dilahirkan di esok hari.

### 3D
>Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Poisson.
 ```R
 # 3D
rataan = lamda
rataan
varians = lamda
varians
 ```
Nilai rataan dan varian dapat dicari menggunakan rumus rataan dan varian diatas

## Soal No 4
> Diketahui nilai x = 2 dan v = 10. Tentukan:

<img width="942" alt="image" src="https://user-images.githubusercontent.com/103795644/195372459-b30a7a93-82b1-44a0-814d-985d6b30ee37.png">

### 4A
> Fungsi Probabilitas dari Distribusi Chi-Square.
 ```R
 # 4A
xChi = 2
v = 10
prob <- dchisq(xChi, v, ncp = 0, log = FALSE)
prob
 ```
Soal ini dijawab menggunakan distribusi chi-square dengan memanfaatkan fungsi dchisq(). Fungsi tersebut berisi variabel xChi, v, ncp, dan log sebagai parameternya. Fungsi ini akan me-return-kan value pdf dari distribusi chi-square. Hasil peluang yang didapatkan adalah sebesar 0.007664155

### 4B
>Histogram dari Distribusi Chi-Square dengan 100 data random.
 ```R
 # 4B
x <- rchisq(100, v)
hist(x, freq = FALSE, xlim = c(0,31), ylim = c(0,0.2), main="Distribusi Chi-Square")

curve(dchisq(x, v), from = 0, to = 30, n = 100, col = "green", lwd = 2, add = TRUE)
 ```
![image](https://user-images.githubusercontent.com/103795644/195372546-b07c4a2a-c12e-4f07-9eef-4a50e5752814.png)

### 4C
>Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Chi-Square.
 ```R
 # 4C
rataan = v
rataan
varian = 2*v
varian
 ```
Nilai rataan dan varian dapat dicari menggunakan rumus rataan dan varian diatas
 
## Soal No 5
>Diketahui bilangan acak (random variable) berdistribusi exponential (λ = 3). Tentukan

<img width="944" alt="image" src="https://user-images.githubusercontent.com/103795644/195375331-8b5c774b-28d5-4bf2-8034-f701ebe8fc98.png">

### 5A
>Fungsi Probabilitas dari Distribusi Exponensial 
 ```R
 # 5A
lamda = 3
prob <- dexp(lamda, rate = 1, log = FALSE)
prob
 ```
Soal ini dijawab menggunakan distribusi exponensial dengan memanfaatkan fungsi dexp(). Fungsi tersebut berisi variabel lamda, rate, dan log sebagai parameternya. Fungsi ini akan me-return-kan value pdf dari distribusi exponensial. Hasil peluang yang didapatkan adalah sebesar 0.04978707

### 5B
>Histogram dari Distribusi Exponensial untuk 10, 100, 1000 dan 10000 bilangan random
 ```R
# 5B
par(mfrow = c(2,2))
set.seed(1)
hist(rexp(10, lamda), main = "Distribution Exponensial")
hist(rexp(100,lamda), main = "Distribution Exponensial")
hist(rexp(1000, lamda), main = "Distribution Exponensial")
hist(rexp(10000,lamda), main = "Distribution Exponensial")
 ```
![image](https://user-images.githubusercontent.com/103795644/195374752-8560d848-9adb-42cb-a2ca-21e502a7c5d4.png)

### 5C
>Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Exponensial untuk n = 100 dan λ = 3
 ```R
 # 5C
n = 100
set.seed(1)
mean = mean(rexp(n, rate = lamda))
mean

set.seed(1)
varian = (sd(rexp(n, rate = lamda))) ^ 2
varian
 ```
Nilai rataan dan varian dapat dicari menggunakan rumus rataan dan varian diatas
