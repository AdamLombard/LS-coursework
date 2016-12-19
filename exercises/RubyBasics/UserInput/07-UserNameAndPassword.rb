USERNAME = 'admin'
PASSWORD = 'password'

loop do
  puts ">> Please enter your username:"
  username_attempt = gets.chomp
  puts ">> Please enter your password:"
  password_attempt = gets.chomp
  break if username_attempt == USERNAME && password_attempt == PASSWORD
  puts ">> Access denied!"
end

puts ">> Welcome!"