Modify the following code so that double-quotes are used instead of single-quotes.
```ruby
puts 'It\'s now 12 o\'clock.'
```
Expected output:
```
It's now 12 o'clock.
```

---

```ruby
puts "It's now 12 o'clock."
```

---

What about strings that contain double- and single-quotes? How would you write those using the alternate syntax?

---

```ruby
s1 = "A \"double\" and a 'single'."
s2 = %Q(A "double" and a 'single'.)

s3 = 'A "double" and a \'single\'.'
s4 = %q(A "double" and a 'single'.)

puts s1 #=> A "double" and a 'single'.
puts s2 #=> A "double" and a 'single'.
puts s3 #=> A "double" and a 'single'.
puts s4 #=> A "double" and a 'single'.
```