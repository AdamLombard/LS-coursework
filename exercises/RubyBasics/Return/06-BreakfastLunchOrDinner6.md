What will the following code print? Why? Don't run it until you've attempted to answer.
```ruby
def meal
  return 'Breakfast'
  'Dinner'
  puts 'Dinner'
end

puts meal
```

---

`Breakfast`

The method returns the string `Breakfast` to the `puts` method, so it will be printed.