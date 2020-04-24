# Pagination Post

Kali ini giliran forum post yang akan kita implementasikan pagination ini, karena tidak mungkin kita akan menampilkan post ini semuanya dalam satu halaman.

Namun query untuk memanggil forum post ini ada di mana?? Di controller forum post tidak ada karena yang ada hanya method create saja.

Lalu kepikiran kalau forum post ini dipanggil di halama show data, jadi kemungkinan ada di controller forum thread pada method show. Namun ternyata querynya hanya menampilkan data tunggal saja yaitu data thread sesuai id yang dipilih (`@thread = ForumThread.friendly.find(params[:id])`). Padahal post ini pasti collection karena bisa lebih dari satu post.

Lalu kita masuk ke file view show forum thred baru kita menemukan jika query dari pengambilan data forum post dilakukan di view ini :

```
<% if @thread.forum_posts.any? %>
    <%@thread.forum_posts.each do |p| %> #ini lho yang dicari
        .
        .
        .
    <% end %>
<% else %>
```

Untuk bisa kita kasih pagination maka kita akan memindahkan pemenggilan forum post ini di controller forum post pada method show. Jadi bisa kita tambahkan kode berikut di method show :

```
def show
    .
    .
    .
    @posts = @thread.forum_posts.paginate(per_page: 4, page: params[:page])
end
```

Kemudian di file show baru bisa kita lakukan perulangan dengan each pada forum post yang kita buat dan kita belika will_paginate di situ :

```
<% if @posts.any? %>
    <%@thread.forum_posts.each do |p| %> #ini lho yang dicari
        .
        .
        .
    <% end %>
<% else %>
<%= will_paginate @posts, renderer: BulmaPagination::Rails %>
```
