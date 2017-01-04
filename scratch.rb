# Build a program that displays when the user will retire and how many years she
# has to work till retirement.
puts "What is your age?"
current_age = gets.to_i
puts "At what age do you want to retire?"
retire_age = gets.to_i

current_year = Time.now.year
years_until_retire = retire_age - current_age

puts "It's #{current_year}. " + \
     "You will retire in #{current_year + years_until_retire}."
puts "You only have #{years_until_retire} years of work left to go!"