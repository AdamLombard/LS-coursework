Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

Examples:
```ruby
puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]
```
All of the tests above should print `true`.

---

def digit_list(number)
  number.to_s.chars.map { |char| char.to_i }
end
