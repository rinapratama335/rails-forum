# Membuat Forum Thread Dan Forum Post

Kita buat model untuk forum thread, saat kita membuat model ini maka otomatis juga akan dibuatkan migrationnya

````
rails g model ForumThread title content:text sticky_order:integer user_id:integer
      invoke  active_record
      create    db/migrate/20200419175456_create_forum_threads.rb
      create    app/models/forum_thread.rb
      invoke    test_unit
      create      test/models/forum_thread_test.rb
      create      test/fixtures/forum_threads.yml
      ```
````

Jalankan migrate untuk membuat tabel forum thread

```
rake db:migrate
```

Kita buat lagi model untuk forum post,

```
rails g model ForumPost content:text forum_thread_id:integer user_id:integer
      invoke  active_record
      create    db/migrate/20200419175937_create_forum_posts.rb
      create    app/models/forum_post.rb
      invoke    test_unit
      create      test/models/forum_post_test.rb
      create      test/fixtures/forum_posts.yml
```

Jalankan lagi migrate-nya

```
rake db:migrate
```
