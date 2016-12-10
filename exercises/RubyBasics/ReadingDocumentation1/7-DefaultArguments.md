```ruby
def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)
```

This method will print `[4, 5, 3, 6]` because of how Ruby differentiates between positional and default arguments. 

`a` will be assigned `4`, then we skip the params with defaults and `d` will be assigned `6`, then back to `b` which will ignore its default and grab `5`, and lastly `c` will see no value being passed in and so it uses its default. At least I THINK that's how this is working...

From LS: "...positional arguments are filled out first, then the default arguments are set with any values supplied, and, finally, default values are applied to anything remaining."

This is a wierd feature. Not super intuitive, for me at least.