# Delete Thread Dependent

Tentunya di dalam forum thread ini harus ada fungsi untuk menghapus forum thread ini. Dan pada kasus ini yang bisa melakukan itu adalah admin.

Namun yang harus kita pikirkan adalah pada saat kita menghapus fourm thread maka forum post juga harus ikut terhapus karena jika tidak akan terjadi kepincangan (ada data post namun threadnya tidak ada).

Untuk itu kita bisa memanfaatkan satu method yaitu `dependent destroy`. Jadi dengan menggunakan method ini pada saat kita menghapus data induk maka data anak akan ikut terhapus juga.

Bagaimana melakukannya???

Untuk melannya kita bisa menambahkan method `dependent` ini di model forum thread seperti ini :

```
has_many :forum_posts, dependent: :destroy
```

Method dependent ini kita letakkan di relasi post. Jadi ketika thread dihapus maka relasi yang berhubungan dengan thread tersebut akan terhapus juga( dalam kasus ini adalah post).

Bisa kita test di console :

```
t = ForumThread.find 1
ForumThread Load (0.5ms)  SELECT `forum_threads`.* FROM `forum_threads` WHERE `forum_threads`.`id` = 1 LIMIT 1
=> #<ForumThread id: 1, title: "Thread Pertama", content: "Content untuk thread pertama yang baru dibuat", sticky_order: 1, user_id: 1, created_at: "2020-04-19 18:15:07", updated_at: "2020-04-19 18:15:07", forum_posts_count: 2, slug: nil>

t.destroy
(0.2ms)  BEGIN
ForumPost Load (0.4ms)  SELECT `forum_posts`.* FROM `forum_posts` WHERE `forum_posts`.`forum_thread_id` = 1
ForumPost Destroy (2.2ms)  DELETE FROM `forum_posts` WHERE `forum_posts`.`id` = 1
ForumPost Destroy (0.4ms)  DELETE FROM `forum_posts` WHERE `forum_posts`.`id` = 2
ForumThread Destroy (0.3ms)  DELETE FROM `forum_threads` WHERE `forum_threads`.`id` = 1
(4.3ms)  COMMIT
=> #<ForumThread id: 1, title: "Thread Pertama", content: "Content untuk thread pertama yang baru dibuat", sticky_order: 1, user_id: 1, created_at: "2020-04-19 18:15:07", updated_at: "2020-04-19 18:15:07", forum_posts_count: 2, slug: nil>
```

Dari console di atas dapat kita lihat pada saat kita menghapus thread(t.destriy) maka sebelum thread dihapus data post terlebih dahulu yang akan dihapus.
