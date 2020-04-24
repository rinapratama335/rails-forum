# Level Admin Bisa Edit Thread

Jika fitur sebelumnya edit thread hanya bisa dilakukan oleh member yang membuat thread, maka kali ini akan kita tambahkan dengan admin. Jadi yang bisa mengedit thread adalah user yang membuat thread dan juga admin.

Kita sudah memili enum untuk menentuka admin dan member di materi sebekumnya, sekarang kita bisa implementasikan pada kasus forum thread ini.

Yang perlu kita lakukan adalah kita mennambahkan pengecekan apakah user adalah admin atau bukan. Pengecekan ini kita lakukan di `forum_thread_policy`, jadi mari kita tambahkan kodenya :

```
def edit?
    user.id == record.user.id || user.admin?
end

def update?
    user.id == record.user.id || user.admin?
end
```

Dengan menambahkan `user.admin?` maka rails akan melakukan cek apakah user adalah admin atau bukan. `admin?` sidah kita jelaskan pada pembahasa sebelumnya kalai ini didapatka secara otomatis saat kita membuat enum.
