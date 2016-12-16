Using a `while` loop, print 5 random numbers between 0 and 99. The code below shows an example of how to begin solving this exercise.
```ruby
numbers = []

while <condition>
  # ...
end
```

Example output (your numbers will most likely be different):

```
62
96
31
16
36
```

---
```ruby
numbers = []

while numbers.size < 5
  numbers << rand(100)
end

puts numbers
```

or...

```ruby
5.times { puts rand(100) }
```