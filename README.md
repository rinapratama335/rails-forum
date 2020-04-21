# Menyimpan Data Thread Ke Database

1. Kita buat method create di forum thread controller

```
def create
    @thread = ForumThread.new(resource_params)
    @thread.user = User.first
    if @thread.save
        puts "Berhasil Disimpan"
    else
        puts @thread.errors.full_messages
    end
    redirect_to root_path
end
```

2. Kemudian kita buat method resources params

```
private
def resource_params
    params.require(:forum_thread).permit(:title, :content)
end
```

3. Untuk menampilkan data forum thread berdasarkan thread terbaru maka di method index kita buat tampilan data bersasarkan id secara descending

```
def index
    @threads = ForumThread.order(id: :desc)
end
```
