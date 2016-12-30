Write a method that takes two arguments -- a string and a positive integer -- and prints the string as many times as the integer indicates.

Example:
```ruby
repeat('Hello', 3)
```

Output:
```
Hello
Hello
Hello
```

---

```ruby
def repeat(string, number)
  number.times { puts string }
end

repeat('Howdy!', 7)
```