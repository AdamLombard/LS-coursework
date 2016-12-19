def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

def prompt(text)
  puts ">> #{text}"
end

prompt "Let's divide some numbers!!!"

numerator = nil
loop do
  prompt "Please enter the numerator:"
  numerator = gets.chomp
  break if valid_number?(numerator)
  prompt "Cheater! '#{numerator}' is not a valid numerator!"
end

denominator = nil
loop do
  prompt "Please enter the denominator (cannot be 0):"
  denominator = gets.chomp
  break if valid_number?(denominator) && !(denominator.to_i == 0)
  prompt "Cheater! '#{denominator}' is not a valid denominator!"
end

result = numerator.to_i / denominator.to_i
prompt "#{numerator} / #{denominator} is #{result}"
