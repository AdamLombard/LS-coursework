def prompt(text)
  puts ">>#{text}"
end

def print_lines(num_of_lines)
  num_of_lines.times do |index|
    prompt "#{index+1} - Launch School is the best!"
  end
end


num_of_lines = nil
loop do
  prompt  "How many lines of output do you want? " \
          "(Enter a number >= 3, or 'Q' to quit):"
  num_of_lines = gets.chomp
  break if num_of_lines.downcase == 'q'
  
  num_of_lines = num_of_lines.to_i
  if num_of_lines >= 3
    print_lines(num_of_lines)
  else
    prompt  "What?! #{num_of_lines}?! No. " \
            "I do not loop for less than 3..."
  end
end

prompt "Thanks for looping with us!"
