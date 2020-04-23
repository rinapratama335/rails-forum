# Authorization Dengan Menggunakan Gem Pundit

Di materi sebelumnya kita sudah bisa membuat fitur untuk edit thread. Namun masih ada kejanggalan yang terjadi, yaitu user manapun bisa mengedit setiap thread bahkan thread yang diposting oleh user yang lain. Seharusnya user yang login hanya bisa melakukan edit thread yang hanya miliknya saja.

Untuk bisa membatasi hak akses seorang user maka kita memerlukan authorization, dan yang akan kita gunakan adalah sebuah gem yang bernama `pundit`.

Tambahkan gem pundit di gemfile lalu instal gem tersebut :

```
gem 'pundit', '~> 2.1'
```

Kemudian kita jalankan generator pundin-nya :

```
rails g pundit:install

    create  app/policies/application_policy.rb
```

Kita bisa menuju ke file `application_policy.rb` yang mana di dalamnya terdapat `attr_reader :user, :record`. `:user` adalah user yang sedang login dan `:record` adalah objek aktif record atau objek apapun yang mewakili apakah kita boleh mengaksesnya atai tidak. Misal di kita misalnya thread, berarti `:record` nya adalah thread. Bisa diartika apakah seorang user bisa mengakses thread atau tidak.

Di kasus ini kita akan membuat `policy` untuk model bernama `ForumThread` yang mana controller-nya adalah `ForumThreadsController`.

Jadi kita bisa buat file policy dengan nama `forum_thread_policy.rb` dengan isian awal seperti ini :

```
class ForumThreadPolicy < ApplicationPolicy

end
```

Kemudian kita akan melakukan pembatasan akses pada fitur edit (url edit) hanya benar benar user yang membuat thread.
kita buat method di file forum policy yang berfungsi menanyakan apakah bole melakukan edit?
kira kira sepeti itu fungsinya. Untuk kodenya :

```
class ForumThreadPolicy < ApplicationPolicy
    def edit?
        true
    end
end
```

return `true` ini artinya adalah boleh melakukan edit. Kalau `false` maka sebaliknya.

Yang harus kita lakukan selanjutnya adalah meng-include-kan `Pundit` di application_controller.rb :

```
class ApplicationController < ActionController::Base
    include Pundit
end
```

Kenapa di application controller? ya karena semua controller yang ada adalah turunan dari application_controller ini.

Langkah selanjutnya adalah implementasi di controller kita. Kita pakai di controller forum thread pada method edit :

```
def edit
    @thread = ForumThread.find(params[:id])

    authorize @thread
end
```

untuk mengimplementasikannya cukup kita panggil `authorize` kamudian nama resource-nya.
Dengan kode seperti itu secara ajaib Pundit akan tahu kalau `@thread` ini adalah objek dari kelas fourm thread, yang artinya dia akan mencari policy dengan nama `ForumThreadPolicy`. Paham kan ya?? Dan karena `authorize` ini dipanggil di method edit maka secara otomatis Pundit mencari juga di ForumThreadPolicy dengan nama method `edit?`

Jika kita cek dan kita mengakses edit thread dengan user yang bukan bersangkutan maka akan terjadi exeption yang menyatakan tidak diijinkan untuk melakukan edit.

Yang perlu kita cari tau adalah bagaimana kita tau bahwa user yang login adalah yang membuat thread yang bersangkutan ???
Kita edit method `edit?` di forum_thread_policy menjadi seperti ini :

```
class ForumThreadPolicy < ApplicationPolicy
    def edit?
        user.id == record.user.id
    end
end
```

Di sini kita memiliki akses terhadap object user. `user.id == record.user.id` bisa kita baca seperti ini :

apakah user yang sedang login (user.id) adalah user yang memiliki record thread (record.user.id)(karena ada di ForumThreadPolicy) yang bersangkutan. Jika iya maka `true` dan jika tidak maka `false`
