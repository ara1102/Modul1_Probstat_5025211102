# Modul1_Probstat_5025211102

## Adhira Riyanti Amanda - 5025211102 - Probstat A

## Soal No 1
>Seorang penyurvei secara acak memilih orang-orang di jalan sampai dia bertemu dengan seseorang yang menghadiri acara vaksinasi sebelumnya.

### 1A
>Berapa peluang penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi  sebelum keberhasilan pertama ketika p = 0,20 dari populasi menghadiri acara vaksinasi ? (distribusi Geometrik)
 
 ```R
# 1A
x = 3
p = 0.20
prob <- dgeom(x,p)
prob
 ```
 <img width="941" alt="image" src="https://user-images.githubusercontent.com/103795644/195331623-995432c2-79cc-4bbe-9d14-8b4bc20394af.png">

Soal ini dijawab menggunakan fungsi dgeom() yang akan me-return-kan value pdf dari distribusi geometrik. Fungsi ini dapat menghitung probabilitas suatu kejadian yang mengalami sejumlah kegagalan sebelum mengalami kesuksesan pertama. Variabel x adalah banyak orang yang tidak menghadiri acara vaksinasi sebelum keberhasilan pertama.
Variabel p adalah peluang populasi menghadiri acara vaksinasi. Hasil probabilitas yang didapatkan dari fungsi dgeom() adalah 0.1024

### 1B
>Mean Distribusi Geometrik dengan 10000 data random , prob = 0,20 dimana distribusi geometrik acak tersebut X = 3 ( distribusi geometrik acak () == 3 )

 ```R
# 1B
n = 10000
p = 0.20
prob <- mean(rgeom(n, p) == 3)
prob
 ```
<img width="944" alt="image" src="https://user-images.githubusercontent.com/103795644/195331729-f40303ad-f8e6-421e-bf2e-2f138b183b6c.png">

Soal ini dijawab dengan menggunakan fungsi rgeom(). Fungsi ini menghasilkan nilai variabel random dari distribusi geometrik. Nilai mean yang dihasilkan fungsi tersebut didapatkan selalu berubah-ubah karena nilai yang dihasilkan fungsi rgeom() juga selalu berubah-ubah. Salah satu hasilnya adalah sebesar 0.1022

### 1C
>Bandingkan Hasil poin a dan b , apa kesimpulan yang bisa didapatkan?

Hasil yang didapatkan pada poin a dan poin b berbeda. Hasil pada poin A didapatkan dari distribusi geometrik biasa dan nilai tersebut tetap sebesar 0.1024 di setiap percobaan. Hasil tersebut tetap karena nilai distribusi geometrik yang digunakan adalah tetap dan tidak diacak. Sedangkan, hasil pada poin B didapatkan dari mean nilai random yang dihasilkan dari fungsi rgeom(). Hal tersebut menyebabkan hasil poin b yang selalu berubah di setiap percobaan. Kesimpulan yang didapatkan adalah hasil menggunakan cara pada poin B lebih baik dibandingkan poin A untuk digunakan dalam kebutuhan sampling.

### 1D
>Histogram Distribusi Geometrik , Peluang X = 3 gagal Sebelum Sukses Pertama

 ```R
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
 ```
 
 ![image](https://user-images.githubusercontent.com/103795644/195332953-fa5800db-f109-45e7-86c3-082cfdecdbfc.png)
