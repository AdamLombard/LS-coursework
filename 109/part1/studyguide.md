# General Notes

## Local Variable Scope

###### How do local variables interact with blocks?
- Variables initialized outside of a block are accessible inside the block
  - Variables modified inside a block are also modified outside the block
- Variables initialized inside of a block are NOT accessible outside the block

###### How do local variables interact with methods?
- Local variables are not available inside methods.
  - If a variable is passed to a method, it initializes a new variable that is scoped to the method.

---

## Passing Objects into Methods

###### How can this permanently change the object?
- If you pass an object to a method, the two variables (the parameter passed to the method and the variable representing the argument received by the method) point to the same object in memory. Therefore mutating actions will affect both variables, even though the variables are scoped differently.

## Implicit Return Value of Methods and Blocks
- If there is no explicit return value in a block (or method) -- i.e., `return var` -- then the value yielded by the last expression in the block (or method) will be returned.

## ```puts``` vs ```return```
- `puts` is a method in Ruby's Kernel module that takes one or more strings as arguments, and sends them to the std output.
- `return` is a Ruby keyword that returns control of the program to the caller, along with any value yielded by an expression passed to it. Returns `nil` if no expression is passed.

## Working with Collections

(Array, Hash, String), and popular collection methods (each, map, select, etc). Study these methods carefully.

_(NOTE: In the prep videos, Chris mentioned that they will ask us to be very precise in how we define these...)_

When thinking about how to define a method, consider these key attributes -- return value, side effects, output.
###### Arrays
- `each` - (iteration) For each element in the array, performs the action specified in the block. Returns the original array.
- `map` - (transformation) Returns a new array based on the block's return value. Each element is transformed based on the return value. arr.map returns an array of arr.size.
- `select` - (selection) Returns a new array based on the block's *return value*. If the return value of the block evaluates to true (or, is truthy), then the element is selected. The select method is a filter, allowing you to select a subset of elements from an array, based on criteria you provide.

###### Hashes
- `each` - (iteration) Calls a block once for each key in the hash, passing the key-value pair as parameters. Returns the original hash.
- There is no true `map` method for Ruby hashes. Calling `map` on a Ruby hash will instead invoke `#map` from the Enumerable mixin, which invokes `Hash#each` to iterate over each key-value pair in the hash, executes the block passed to `#map` and returns an **array** of values yielded by the block. So you get an array back, not a hash.
- `select` - (selection) Returns a new hash consisting of original hash key-value pairs for which the block returns true.

###### strings
- `each_char` - (iteration) Passes each character in a string to the given block. Returns the original string.
- There is no true `map`-style method for Ruby strings. Instead, calling `#chars` on a string will give you an array of the characters, which you can then call `map` on to perform a transformation.
- There is no true `select`-style method for Ruby strings. Instead, calling `#chars` on a string will give you an array of the characters, which you can then call `select` on to perform a selection.


## Variables as Pointers
- Variables are pointers to physical space in memory. The `=` operator assigns variables to addresses in memory.

## ```false``` vs ```nil```
- In Ruby, the native boolean values are `true` and `false`.
- `nil` evaluates to `false` wherever a boolean evaluation is required. `nil` and `false` are the 'falsy' values
- ALL other values are 'truthy' -- they evaluate to `true` whenever a boolean evaluation is required.
