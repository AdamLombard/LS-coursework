statement = "The Flintstones Rock"

letter_counts = {}
letters = ('A'..'z').to_a
letters.each do |letter|
  letter_count = statement.scan(letter).count
  letter_counts[letter] = letter_count if letter_count > 0
end

puts letter_counts
