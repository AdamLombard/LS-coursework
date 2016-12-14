Assume you have the following code:

```ruby
s = 'abc def ghi,jkl mno pqr,stu vwx yz'
puts s.split.inspect
puts s.split(',').inspect
puts s.split(',', 2).inspect
```
What will each of the 3 puts statements print?

---
```ruby
puts s.split.inspect #=> 
["abc", "def", "ghi,jkl", "mno", "pqr,stu", "vwx", "yz"]
puts s.split(',').inspect #=> 
["abc def ghi", "jkl mno pqr", "stu vwx yz"]
puts s.split(',', 2).inspect #=> 
["abc def ghi", "jkl mno pqr,stu vwx yz"]
```