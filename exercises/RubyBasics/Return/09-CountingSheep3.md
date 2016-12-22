What will the following code print? Why? Don't run it until you've attempted to answer.
```ruby
def count_sheep
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return
    end
  end
end

p count_sheep
```

---

```
0
1
2
nil
```

In this case there is an explicit `return` out of the `#times` block. Since `return` with no parameters returns `nil`, that is printed.