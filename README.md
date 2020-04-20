# Membuat Tampilan Thread Detail

1. Kita buat route untuk deatil thread

```
resources :forum_threads, only: [:show]
```

2. Kita buat method baru di controller forum thread

```
def show
    @thread = ForumThread.find(params[:id])
end
```

3. Kemu dian kita buat file di dalam folder forum thread dengan nama `show.html.erb`

4. Buat link di file index pada title yang mana akan mengarahkan ke show

```
<%= link_to t.title.titleize, forum_thread_path(t) %>
```
