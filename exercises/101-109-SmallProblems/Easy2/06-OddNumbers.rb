# Print all odd numbers from 1 to 99, inclusive. All numbers should be printed 
# on separate lines.
(1..99).each { |i| puts i if i.odd? }

# Furthur Exploration: Use a different technique.
1.step(99, 2) { |i| puts i }
