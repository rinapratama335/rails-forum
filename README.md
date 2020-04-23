# Memenggal Kalimat Dengan Fungsi Truncate

Tampilan kita akan menampilkan seluruh kontent yang dibuat secara utuh. Bayangkan kalau isi kontentnya terdiri dari beberapa paragraf, tentunya akan sangat merepotkan sekali.

Untuk itu kita bisa menggunakan fungsi bawaan dari rails yaitu `truncate`. Jadi fungsi `truncate` ini adalah untuk memotong kalimat yang sangat panjang menjadi penggalan kalimat sesuai jumlah karakter yang ditentukan.

Kita hanya perlu menambahkan fungsi `truncate` ini dan menentukan jumlah karakternya.
Ubah kode menampilkan isi kontennya menjadi seperti ini :

```
<%= truncate t.content, length: 150 %>
```
