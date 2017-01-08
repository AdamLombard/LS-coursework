# Write a program that will ask a user for an input of a word or multiple words 
# and give back the number of characters. Spaces should not be counted as a 
# character.

puts "Please enter one or more words:"
string       = gets.chomp
num_of_chars = string.delete(' ').length
puts "There are #{num_of_chars} characters in \"#{string}\"."
