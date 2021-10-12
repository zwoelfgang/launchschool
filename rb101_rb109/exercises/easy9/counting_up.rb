def sequence(number)
  array = []
  number.times do |num|
    array << num + 1
  end
  array
end

sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]
