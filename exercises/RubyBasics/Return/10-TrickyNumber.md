What will the following code print? Why? Don't run it until you've attempted to answer.
```ruby
def tricky_number
  if true
    number = 1
  else
    2
  end
end

puts tricky_number
```
---
`1`

With the explicit `true` conditional in the `if` statement of the method, the `number = 1` assignment will ALWAYS be the last line evaluated in the method block. Since variable assignment returns the value it was assigned to, `1` will be printed.