### Exercise 1
What is the return value of the `select` method below? Why?
```ruby
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
```
---
```
#=> [1,2,3]
```
`#select` returns a new array of elements for whom the block evaluates to `true`. Since strings are a 'truthy' value in Ruby, returning `hi` at the end of the block means that every iteration will evaluate to `true`.
---

### Exercise 2
How does `count` treat the block's return value? How can we find out?
```ruby
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
```
---
Count returns the number of elements in the collection for whom the block evaluates to `true`. We can discover this by consulting the docs.
---

### Exercise 3
What is the return value of `reject`? Why?
```ruby
[1, 2, 3].reject do |num|
  puts num
end
```
---
```
#=> [1,2,3]
```
`#reject` returns elements from the collection for whom the block evaluates to `false`. Since `puts` returns `nil` and `nil` is a falsey value, all elements will be returned.
---

### Exercise 4
What is the return value of `each_with_object`? Why?
```ruby
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
```
---
```
#=> { "a" => "ant", "b" => "bear", "c" => "cat" }
```
`#each_with_object` receives an object as an argument, which is then modified by the block. In this case, we are creating a hash of key-value pairs, by making keys from the first character of each value.
---

### Exercise 5
What does `shift` do in the following code? How can we find out?
```ruby
hash = { a: 'ant', b: 'bear' }
hash.shift
```
---
By checking the docs, we can find that `#shift` destructively removes the first key-value pair in a hash, returning it as a two-item array. 
---

### Exercise 6
What is the return value of the following statement? Why?
```ruby
['ant', 'bear', 'caterpillar'].pop.size
```
---
`11` - because `Array#pop` destructively removes and returns the last element of an array (a String, in this case), and `String#size1 tells us it's length.
---

### Exercise 7
What is the block's return value in the following code? How is it determined?
```ruby
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
```
---
`true` - `Array#any?` returns `true` if the associated block returns `true` for any element iterated over. Since some of the numbers in this array will return `true` for `#odd?` and since that test is the last in the block, then `#any` will retrn true.
---

### Exercise 8
How does `take` work? Is it destructive? How can we find out?
```ruby
arr = [1, 2, 3, 4, 5]
arr.take(2)
```
---
By looking in the docs (and testing in `irb`, we see that `#take` is not destructive. It simply gets passed an integer "n" and returns the first "n" elements in the array.
---

### Exercise 9
What is the return value of `map`? Why?
```ruby
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```
---
`[nil, 'bear']`, because calling `#map` on a hash returns an array of values determined by running the block for each key-value pair in the original hash. In this case, the first block iteration returned `nil` because the condition for the `if` statement did not evaluate to `true`. It did for the second iteration, and returned the value `'bear'`.
---

### Exercise 10
What is the block's return value in the following code? Why?
```ruby
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
```
---
`[1, nil, nil]`, because the `if` statement in the block will evaluate to `true` for all values greater than 1, and the `puts` method returns a value of `nil`.
---

### Exercise 11
How would you order this array of number strings by descending numeric value?
```ruby
arr = ['10', '11', '9', '7', '8']
```
---
```ruby
arr.sort { |a, b| a.to_i <=> b.to_i }
```
---

### Exercise 12
How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?
```ruby
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysees', author: 'James Joyce', published: '1922'}
]
```
---
```ruby
books.sort_by { |book| book[:published]}
```
---

