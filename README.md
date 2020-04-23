# Membuat Sticky Thread Action

Kali ini kita akan buat tombol untuk untuk mengupdate stycky_order sebuah thread.

Pertama buat terlebih dahulu method-nya, di controller forum thread :

```
def pinit
    @thread = ForumThread.find(params[:id])
    @thread.pinit!
    redirect_to root_path
end
```

`@thread.pinit!` artinya memanggil method `pinit!` di model forum thread yang isinya adalah :

```
def pinit!
    self.sticky_order = 1
    self.save
end
```

Karena method `pinit` di controller di atas bukan method yang sewajarnya maka di routenya juga harus dibuat secara manual, dan ini dimasukkan ke dalam resource `:forum_threads` :

```
resources :forum_threads, only: [:show, :new, :create] do
    put :pinit, on: :member
    resource :forum_posts, only: [:create]
end
```

`put :pinit, on: :member` ini disebut member route. `:member` artinya method ini berlaku pada satu data tertentu. Makanya jika kita lihat para route paramsnya akan seperti ini : `/forum_threads/:id/pinit`. Dia kan memberikan `:id` pada thread yang akan kita pinit.

Kemudian tinggal kita buat button-nya deh.

```
<div class="action">
    <%= link_to "Pin It", pinit_forum_thread_path(t), class: "button is-primary", method: :put %>
</div>
```
