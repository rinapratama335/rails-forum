# Validasi Form Thread

1. Tambahkan kode validasi di model forum thread

```
validates :title, presence: true, length: {maximum: 50}
validates :content, presence: true
```

2. Lalu di controller forum thread pada method create kita cek ada error atau tidak, jika tidak maka lanjutkan menyimpan data jika ada tampilkan errornya

```
def create
    @thread = ForumThread.new(resource_params)
    @thread.user = User.first
    if @thread.save
        redirect_to root_path
    else
        render 'new'
    end
end
```

3. Tentunya untuk menampilkan error message harus melalui view, maka kita buat kode untuk menampilkan erorr di view

```
<% if @thread.errors.any? %>
    <div>
        <% @thread.errors.full_messages.each do |error| %>
            <div class="notification is-danger">
                <button class="delete"></button>
                <%= error %>
            </div>
        <% end %>
    </div>
<% end %>
```
