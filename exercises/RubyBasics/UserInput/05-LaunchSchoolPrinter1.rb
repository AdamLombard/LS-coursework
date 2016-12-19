num_of_lines = nil
loop do
  puts "How many lines of output do you want? (Enter a number >= 3):"
  num_of_lines = gets.chomp.to_i
  break if num_of_lines >= 3
  puts "What?! Just #{num_of_lines} lines?! No. I do not loop for less than 3..."
end

num_of_lines.times do |index|
  puts "#{index+1} - Launch School is the best!"
end
