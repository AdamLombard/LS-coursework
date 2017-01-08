# Write a program that solicits 6 numbers from the user, then prints a message 
# that describes whether or not the 6th number appears amongst the first 5 
# numbers.

ORDINALS = %w(1st 2nd 3rd 4th 5th last)

numbers = []
ORDINALS.each do |ordinal|
  puts "Enter the #{ordinal} number:"
  numbers << gets.to_i
end

last_num  = numbers.pop
inclusion = numbers.include?(last_num) ? 'appears' : 'does not appear'
puts "#{last_num} #{inclusion} in #{numbers}."
