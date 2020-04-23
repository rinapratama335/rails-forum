# Membuat Custom Field Devise

Tentunya kita masih ingat saat kita melakukan pendaftara ada satu field yang belum kita tambahkan yaitu `nama`, sehingga di saat kita melakukan pendaftaran kolom nama akan selalu nil/tidak ada namanya.

Pertama tambahkan field nama di `views/devise/registrations/new.html.erb`

```
<div class="field">
    <%= f.label :name, class: 'label' %>
    <div class="control">
        <%= f.text_field :name, class: "input", autofocus: true, autocomplete: "email" %>
    </div>
</div>
```

Permasalahan yang muncul adalah field nama ini adalah bukan standart dari devise karena kita membuatnya sendiri.
Cara yang dapat kita pakai adalah kita membuat `strong parameter`. Strong parameter adalah kita menentuka field mana saja yang boleh kita terima.
Contoh strong parameter adalah resources prameter yang kita buat untuk menghandle data di method create dan update

Nah permasalahan lagi yang terjadi adalah dimanakah kita bisa menemukan controller devise? Kan tidak ada controller devise nya??

Nah kita bisa membuat strong parameter untuk menghandle devise ini dengan beberapa cara. Salah satunya adalah kita membuat strong parameter di `application_controller`. Dan kode strong parameternya adalah :

```
class ApplicationController < ActionController::Base
    .
    .
    .

    before_action :configure_permited_parameters, if: :devise_controller?

    private
    .
    .
    .

    def configure_permited_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
```

`before_action :configure_permited_parameters, if: :devise_controller?` artinya kita buat callback di `before_action` dengan method bernama `configure_permited_parameters` yang mana akan dijalankan jika controller yang kita akses adalah controller yang dibuat oleh devise (`if: :devise_controller?`) bukan controller yang kita buat sendiri.

Isi dari method `configure_permited_parameters` adalah method bawaan devise yang bernama `devise_parameter_sanitizer`. Method devise ini akan melakukan permit pada saat `sign_up` dan value yang bisa disimpan adalah `name`. Sehingga kita bisa tulus kodenya seperti ini :

```
devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
```
