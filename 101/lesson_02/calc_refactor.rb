# Adding the messages YAML file was an interesting exercise,
# but it breaks any messages that aren't in the file, and I
# don't understand how to have variable messages in the YAML...
#
# I don't want to get bogged down on this right now, but I'll
# have to revist it someday...

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'es'

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def operation_to_message(op)
  msg_val = case op
            when '1'
              'Adding'
            when '2'
              'Subtracting'
            when '3'
              'Multiplying'
            when '4'
              'Dividing'
            end
  msg_val
end

# Calculator

prompt('welcome')

name = ''
loop do
  name = Kernel.gets.chomp.capitalize

  if name.empty?
    prompt('valid_name')
  else
    break
  end
end

prompt("Hi, #{name}!")

loop do # main loop
  number1 = ""
  loop do
    prompt('first_num_query')
    number1 = Kernel.gets.chomp

    if valid_number?(number1)
      break
    else
      prompt('wrong_num')
    end
  end

  number2 = ""
  loop do
    prompt('second_num_query')
    number2 = Kernel.gets.chomp

    if valid_number?(number2)
      break
    else
      prompt('wrong_num')
    end
  end

  operator_prompt = <<-message
  What operation would you like to perform?
  1) add
  2) subtract
  3) multiply
  4) divide
  message

  prompt(operator_prompt)

  operator = ''

  loop do
    operator = Kernel.gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result =  case operator
            when '1'
              number1.to_f + number2.to_f
            when '2'
              number1.to_f - number2.to_f
            when '3'
              number1.to_f * number2.to_f
            when '4'
              number1.to_f / number2.to_f
            end

  prompt("The result is #{result}.")

  prompt('go_again')
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('goodbye')
