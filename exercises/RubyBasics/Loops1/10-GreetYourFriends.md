Your friends just showed up! Given the following array of names, use a `for` loop to greet each friend individually.

```ruby
friends = ['Sarah', 'John', 'Hannah', 'Dave']
```

Expected output:

```
Hello, Sarah!
Hello, John!
Hello, Hannah!
Hello, Dave!
```
---
```ruby
friends = ['Sarah', 'John', 'Hannah', 'Dave']

for friend in friends
  puts "Hello, #{friend}!"
end

```