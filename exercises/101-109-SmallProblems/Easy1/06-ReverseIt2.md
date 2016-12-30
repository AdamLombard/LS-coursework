Write a method that takes one argument, a string containing one or more words, and returns the given string with all five or more letter words reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

Examples:
```ruby
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
```

---

```ruby
def reverse_words(string)
  words_reversed = []
  string.split.each do |word|
    word.reverse! if word.length >= 5
    words_reversed << word
  end
  words_reversed.join(' ')
end
```