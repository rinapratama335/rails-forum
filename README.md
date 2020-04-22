# Membuat Notice Dan Alert

Di awal kita memakai devise memang sudah disarankan untuk membuat notice, untuk itu kita bisa buat niticenya di file view layout `application.html.erb` dengan menambahkan kode berikut :

```
<% flash.each do |key, value| %>
    <div class="notification is-<%= key %>">
        <button class="delete"></button>
        <%= value %>
    </div>
<% end %>
```

Kode di atas bisa kita letakkan di body sebelum `yield`
