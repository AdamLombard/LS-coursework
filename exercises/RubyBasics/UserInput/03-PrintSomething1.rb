puts "Would you like me to print 'something'? (y/n)"
user_input = gets.chomp.downcase
puts "something :)" if user_input == 'y'