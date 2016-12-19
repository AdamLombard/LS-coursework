def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def prompt(text)
  puts ">>#{text}"
end

def get_integer
  loop do
    prompt "Please enter an integer (positive or negative) :"
    user_input = gets.chomp
    return user_input.to_i if valid_number?(user_input)
    prompt "'#{user_input}' is invalid. Non-zero integers only, please."
  end
end

first_integer  = ''
second_integer = ''
loop do
  first_integer  = get_integer
  second_integer = get_integer
  break if first_integer * second_integer < 0
  prompt "Sorry. One integer must be positive, and one negative."
  prompt "Please start over."
end

sum = first_integer + second_integer
prompt "#{first_integer} + #{second_integer} = #{sum}"
