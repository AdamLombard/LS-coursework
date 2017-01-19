# Common Ruby Method Briefs

This is a list of methods I find myself using a lot as I'm learning Ruby.

The descriptions are intentionally as brief as possible, so I can hold them in my tiny brain.

## Enumerable

### #all?
Tests each element and returns `true` if all tests evaluate to `true`. Opposite of `Enumerable#any`.
```ruby
[false, true].all? #=> fasle
[true, true].all? #=> true
['a', 'b'].any? { |e| e == 'b' } #=> false

{ a: 'a', b:'ab' }.all? { |k,v| v.length > 0 } #=> true
```

### #any?
Tests each element and returns `true` if any test evaluates to `true`. Opposite of `Enumerable#all`.
```ruby
[nil, false].any? #=> fasle
[nil, true].any? #=> true
['a', 'b'].any? { |e| e == 'b' } #=> true

{ a: 'a', b:'ab' }.any? { |k,v| v.length > 3 } #=> false
```

### #each_with_index
Passes each element to a block like #each, but also gives access to the index.
```ruby
['a', 'b'].each_with_index { |e,i| puts "#{e} : #{i}"}

# a : 0
# b : 
# => ['a', 'b']
```

### #include?
Returns `true` if the argument is included in the collection.
```ruby
[1,2,3].include?(2) #=> true
```
When called on a hash, checks keys _not_ values.
```ruby
{ a: "apple", b: "banana"}.include?("apple") #=> false

### #map
A transformation method. Returns a new array with the results of running the block once for each element in the original array.

### #sort
Returns a new array with elements sorted sequentially.

## Hash

### keys
Returns an array of keys from the hash.
```ruby
{ a: 'first', b: 'second' }.keys #=> [:a, :b]
```

### values
Returns an array of values from the hash.
```ruby
{ a: 'first', b: 'second' }.values #=> ["first", "second"]
```