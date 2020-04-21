# Membuat Fitur Create Post dan Perkenalan Nested Resource

Untuk menyimpan forum post yang dikirim maka kita tentunya perlu controller, maka kita buat controller `forum_posts_controller.rb` dan di dalamnya kita buat method `create`.

##Sekarang kita berpindah ke route.
Sebenarnya kita bisa saja membuat route seperti ini :

```
resources :forum_posts, only: [:create]
```

namun jika kita memakai cara di atas nanti saat kita mengirim data dari form selain mengirim content-nya kita juga perlu mengirim `id` thread, artinya bahwa post itu untuk thread yang mana.

Ada cara lain yang lebih efisien dari cara di atas, yaitu kita gunakan <b>Nested Resource</b>. Jadi dengan menggunakan nested resource ini kita bisa mengirim id thread secara otomatis. Contoh ini pas sekali karena post (komentar) ini ada di dalam thread. Kita juga bisa cari study kasus yang lain yang pas untuk kita terapkan nested resource.

Di routes kita ubah kode resource forum_threads menjadi seperti ini :

<b>
```
resources :forum_threads, only: [:show, :new, :create] do
    resource :forum_posts, only: [:create]
end
```
</b>

Jika kita cek melalui info routes (http://localhost:3000/rails/info/routes atau memakai console) maka akan ada satu route yang bernama `forum_thread_forum_posts_path` yang mana akan mengarah ke controller forum post di action create namun kita secara otomatis mendapatkan id dari forum thread, bisa dilihat path `/forum_threads/:forum_thread_id/forum_posts(.:format)`
<br />
Kemudian kita beralih di view forum thred di show karena kita akan membuat form post di sini, kita kasih kode :

```
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
```

`form_for [@thread, @post] do |f|` kita buat form_for berupa array karena kita membuat nested form. Dan urutannya adalah form thread lalu form post (karena form post ada di dalam form thread).

Kalu dijalankan akan error yang karena `@post` nilainya nil (atau tidak mendfinisikan variabel post). Nah kita buat variabel `@post` ini di `method show` pada controller forum thread.

```
def show
    @thread = ForumThread.find(params[:id])
    @post = ForumPost.new
end
```

Kemudian tinggal kita tangkap datanya dan kita simpan. Maka kita buat kode ini di method create pada controller forum post :

```
def create
    @thread = ForumThread.find(params[:forum_thread_id])
    @post = ForumPost.new(resource_params)

    @post.forum_thread = @thread
    @post.user = User.first

    @post.save
    redirect_to forum_thread_path(@thread) #ini didapat dari forum thread ya bukan @thread yang di atas
end

private
def resource_params
    params.require(:forum_post).permit(:content)
end
```
