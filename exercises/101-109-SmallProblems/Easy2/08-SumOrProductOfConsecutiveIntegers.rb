# Write a program that asks the user to enter an integer greater than 0, then
# asks if the user wants to determine the sum or product of all numbers between 
# 1 and the entered integer.

num = 0
until num > 0
  puts "Please enter an integer greater than 0:"
  num = gets.to_i
end

operation = ''
until ['s','p'].include?(operation)
  puts "Please enter 's' to compute the sum, or 'p' to compute the product:"
  operation = gets.chomp.downcase

  case operation
  when 's'
    sum = (1..num).reduce(:+)
    puts "The sum of the integers between 1 and #{num} is #{sum}."
  when 'p'
    product = (1..num).reduce(:*)
    puts "The product of the integers between 1 and #{num} is #{product}."
  end
end
