Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers.

Examples:
```ruby
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
```
The tests above should print true.

---

```ruby
def average(numbers)
  numbers.reduce(:+) / numbers.length
end
```

---

Currently, the return value of `average` is an `Integer`. When dividing numbers, sometimes the quotient isn't a whole number, therefore, it might make more sense to return a `Float`. Can you change the return value of average from an `Integer` to a `Float`?

---
```ruby
def average(numbers)
   (numbers.reduce(:+).to_f / numbers.length.to_f)
end
```