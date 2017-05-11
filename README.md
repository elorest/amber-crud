## Static Site Example

Build the project

Create `amber_blog_development` table in mysql for now.

```mysql
CREATE TABLE crystals (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);
```

```crystal
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
