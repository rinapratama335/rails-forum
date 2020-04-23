# Edit Thread

1. Buat tombol edit di file show

```
<div class="action-edit">
    <%= link_to "Edit", edit_forum_thread_path(@thread), class: "button is-warning" %>
</div>
```

Untuk CSS disesuaikan sendiri ya.

2. Di routes kita update dengan menambahkan method edit dan update

```
resources :forum_threads, only: [:show, :new, :create, :edit, :update] do
    put :pinit, on: :member
    resource :forum_posts, only: [:create]
end
```

3. Di forum thread controller kita buat method dengan nama edit dan update

```
def edit
    @thread = ForumThread.find(params[:id])
end

def update
    @thread = ForumThread.find(params[:id])
    if @thread.update(resource_params)
        redirect_to forum_thread_path(@thread)
    else
        render 'edit'
    end
end
```

4. Kemudian tinggal kita buat formnya, yang saya lakukan adalah membuat form partian dengan nama `_form.html.erb` yang isinya saya ambil dari form `new` sebelumnya. Kenapa saya pindahkan? karena form `new` maupun `edit` itu sama persis, jadi lebih baik bikin satu file untuk dipanggil di manapun bisa (kasusnya adalah `new` dan `edit`).

```
<%= render 'form' %>
```
