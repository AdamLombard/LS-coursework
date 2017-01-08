loop do
  number = rand(1..10)   # a random number between 1 and 10
  puts "Hello! #{number}"
  if number == 5
    puts 'Exiting...'
    break
  end
end
