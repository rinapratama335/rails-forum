# Styling Pagination

1. Kita install gem bulma wil paginate

```
gem 'will_paginate-bulma', '~> 1.0'
```

2. Kita update pemanggilan willpaginate dengan menambahkan bulma

```
<%= will_paginate @threads, renderer: BulmaPagination::Rails %>
```
