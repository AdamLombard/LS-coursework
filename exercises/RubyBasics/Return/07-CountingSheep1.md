What will the following code print? Why? Don't run it until you've attempted to answer.
```ruby
def count_sheep
  5.times do |sheep|
    puts sheep
  end
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
5
```

The method uses `#times` to loop and print the iterator five times, so 0 through 4 will be printed.
`#times` also returns the initial integer. In this case that is `5`. The return value is printed on line 7, so `5` will also be printed.