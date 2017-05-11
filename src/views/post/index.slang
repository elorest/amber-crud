div.row
  div.col-sm-11
    h2 Posts
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/posts/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Title
        th Content
        th Actions
    tbody
    - posts.each do |post|
      tr
        td = post.title
        td = post.content
        td
          span
            a.btn.btn-primary.btn-xs href="/posts/#{ post.id }" read
            a.btn.btn-success.btn-xs href="/posts/#{ post.id }/edit" edit
            a.btn.btn-danger.btn-xs href="/posts/#{ post.id }?_method=delete" onclick="return confirm('Are you sure?');" delete
