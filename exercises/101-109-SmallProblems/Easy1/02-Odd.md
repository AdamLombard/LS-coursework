Write a method that takes one argument in the form of an integer or a float; this argument may be either positive or negative. This method should check if a number is odd, returning `true` if its absolute value is odd. You may assume that only integers are passed in as arguments.

Examples:
```ruby
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
```
Keep in mind that you're not allowed to use #odd? or #even? in your solution.

---
```ruby
def is_odd?(number)
  number % 2 == 1
end
```

---

If you weren't certain whether `%` were the modulus or remainder operator, how would you rewrite `#is_odd?` so it worked regardless?

---

```ruby
def is_odd?(number)
  number.abs % 2 == 1
end
```

---

The `Numeric#remainder` method performs a remainder operation in Ruby. Rewrite `#is_odd?` to use `Numeric#remainder` instead of `%`.

---
```ruby
def is_odd?(number)
  number.remainder(2).abs == 1
end
```