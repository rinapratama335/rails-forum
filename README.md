# Membuat Form New Thread

1. Di index thread kita biki link untuk menambahkan thread baru

```
<%= link_to 'Buat Thread', new_forum_thread_path, class: 'button is-primary' %>
```

2. Kemudian di routes kita forum thread kita tambahakan untuk method new dan create

```
resources :forum_threads, only: [:show, :new, :create]
```

3. Lalu kita buat method new di controller forum thread

```
def new
    @thread = ForumThread.new
end
```

4. Terakhir kita buat view untuk tambah data thread

```
<%= form_for @thread do |f| %>
    .
    .
    .
    .
<% end %>
```
