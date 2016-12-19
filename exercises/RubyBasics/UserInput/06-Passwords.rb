PASSWORD = 'password'

loop do
  puts ">> Please enter your password:"
  password_attempt = gets.chomp
  break if password_attempt == PASSWORD
  puts ">> Invalid password!"
end

puts ">> Welcome!"
