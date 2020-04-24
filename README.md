# Admin Enum (Membuat Level Admin Dan Member)

Di tabel/class user kita sudah memiliki field level yang mana nilai dfaultnya adalah nil. Untuk itu mari kita ubah dengan memberikan nilai default 0 saat ada user yang mendaftar

```
rails g migration add_default_level_to_users
      invoke  active_record
      create    db/migrate/20200424045324_add_default_level_to_users.rb
```

kemudian masuk ke file migrationnya, lalu tambahkan default :

```
def change
    change_column_default :users, :level, 0
    end
```

kemudian jalankan migrationnya.

Langkah selanjutnya adalah membuat enumerasi. Kita akan menggunakan method bawaan yang bernama `enum`. Caranya adalah kita buat enum ini di model user (file model `user.rb`) dengan menambahkan kode seperti ini :

```
enum level: {member: 0, admin: 1}
```

Kode di atas bisa dibaca kita melakukan `enum` di kolom `level` yang nilainya adalah `member` jika 0 dan `admin` jika 1.

Bisa kita test melalui console :

```
user = User.last
User Load (0.7ms)  SELECT `users`.* FROM `users` ORDER BY `users`.`id` DESC LIMIT 1
=> #<User id: 4, email: "agusmuryadi@yahoo.com", name: "Agus Muryadi", level: nil, created_at: "2020-04-23 18:28:33", updated_at: "2020-04-23 18:28:33">

user.level = 0
=> 0

user.save
(0.2ms)  BEGIN
User Update (2.3ms)  UPDATE `users` SET `users`.`level` = 0, `users`.`updated_at` = '2020-04-24 05:01:54.401334' WHERE `users`.`id` = 4
(2.4ms)  COMMIT
=> true

user
=> #<User id: 4, email: "agusmuryadi@yahoo.com", name: "Agus Muryadi", level: "member", created_at: "2020-04-23 18:28:33", updated_at: "2020-04-24 05:01:54">

user.level
=> "member"

user.admin?
=> false

user.member?
=> true
```

method `admin?` dan `member?` didapatkan otomatis saat kita mendefinisikan enum admin dan member di model user.
