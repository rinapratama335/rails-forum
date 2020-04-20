# Menhitung Counter Post Dengan Counter Cache

Sejauh ini kita sudah berhasil menampilkan berapa jumlah forum post yang menanggapi suatu thread dengan menggunkan method `count`, bisa kita lihat di file index `<%= t.forum_posts_count %>`.

Namun sebenarnya cara seperti ini kurang efektif, karena yang terjadi kita memanggil query lagi untuk menghitung jumlah post, padahal sebelumnya kita juga sudah memanggil query di method show pada controller form_post. Jadi pertama kita panggil query untuk menampillkan forum_post kemudian untuk menghitung jumlah form_post di index kita memanggil query lagi yaitu `count`.

Untuk mengatasi hal ini kita bisa memberikan sebuah kolom di tabel forum_threads yang bisa kita gunakan untuk menyimpan ada berapa jumlah post dari suatu thread. Rails memiliki suatu fitur yang namanya `counter cache`. Dengan fitu ini begitu ada perubahan pada post, baik itu penambahan maupun pengurangan maka counternya akan otomatis dirubah dan itu tanpa memerlukan query ke database lagi.

Implementasinya adalah sebagai berikut :

1. Masuk ke model `ForumPost` karena kita akan menghitung forum post. Forum post akan dihitung di sebuah thread, berarti di `belongs_to :forum_thread` kita tambahkan opsi `counter_cache: true`.

```
belongs_to :forum_thread, counter_cache: true
```

2. Di tabel forum_threads kita membuatuhkan kolom baru bernama `forum_posts_count` (dan aturannya adalah seperti ini). Nama forum_posts_count adalah karena yang akan kita hitung adalah count untuk forum post. Untuk itu kita buat migrasinya :

```
rails g migration add_forum_posts_counter_to_forum_threads forum_posts_count:integer
```

3. Kita masuk ke file migrationnya, kemudian kita ubuh kodenya :

```
def up
    add_column :forum_threads, :forum_posts_count, :integer, default: 0

    ForumThread.all.each do |t|
        ForumThread.reset_counters(t.id, :forum_posts)
    end
end

def down
    remove_column :forum_threads, :forum_posts_count
end
```

Kemudian jalankan migrasinya.

Kita bahas sedikit, di sini kita menambahkan nilai default yaitu 0. Kenapa begitu? Karena jika tidak maka defaultnya akan `nil` dan jika ditambahkan akan menjadikan error karena nil tidak bisa dilakukan operasi aritmatika (contoh nil + 1 = error). Unutk perulangan
Sedangkan untuk `ForumThread.all.each........` ini adalah untuk mengupdate nilai `:forum_posts_count` dari sebuah thread yang ada

Bisa kita coba di console

```
ForumThread.first

p = ForumPost.new
p.content = "ngetes counter cache"
p.user = User.first

p.save
ForumPost Create (2.3ms)  INSERT INTO `forum_posts` (`content`, `forum_thread_id`, `user_id`, `created_at`, `updated_at`) VALUES ('ngetes counter cache', 1, 1, '2020-04-20 16:52:06.677119', '2020-04-20 16:52:06.677119')

ForumThread Update All (0.4ms)  UPDATE `forum_threads` SET `forum_threads`.`forum_posts_count` = COALESCE(`forum_threads`.`forum_posts_count`, 0) + 1 WHERE `forum_threads`.`id` = 1

p.destroy
ForumPost Destroy (2.0ms)  DELETE FROM `forum_posts` WHERE `forum_posts`.`id` = 3

ForumThread Update All (0.4ms)  UPDATE `forum_threads` SET `forum_threads`.`forum_posts_count` = COALESCE(`forum_threads`.`forum_posts_count`, 0) - 1 WHERE `forum_threads`.`id` = 1
```

4. Tinggal kita tampilkan di index deh forum_post_count

```
<div class="count">
    <%= t.forum_posts_count %> Obrolan
</div>
```
