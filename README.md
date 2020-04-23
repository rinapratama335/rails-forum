# Mempercantik Tampilan View Devise (Register, Login)

Bisa kita lihat kalau view dari register dan login sangat kurang menarik. Makanya kita akan melakukan custom view ini supaya terlihat lebih menarik.

Muncul pertanyaan, di manakan kita mengetahui view register ini??? jika kita lihat di view app kita maka tidak ada view yang mengurusi soal register dan login itu.

Secara Default devise akan menyembunyikan view tersebut kepada kita, namun kita bisa memunculkan view tersebut. Ketikkan perintah berikut :

```
rails g devise:views
```

Maka view devise akan ditampilkan, tinggal kita sesuaikan aja tampilan untuk user `registrasi` dan `user login` maupun `forgot password` dengan apa yang kita mau.
