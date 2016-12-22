What will the following code print? Why? Don't run it until you've attempted to answer.
```ruby
number = 7

if number
  puts "My favorite number is #{number}."
else
  puts "I don't have a favorite number."
end
```

---

`My favorite number is #{number}.`

In ruby, all values are either truthy or falsy. The only falsy values are `false` and `nil`. Therefore `7` will evaluate to `true` in a conditional.