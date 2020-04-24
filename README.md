# Implementasi Delete Thread Dependent

Pembahasan ini adalah implementasi dari apa yang sudah kita buat sebelumnya, yaitu delete thread dependent. Nah yang akan kita lakukan adalah membuat button delete dan menggunakan fungsi delete dapat bekerja di situ.

1. Buat button hapusnya

```
<div class="action-edit">
    .
    .
    <%= link_to "Delete", forum_thread_path(@thread), class: "button is-warning", data: {confirm: 'Anda yakin mau menghapus?'}, method: :delete %>
</div>
```

2. Di route kita tambahakan destroy

```
resources :forum_threads, only: [:show, :new, :create, :edit, :update, :destroy] do .....
.
.
```

3. Masuk ke forum threads controller, kita tambah method destroy

```
def destroy
    @thread = ForumThread.friendly.find(params[:id])
    authorize @thread

    @thread.destroy

    redirect_to root_path, notice: 'Thread telah dihapus'
end
```

4. Karena yang bisa melakukan hapus adalah hanya admin, maka di forum thread policy kita buat method untuk mengecek apakah yang melakukan destriy ini admin atau bukan

```
def destroy?
    user.admin?
end
```

5. Sakalian jangan lupa untuk mengupdate kode untuk create post dengan menambahkan friendly_id karena pada materi sebelumnya kita terlewat

```
@thread = ForumThread.friendly.find(params[:forum_thread_id])
```
