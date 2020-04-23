# Membuat Friendly ID

Jika kita akses suatu tread, maka yang akan ditampilkan adalah `thread/id`. Namun kali ini adalah kita akan membuat url yang id-nya lebih menarik dengan menggunkana friendly ID. Jadi daripada kita seperti ini `http://localhost:3000/forum_threads/2` akan kita buat menjadi `http://localhost:3000/forum_threads/judul-thread-yang-dibuat`.

Di rails terdapat gem yang bisa menghandle kasus di atas, namanya adalah `friendly_id`. Kita install gemnya dengan menambahkan kode berikut di `Gemfile`.

```
gem 'friendly_id', '~> 5.3'
```

kemudian jalankan instalasinya dengan mengetikkan perintah `bundle`

Selanjutnya kita menuju model forum_thread, tambahkan kode berikut :

```
extend FriendlyId
friendly_id :title, use: :slugged
```

Kita extend FriandlyId-nya dan kita implementasikan dengan membuat friendly id berdasarkan title-nya

Yang tidak kalah penting adalah ketika kita memakai friendly id maka kita butuh kolom yang namanya `slug` di tabel kita, untuk itu kita buat migrationnya :

```
 rails g migration add_slug_to_forum_threads slug:string
      invoke  active_record
      create    db/migrate/20200423202325_add_slug_to_forum_threads.rb
```

Lalu jalankan migrasinya.

Terakhir kita implementasikan friendly id ini di forum thread tepatnya di controller forum thread. Kita ubah kodenya dari yang semula `@thread = ForumThread.find(params[:id])` menjadi `@thread = ForumThread.friendly.find(params[:id])`. Dan itu dilakukan di semua method yang memerlukan method `find` (show, edit, update, pinit)
