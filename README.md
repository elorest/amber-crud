## Amber Blog

Create `amber_blog_development` table in mysql for now.

```mysql
CREATE TABLE posts (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255),
  content TEXT,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);
```

Update dependencies and run.
```crystal
crystal deps update
crystal src/demo.cr
```
Visit
```crystal
http://localhost:4000/posts
```
