# View Authorization

Di sini kita akan membahas bagaimana kita akan menampilkan button edit jika user yang login adalah yang memiliki hak akses tersebut.

1. Pertama kita tambahkan authorization pada method update thread karena hanya user yang membuat thread yang bisa melakukan update :

```
def update
    @thread = ForumThread.find(params[:id])
    authorize @thread
    .
    .
    .
end
```

2. Kita buat method `update?` di forum_thread_policy

```
def update?
    user.id == record.user.id
end
```

3. Kita buat perkondisian di show.html.erb untuk menampilkan button edit

```
<% if policy(@thread).edit? %>
    <div class="action-edit">
        <%= link_to "Edit", edit_forum_thread_path(@thread), class: "button is-warning" %>
    </div>
<% end %>
```

kode ini bisa dibaca jika user yang login memiliki hak akses (policy) untuk mengedit(edit?) record @thread maka munculkan button edit, jika tidak maka hilangkan tombol editnya.
