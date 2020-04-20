# Thread List Dari Database

1. Buat controller untuk menangani threads, `forum_threads_controller`. Di dalam controller tersebut buat method index untuk mengambil semua data

2. Di view index kita lakukan perulangan seperi ini

```
<% @threads.each do |t|%>
<div class="thread">
    <h3 class="title"><%= t.title.titleize %></h3>

    <div class="meta"><%= t.created_at.strftime("%d %B %Y") %> Oleh <%= t.user.name %></div>

    <div class="content">
        <%= t.content %>
    </div>

    <div class="count">
        <%= t.forum_posts.count %> Obrolan
    </div>
    <div style="clear: both"></div>
</div>
<% end %>
```

3. Untuk route `root`nya kita ganti ke forum_thread

```
root "forum_threads#index"
```
