# Create a simple tip calculator. The program should prompt for a bill amount 
# and a tip rate. The program must compute the tip and then display both the 
# tip and the total amount of the bill.

# Bonus: Modify to always print results with 2 decimal places.

puts "How much is the bill?"
bill = gets.to_f
puts "What percentage would you like to tip?"
tip_percent = gets.to_f

tip   = (bill * (tip_percent / 100)).round(2)
total = (bill + tip).round(2)

puts "The tip is $#{format("%.2f", tip)}."
puts "The total is $#{format("%.2f", total)}."
