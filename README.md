# Membuat Relasi Antar Tabel

1. Model user
   Kita beri relasi has_many untuk forum post dan forum thread

```
has_many :forum_threads
has_many :forum_posts
```

2. Model Forum Thred

```
belongs_to :user
```

3. Model Forum Post

```
belongs_to :user
belongs_to :forum_thread
```

Sebagai percobaan kita akan membuat user dan thread denga menggunakan rails console

```
u = User.new
u.name = "Irwanto Wibowo"
u.email = "irwanto@yahoo.com"
u.level = 1
u.password = "<password di sini>"
u.save

t = ForumThread.new
t.title = "Thread Pertama"
t.content = "Content dari thread pertama yang dibuat"
t.user = u
t.save

t.user.name
"Irwanto Wibowo"

t.forum_posts.count
(0.6ms)  SELECT COUNT(*) FROM `forum_posts` WHERE `forum_posts`.`forum_thread_id` = 1
0
```

```
t = ForumThread.first

p = ForumPost.new
p.content = "tanggapan untuk thread pertama"
p.user = User.first
p.forum_thread = t

p.save

t.forum_posts.count
(0.4ms)  SELECT COUNT(*) FROM `forum_posts` WHERE `forum_posts`.`forum_thread_id` = 1
1
```
