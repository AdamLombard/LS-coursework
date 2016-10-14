# Loan Calculator

# METHODS
# format a message
def prompt(message)
  puts "=> #{message}"
end

# get user input
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

# validate input
def integer?(value)
  /^\d+$/.match(value)
end

def float?(value)
  /\d/.match(value) && /^\d*\.?\d*$/.match(value)
end

def valid_number?(value)
  integer?(value) || float?(value)
end

# CONSTANTS
SEPARATOR = "-----------------------------------------------------"

# LOAN CALCULATOR
# welcome the user
prompt(SEPARATOR)
prompt("Welcome to the Loan-o-Matic 3000!")

# main loop
loop do
  prompt(SEPARATOR)

  # collect loan amount
  message = "Please enter your loan amount:"
  loan_amount = request_input(message).to_f

  # collect loan duration
  message = "Please enter your loan duration, in number of months:"
  loan_duration = request_input(message).to_i

  # collect interest rate
  message = "Please enter your APR (2.5 for 2.5%, etc.):"
  apr = request_input(message).to_f
  annual_interest_rate  = (apr / 100)
  monthly_interest_rate = (annual_interest_rate / 12)

  # calculate monthly payment
  p = loan_amount
  j = monthly_interest_rate
  n = loan_duration
  monthly_payment = p * (j / (1 - (1 + j)**-n))

  # format results
  total_payments  = monthly_payment * loan_duration
  monthly_payment = format('%02.2f', monthly_payment)
  total_payments  = format('%02.2f', total_payments)
  loan_amount     = format('%02.2f', loan_amount)

  # display results
  prompt(SEPARATOR)
  prompt("Loan amount:            $#{loan_amount} at #{apr}%")
  prompt("Monthly payments:       $#{monthly_payment} for #{n} months")
  prompt("Total of all payments:  $#{total_payments}")

  # query user regarding another calculation
  puts
  prompt("Would you like to calculate another loan? (Y/N)")
  response = gets.chomp
  break unless response.downcase.start_with?('y')
end

# thank user
puts
prompt("Thank you for using the Loan-o-Matic! Bye!")
