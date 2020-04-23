# Redirect When No Access

Walaupun kita sudah berhasil membuat authorization untuk edit ini, tetapi bisa ada yang mengakses melalui url maka rails akan mengeluarkan exception. Tentunya tidak enak dibaca oleh user yang mengaksesnya karena ada pesan error di web.

Daripada exception itu muncul dan terkesan kurang profesion maka kita bisa melakukan redirect dengan mengalihkan halaman error tersebut ke halaman lain sembari kita bisa menambahkan pesan.

Kita bisa melakukan penangan exception ini di tingkat controller di application_controller.

```
rescue_from Pundit::NotAuthorizedError, with: :pundit_error

private
def pundit_error
    flash[:notice] = "Anda tidak memiliki hak akses ini"
    redirect_to root_path
end
```

Jadi yang kita lakukan adalah jika ada exception `Pundit::NotAuthorizedError` kita akan menganganinya (rescue) dengan memanggil method `pundit_error`.
Method `pundit_error` bersifat private. Method ini akan mengalihkan ke `root_path` dengan memberika satu pesan (`flash[:notice]`)
