### Example 3
```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```

---
Map out a detailed breakdown for the above example using the same approach as the previous two examples. What do you think will be returned and what will be the side-effects?

---
The `Array#map` method is being called on the multi-dimensional array `[[1,2], [3,4]]`. Each inner array is passed to the block, where it is assigned to the local variable `arr`. In the block, the `Array#first` method is called on `arr`, which returns the object at index `0` -- first `1`, then `3` in this case. The result is returned to the `puts` method, which outputs a string representation of the object. Next, the `Array#first` method is again called on `arr`, returning the object at index `0`. Since this is the last line in the block, this object is returned to the `Array#map` method. So, ultimately, `[1, 3]` will be returned by the code above.

---
### Example 4
```ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```
---
What will be output and what will be the value of `my_arr`?

---
Output:
```
# 18
# 7
# 12
```
Value of `my_arr`:
```
[[18, 7], [3, 12]]
```
...because the `Array#each` method returns the array passed into it.

---
### Example 5
```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```

---
What will the return value be in this example? 

---
```
# => [[2, 4], [6, 8]]
```

---
### Example 6
```ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]
```

---
What would happen if, instead of using `all?`, we used `any?`. Why would this affect the return value of `select`?

---
Using `Hash#any?` would cause both hashes to be returned, since the first hash includes a key/value pair for which the test would return true.

---
### Example 10
```ruby
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end
```

---
Work on breaking down each component and understanding the return value of each expression. What will be the final return value?

---
```
# = > [[[2, 3], [4, 5], [6, 7]]]
```
