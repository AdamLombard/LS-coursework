What will the following code print? Why? Don't run it until you've attempted to answer.
```ruby
def meal
  puts 'Dinner'
  return 'Breakfast'
end

puts meal
```

---
```
Dinner
Breakfast
```

`Dinner` will be printed by the `puts` in the method. The other `puts` is printing the return value of the method; since the method returns `Breakfast`, `Breakfast` will be printed.
