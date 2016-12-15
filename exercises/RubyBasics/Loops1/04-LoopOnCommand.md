Modify the code below so the loop stops iterating when the user inputs 'yes'.
```ruby
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
end
```

---

```ruby
answer = ''
while answer != 'yes' do
  puts 'Should I stop looping?'
  answer = gets.chomp
end
```