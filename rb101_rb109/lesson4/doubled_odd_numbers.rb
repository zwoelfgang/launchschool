my_numbers = [1, 4, 3, 7, 2, 6]

def multiply(numbers, multiplier)
  multiplied_numbers = []
  counter = 0

  loop do
    if counter.odd?
      current_number = numbers[counter] * multiplier
    else
      current_number = numbers[counter]
    end

    multiplied_numbers << current_number
    counter += 1

    break if counter == numbers.size
  end
  multiplied_numbers
end

p multiply(my_numbers, 3)