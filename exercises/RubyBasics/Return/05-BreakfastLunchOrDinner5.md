What will the following code print? Why? Don't run it until you've attempted to answer.
```ruby
def meal
  'Dinner'
  puts 'Dinner'
end

p meal
```

---
`Dinner`
`nil`

The method will print `Dinner`, but the return value of `p` is `nil`. Since the method is called by `p`, `nil` will also be printed.