### Exercise 1

For each of these collection objects demonstrate how you would reference the letter 'g'.

```ruby
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
```

---
```ruby
arr1[2][1][3]

arr2[1][:third][0]

arr3[2][:third][0][0]

hsh1['b'][1]

hsh2[:third].keys[0]
```

---
### Exercise 2

For each of these collection objects where the value `3` occurs, demonstrate how you would change this to `4`.

```ruby
arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
```

---
```
arr1[1][1] = 4

arr2[2] = 4

hsh1[:first][2][0] = 4

hsh2[['a']][:a][2] = 4
```

---
### Exercise 3

Given this code, what would be the final values of `a` and `b`? Try to work this out without running the code.

```ruby
a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a
```

---
```
a #=> 2
b #=> [3, 8]
```

---
### Exercise 4

Using the `each` method, write some code to output all of the vowels from the strings.

```ruby
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
```

---
```
VOWELS = 'aeiou'

hsh.each do |_, words|
  words.each do |word|
    word.chars.each do |letter|
      puts letter if VOWELS.include?(letter)
    end
  end
end
```

---
### Exercise 5

Given this data structure, return an new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

```ruby
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
```

---
```
arr.map do |sub_arr|
  sub_arr.sort do |a, b|
    b <=> a
  end
end
```

---
### Exercise 6

Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

```ruby
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
```

---
```
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr.map do |hash|
  incremented_values = {}
  hash.each do |k, v|
    incremented_values[k] = v + 1
  end
  incremented_values
end
```

---
### Exercise 7