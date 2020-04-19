# KOnfigurasi Devise

1. Install gem devise, bisa diletakkan di gemfile lalu lakukan install dengan mengetikkan `bundle install`

2. Devise sudah terpasang, tinggal kita instal dengan mengetikkan perintah `rails g devise:install`

3. Kemudian kita buat model user dengan devise dengan perintah `rails g devise User`

4. Di migration devise_create_user kita tambahkan field yang belum ada yaitu name dan level

```
t.string :name
t.integer :level
```
