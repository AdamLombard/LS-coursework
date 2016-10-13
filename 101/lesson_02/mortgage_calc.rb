# METHODS -----

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
    if valid_number?(response) && response.to_f > 0
      break
    else
      prompt("! - Please enter a number greater than zero...")
    end
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


# LOAN CALCULATOR -----

# welcome the user
prompt("Welcome to the Loan-o-Matic Mortgage Calculator 3000!")
prompt("-----------------------------------------------------")

# main loop
loop do
  # collect loan amount
  message = "Please enter your loan amount:"
  loan_amount = request_input(message).to_f

  # collect loan duration
  message = "Please enter your loan duration, in number of months:"
  loan_duration = request_input(message).to_i

  # collect interest rate
  message = "Please enter your annual interest rate: (2.5 for 2.5%, etc.)"
  annual_interest_rate  = (request_input(message).to_f / 100)
  monthly_interest_rate = (annual_interest_rate / 12)

  # calculate monthly payment
  p = loan_amount
  j = monthly_interest_rate
  n = loan_duration
  monthly_payment = p * (j / (1 - (1 +j)**-n))
  prompt("Your monthly payments will be: $#{format('%02.2f', monthly_payment)}")
  prompt("You will pay $#{format('%02.2f', monthly_payment * loan_duration)} over the life of your $#{format('%02.2f', loan_amount)} loan.")

  # query user regarding another calculation
  puts
  prompt("Would you like to calculate another loan? (Y/N)")
  response = gets.chomp
  break unless response.downcase.start_with?('y')
end

# Thank user and end program
puts
prompt("Thank you for using the Loan-o-Matic! Bye!")
