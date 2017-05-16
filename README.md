## Static Site Example

Build the project

Create `amber_blog_development` table in mysql for now.

```mysql
CREATE TABLE posts (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  content TEXT,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);
```

```crystal
crystal deps update
crystal build --release ./examples/demo.cr
```
Run your new Amber server
```crystal
./demo.cr
```
Visit
```crystal
http://localhost:4000/index.html
```
