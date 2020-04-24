# Pagination

Kali ini kita akan belajar hal baru yaitu tentang paginasi. Paginasi ini menurut saya adalah sesuatu yang penting untuk kita terapkan.

Bayangkan apabila kita memiliki ratusan thread yang sudah ada dan itu ditampilkan semua. Selain itu akan memperlambat website karena kita me-load data sekaligus, user juga aka kerepotan karen scrol terus menerus.

1. Instal gem will_paginate

```
gem 'will_paginate', '~> 3.3'
```

2. Kita apply paginate ke dalam forum treads controller pada method index

```
@threads = ForumThread.order(sticky_order: :asc).order(id: :desc).paginate(per_page: 5, page: params[:page])
```

Ini artinya adalah kita membuat paginate dengan tampilan data per page adalah 5 (`perpage: 5`). parameter `page: params[:page]` adalah untuk penomoran halaman. Jadi saat kita ada di page pertama dan ingin berpindah ke page kedua maka parameter tersebut akan menghandle-nya.

3. Kita panggil will_paginate di halaman index.html.erb views forum thread

```
<%= will_paginate @threads %>
```

`@thread` di sini adalah nama object yang kita buat saat di controller yang kita bikin pagination-nya.
