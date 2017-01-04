# Build a program that asks a user for the length and width of a room in meters 
# and then displays the area of the room in both square meters and square feet.
#
# Note: 1 square meter == 10.7639 square feet
#
# Do not worry about validating the input at this time.
SQMETER_IN_FEET = 10.7639

puts "Enter the length of the room in meters:"
length = gets.to_f
puts "Enter the width of the room in meters:"
width = gets.to_f

area_in_meters = length * width
area_in_feet   = (area_in_meters * SQMETER_IN_FEET)

puts "The area of the room is #{area_in_meters.round(2)} " + \
     "sq. meters (#{area_in_feet.round(2)} sq. feet)."


# Modify this program to ask for the input measurements in feet, and display the
# results in square feet, square inches, and square centimeters.
SQFOOT_IN_INCHES      = 144
SQFOOT_IN_CENTIMETERS = 929.03

puts "Enter the length of the room in feet:"
length = gets.to_f
puts "Enter the width of the room in feet:"
width = gets.to_f

area_in_ft = (length * width)
area_in_in = (area_in_ft * SQFOOT_IN_INCHES)
area_in_cm = (area_in_ft * SQFOOT_IN_CENTIMETERS)

puts "Room Area:"
puts "  #{area_in_ft.round(2)} sq. feet, or..."
puts "  #{area_in_in.round(2)} sq. inches, or..."
puts "  #{area_in_cm.round(2)} sq. centimeters"
