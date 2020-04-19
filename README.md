# Instalasi Bootstrap

Kita tambahkan `bootstrap-sass` di file gem kita

```
gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
```

Kemudian install dengan menjalankan perintah `bundle`

Selanjutnya kita ubah nama `application.css` yang ada di forlder assets/stylesheets menjadi `application.scss`, kemuadian di dalamnya kita tambahkan kode untuk load bootstrap-nya :

```
@import "bootstrap-sprockets";
@import "bootstrap";
```

sebagai percobaan kita akan menampilkan kode navbar yang diletakkan di view layout `application.html.erb` :

```
.
.
kode navbar Bootstrap
.
.
```

Jalankan server `localhost:3000`, dan whoalaaaaa......halaman default yang tampil :)
Mari kita atasi dengan langkah awal membuta controller (kasih saja namanya `home`). Di dalam controller home ini kita bikin method index :

```
class HomeController < ApplicationController
  def index
  end
end
```

Buat view home dan di dalamnya buat file `index.html.erb`, isi aja sederhana :

```
<div>
  Halooo
</div>
```

Kemudian kita buat routingnya :

```
root "home#index"
```

routing di atas artinya adalah saat kit akses `localhost:300` maka akan diarahkan ke controller home method index.

Dan silahkan liat hasilnya.
