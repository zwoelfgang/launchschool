def sequence(count, number)
  array = []
  if count > 0
    array << number
    (count - 1).times do |iterator|
      array << array[iterator] + number
    end
  end
  array
end

sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []
