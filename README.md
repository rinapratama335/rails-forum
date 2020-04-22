# Conditional Rendering Untuk User Menu

Di navbar bagian login, register dan logout kita perkondisian dengan kode seperti ini :

```
<div class="navbar-end">
    <div class="navbar-item"><%= user_signed_in? ? current_user.name : 'Hello, Guest' %></div>
    <% if user_signed_in? %>
        <div class="navbar-item">
            <div class="buttons">
                <%= link_to "Sign Out", destroy_user_session_path, method: :delete, class: "button is-danger" %>
            </div>
        </div>
    <% else %>
        <div class="navbar-item">
            <div class="buttons">
                <%= link_to "Sign Up", new_user_registration_path, class: "button is-primary" %>
                <%= link_to "Sign In", new_user_session_path, class: "button is-primary" %>
            </div>
        </div>
    <% end %>
</div>
```

Method `user_signed_in?` adalah method bawaan dari `devise` (di awal kita sudah memakai gem devise). Sedangkan `current_user` adalah method devise yang digunakan untuk mengambil user yang sedang login.
