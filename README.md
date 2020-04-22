# Akses Hanya Untuk User Yang Sudah Login

1. Masih bisa aksea tombol `Buat Thread` meski belum login (forum_threads/index.html.erb)

```
<% if user_signed_in? %>
    <%= link_to 'Buat Thread', new_forum_thread_path, class: 'button is-primary' %>
<% end %>
```

2. Meski sudah diberi perkondisaian tapi masih bisa akses melalui url (`loaclhot:3000/forum_threads/new`)
   Tambahkan kode ini di forum thread controller

```
before_action :authenticate_user!, only: [:new, :create]
```

3. Kemudian masih ada form komentar meskipun tidak ada yang login
   Di view forum_thread/show.html.erb kita beri perkondisian

```
<% if user_signed_in? %>
    <%= form_for [@thread, @post] do |f| %>
        <div class="field">
            <%= f.label :content, class: "label" %>
            <div class="control">
                <%= f.text_area :content, class: "textarea", placeholder: "Entry content" %>
            </div>
        </div>

        <div class="field is-grouped">
            <div class="control">
                <%= f.button :simpan, class: "button is-link" %>
            </div>
        </div>
    <% end %>
<% end %>
```

4. Di forum post controller juga bisa kita beri `before_action`

```
before_action :authenticate_user!, only: [:create]
```
