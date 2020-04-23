# Membuat Fitur Sticky Thread

Fitur sticky thread ini memungkinkan postingan thread akan selalu berada di paling atas meskipun ada thread baru yang masuk.

Kita akan manfaatkan kolom `sticky_order` saat kita membuat tabel thread. Jadi semakin kecil nilai sticky_order ini maka akan semakin diprioritaskan untuk berada di atas.

Yang kita lakukan adalah kita akan mengisi nilai default sticky_order dengan 100. Jadi begitu ada thread baru yang masuk akan memiliki nilai sticky 100.

Kita buat migration untuk memberikan nilai default sticky_order :

```
rails g migration add_default_sticky_order_to_forum_threads
```

Beri nilai 100 di file migrationnya:

```
def change
    change_column_default :forum_threads, :sticky_order, 100
end
```

Jangan lupa di migrate

Jika sudah maka hal selanjutnya di forum thread controller akann kita urutkan berdasarkan sticky_order terlebih dahulu, jadi kita bisa edit kodenya :

```
def index
    @threads = ForumThread.order(sticky_order: :asc).order(id: :desc)
end
```

Kemudian di halaman index kita buatkan icon untuk yang posisi sticky, nah untuk menampilkan icon ini tentunya ada perkondisian yaitu nilai dari sticky_order di dalam tabel tidak sama dengan 100 baru icon ini ditampilkan.

```
<h4 class="title is-4"><%= link_to t.title.titleize, forum_thread_path(t) %>
    <% if t.sticky_order != 100 %>
        <i class="fas fa-thumbtack"></i>
    <% end %>
</h4>
```

Atu kita bisa juga buat sebuah method di mode forum thread kemudian kita panggil di view index thread untuk menampikan icon nya.

```
def sticky?
    sticky_order != 100
end
```

```
<h4 class="title is-4"><%= link_to t.title.titleize, forum_thread_path(t) %>
    <% if t.sticky? %>
        <i class="fas fa-thumbtack"></i>
    <% end %>
</h4>
```
