Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

Examples:
```ruby
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
```
The tests above should print true.

---
```ruby
def stringy(number)
  (1..number).map { |num| num.odd? '1' : '0' }.join('')
end
```

---

Modify `stringy` so it takes an optional argument that defaults to `1`. If the method is called with this argument set to `0`, the method should return a String of alternating 0s and 1s, but starting with `0` instead of `1`.

---

```ruby
def stringy(number, odds_char = 1)
  odds_char = 0 if odds_char != 1
  evens_char = (odds_char - 1) * -1
  (1..number).map { |num| num.odd? ? odds_char : evens_char }.join('')
end
```