What will the following code print? Why? Don't run it until you've attempted to answer.
```ruby
def count_sheep
  5.times do |sheep|
    puts sheep
  end
  10
end

puts count_sheep
```

---

```
0
1
2
3
4
10
```

The `#times` block will print its iterators -- 0 to 4. Then the method returns its last evaluated line; in this case the integer `10`. That is printed by the `puts` on line 8. 