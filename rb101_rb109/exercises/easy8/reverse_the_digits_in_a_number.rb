def reversed_number(number)
  array = number.digits
  reversed_array = []
  count = 0
  while count < array.size
    reversed_array << array[count]
    count += 1
  end
  reversed_array.join.to_i
end

reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # No leading zeros in return value!
reversed_number(12003) == 30021
reversed_number(1) == 1
