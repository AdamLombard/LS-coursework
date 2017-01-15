def multiply(numbers, multiplier)
  multiplied_nums = []
  counter = 0

  loop do
    break if counter == numbers.size
    multiplied_nums << numbers[counter] * multiplier
    counter += 1
  end

  multiplied_nums
end

