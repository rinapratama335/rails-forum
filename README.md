# Localiation

Secara default bahasa yang digunakan di Rails adalah bahasa inggris. Bagaimna jika kita ingin menggunkana bahasa indonesia??

1. Masuk ke file `config/applicatin.rb`, kita tambahkan kode berikut ini di dalam module Forum class Application

```
config.i18n.default_locale = :id
```

2. Lalu kita buat file di dalam folder `locales` dengan nama `id.yml`, untuk isinya dapat diliat di dalam filenya

3. Kita setting tampilan tanggal di file view forum_threads/index.html.erb menjadi seperti ini :

```
<%= I18n.l(t.created_at.to_date) %>
```
