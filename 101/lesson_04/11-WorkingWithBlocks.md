```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```
---
Map out a detailed breakdown for the above example using the same approach as the previous two examples. What do you think will be returned and what will be the side-effects?
---
The `Array#map` method is being called on the multi-dimensional array `[[1,2], [3,4]]`. Each inner array is passed to the block, where it assigned to the local variable `arr`. In the block, the `Array#first` method is called on `arr`, which returns the object at index `0` -- first `1`, then `3` in this case. The result is returned to the `puts` method, which outputs a string representation of the object. Next, the `Array#first` method is again called on `arr`, returning the object at index `0`. Since this is the last line in the block, this object is returned to the `Array#map` method. So, ultimately, `[1, 3]` will be returned by the code above.