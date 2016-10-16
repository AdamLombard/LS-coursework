def prompt(message)
  puts "=> #{message}"
end

def request_input(message)
  response = ''
  loop do
    prompt(message)
    response = gets.chomp.delete("$,%")
    break if valid_number?(response) && response.to_f > 0
    prompt("! - Please enter a number greater than zero...")
  end
  response
end

def integer?(value)
  /^\d+$/.match(value)
end

def float?(value)
  /\d/.match(value) && /^\d*\.?\d*$/.match(value)
end

def valid_number?(value)
  integer?(value) || float?(value)
end

def continue?
  validate_yn == 'y' ? TRUE : FALSE
end

def validate_yn
  yes_no = ''
  prompt("Would you like to calculate another loan? (Y/N)")
  loop do
    yes_no = gets.chomp.downcase
    break if yes_no == 'y' || yes_no == 'n'
    prompt("Please reply with 'Y' or 'N'...")
  end
  yes_no
end

def clear_screen
  system('clear') || system('cls')
end

SEPARATOR = "-----------------------------------------------------"

clear_screen
prompt(SEPARATOR)
prompt("Welcome to the Loan-o-Matic 3000!")

loop do
  prompt(SEPARATOR)

  message = "Please enter your loan amount:"
  amount = request_input(message).to_f

  message = "Please enter your loan duration, in number of months:"
  duration = request_input(message).to_f

  message = "Please enter your APR (2.5 for 2.5%, etc.):"
  apr           = request_input(message).to_f

  annual_rate     = (apr / 100)
  monthly_rate    = (annual_rate / 12)
  growth_factor   = (1 - (1 + monthly_rate)**-duration)
  monthly_payment = amount * (monthly_rate / growth_factor)
  total_payments  = monthly_payment * duration

  amount          = format('%02.2f', amount)
  monthly_payment = format('%02.2f', monthly_payment)
  total_payments  = format('%02.2f', total_payments)

  prompt(SEPARATOR)
  prompt("Loan amount:            $#{amount} at #{apr}%")
  prompt("Monthly payments:       $#{monthly_payment} for #{duration} months")
  prompt("Total of all payments:  $#{total_payments}")

  puts
  break unless continue?
  clear_screen
end

clear_screen
prompt(SEPARATOR)
prompt("Thank you for using the Loan-o-Matic! Bye!")
prompt(SEPARATOR)
