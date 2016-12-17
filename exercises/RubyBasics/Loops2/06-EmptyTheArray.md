Given the array below, use `loop` to remove and print each name. Stop the loop once `names` doesn't contain any more elements.

```ruby
names = ['Sally', 'Joe', 'Lisa', 'Henry']
```

Keep in mind to only use `loop`, not `while`, `until`, etc.

---
First to last:

```ruby
names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift
  break if names.empty?
end
```

Last to first:

```ruby
names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.pop
  break if names.empty?
end
```