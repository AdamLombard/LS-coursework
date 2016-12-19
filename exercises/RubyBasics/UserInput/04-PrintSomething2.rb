user_input = nil
loop do
  puts "Would you like me to print 'something'? (y/n)"
  user_input = gets.chomp.downcase
  break if ['y', 'n'].include?(user_input)
  puts "I can't understand you! (Please enter 'y' or 'n'...)"
end
puts "something :)" if user_input == 'y'
