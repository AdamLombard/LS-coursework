Modify the following loop so it iterates 5 times instead of just once.
```ruby
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  break
end
```

---

```ruby
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  break if iterations == 5
  iterations += 1
end
```
