# Build a program that randomly generates and prints Teddy's age. To get the 
# age, you should generate a random number between 20 and 200.

# Modify this program to ask for a name, and then print the age for that person. 
# For an extra challenge, use "Teddy" as the name if no name is entered.

puts "Whose birthday is it?"
name = gets.chomp.capitalize
name = 'Teddy' if name == ''

age_in_years = rand(20..200)

puts "#{name} is #{age_in_years} years old today!"
