# Membuat Validasi Post

1. Tambahkan validates di model forum post

```
validates :content, presence: true
```

2. Di post controller kita handle jika ada error

```
def create
    @thread = ForumThread.find(params[:forum_thread_id])
    @post = ForumPost.new(resource_params)

    @post.forum_thread = @thread
    @post.user = User.first

    if @post.save
        redirect_to forum_thread_path(@thread)
    else
        render 'forum_threads/show'
    end
end
```

3. Kita tampilkan di atas form post jika ada error dengan menambahkan kode berikut

```
<% if @post.errors.any? %>
    <div>
        <% @post.errors.full_messages.each do |error| %>
        <div class="notification is-danger">
            <button class="delete"></button>
            <%= error %>
        </div>
        <% end %>
    </div>
<% end %>
```
