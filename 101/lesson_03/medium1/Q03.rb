# the following code will error:
# puts "the value of 40 + 2 is " + (40 + 2)
# because we are trying to concatenate two different data types.
# two potential fixes:

puts "the value of 40 + 2 is " + (40 + 2).to_s

puts "the value of 40 + 2 is #{(40 + 2)}"
