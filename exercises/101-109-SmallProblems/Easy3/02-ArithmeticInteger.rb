# Write a program that prompts the user for two positive integers, and then 
# prints the results of the following operations on those two numbers: addition,
# subtraction, product, quotient, remainder, and power. Do not worry about 
# validating the input.

OPERATORS = [:+, :-, :*, :/, :%, :**]

puts "Please enter the first number:"
num1 = gets.to_i
puts "Please enter the second number:"
num2 = gets.to_i

OPERATORS.each do |operation|
  puts "#{num1} #{operation} #{num2} = #{num1.send(operation, num2)}"
end
