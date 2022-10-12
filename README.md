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

