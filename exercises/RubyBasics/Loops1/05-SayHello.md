Modify the code below so `"Hello!"` is printed 5 times.
```ruby
say_hello = true

while say_hello
  puts 'Hello!'
  say_hello = false
end
```

---

```ruby
say_hello   = true
hello_count = 0

while say_hello
  puts 'Hello!'
  hello_count += 1
  say_hello = false if hello_count == 5
end
```