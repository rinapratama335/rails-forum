# Membuat Form Pencarian

Pertama kita buat controller untuk pencariannya di form thread controller method index, soalnya di meteri sebelumnya belum saya cantumkan

```
def index
    if params[:search]
        @threads = ForumThread.where('title like ?', "%#{params[:search]}%").paginate(per_page: 5, page: params[:page])
    else
        @threads = ForumThread.order(sticky_order: :asc).order(id: :desc).paginate(per_page: 5, page: params[:page])
    end
end
```

Kemudian di navigasi kita buat form pencariannya menjadi seperti ini :

```
<%= form_tag root_path, method: :get, class: "field is-grouped navbar-item" do %>
    <p class="control is-expanded">
        <%# <input class="input" type="text" placeholder="Find a repository"> %>
        <%= text_field_tag :search, nil, class: "input" %>
    </p>
    <p class="control">
        <%# <a class="button is-primary">
            Search
        </a> %>
        <%= submit_tag "Search", class: "button is-primary" %>
    </p>
<% end %>
```

`method: :get` kita tambahkan karena defautnya adalah post
